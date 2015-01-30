package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class ChannelController extends BaseController { 

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:['PUT','POST'],
        update:['POST','PUT'], 
        delete:'POST',
        undelete:'POST',
        getByCode:'GET',
        shortList:'GET',
        customQuery:'GET'
    ]

    def index(Integer max) { 
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Channel.list(params), model:[channelInstanceCount: Channel.count()]
        } 
        else {
            respond Channel.findAllByRecStatus(params.recStatus, params), model:[channelInstanceCount: Channel.count()] 
        } 
    }
    
    def show(Channel channelInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && channelInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond channelInstance
    }

    def create() {
        respond new Channel(params)
    }

    @Transactional
    def save(Channel channelInstance) {
        if (channelInstance == null) {
            notFound()
            return
        }

        if (channelInstance.hasErrors()) {
            respond channelInstance.errors, view:'create'
            return
        }

        channelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'channelInstance.label', default: 'Channel'), channelInstance.id])
                redirect channelInstance
            }
            '*' { respond channelInstance, [status: CREATED] }
        }
    }

    def edit(Channel channelInstance) {
        respond channelInstance
    }

    @Transactional
    def update(Channel channelInstance) {
        if (channelInstance == null) {
            notFound()
            return
        }

        if (channelInstance.hasErrors()) {
            respond channelInstance.errors, view:'edit'
            return
        }

        channelInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Channel.label', default: 'Channel'), channelInstance.id])
                redirect channelInstance
            }
            '*'{ respond channelInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Channel channelInstance) {
        //Pretend deletion
        // example: http://localhost:9991/Commons/channel/delete/2
        if (channelInstance == null) {
            notFound()
            return
        }
        channelInstance.recStatus="Deleted"
        channelInstance.save flush:true
    
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Channel.label', default: 'Channel'), channelInstance.id])
                redirect action:"index", method:"GET"
            }
             '*'{ 
                respond channelInstance //, [status: NO_CONTENT] 
            }
        }
    }
    
    @Transactional 
    def undelete(Channel channelInstance) { 
        // example: http://localhost:9991/Commons/channel/undelete/2
        if (channelInstance == null) {
            notFound()
            return
        }
        channelInstance.recStatus="Active"
        channelInstance.save flush:true 

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Channel.label', default: 'Channel'), channelInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ 
              respond channelInstance //, [status: NO_CONTENT] 
            }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'channelInstance.label', default: 'Channel'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    // READ ONLY Services. They return either XML or JSON (Default)
    // the form multipartFormat is declared at the end of URI, e.g. /channel/getByCode.xml?code=bn
    def getByCode(String code) {
        // example: <server:port>/Commons/channel/getByCode?code=brn
        //          <server:port>/Commons/channel/getByCode/brn
        if (!code) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return           
        }
        def channelInstance = Channel.findByCode(code.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        println "recStatus: $params.recStatus"
        if (channelInstance==null || channelInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        withFormat{       
                html {render channelInstance as JSON}
                xml  {render channelInstance as XML}
                '*'  {render channelInstance as JSON}
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/channel/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def channelInstance 
        if (params.recStatus == "All" ) { 
            channelInstance = Channel.list(params)
        } 
        else {
            channelInstance = Channel.findAllByRecStatus(params.recStatus, params)
        }        
        if (channelInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        channelInstance.each {
           result[it.code] = [title:"$it.title", titleInt:"$it.titleInt", id:"$it.id"]  
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*'  {render result as JSON}
                
        }  
    }    
    /*
    def customQuery(String query) {
        // Example: // customQuery?query=select code, name, nameInt from Channel
        //It is not allowed to contain the words: Update, Delete, and Set
//        println "Input query: $query"
        
        def result = [:]
        result.query = "$query" 
        def x = query.toUpperCase()
        if (x.contains('UPDATE') || x.contains('DELETE') || x.contains('SET') || !query.contains("Channel")) {
//            println "WRONG QUERY"
            response.status = 400 // Bad Request
            withFormat{
                json {render result as JSON}
                xml  {render result as XML}
                '*'  {render result as JSON}
            }
            return
        }
        def channelInstance
        try {
            channelInstance =  Channel.executeQuery(query)
        } catch (Exception e){
//            println "EMPTY RESULT"
            response.status = 404 // Not Found
            withFormat{
                json {render result as JSON}
                xml  {render result as XML}
                '*'  {render result as JSON}
            }
            return
        }
//        render "$query"
        JSON.use('deep')
        XML.use('deep') 
//        println "GOOD RESULT"
        withFormat{
            json {render channelInstance as JSON}
            xml  {render channelInstance as XML}
            '*'  {render channelInstance as JSON}
        }
    }   
    */
}
