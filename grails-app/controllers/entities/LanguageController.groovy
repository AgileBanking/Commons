package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class LanguageController  extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete:['POST'],
        undelete:['POST'],
        getByIso2:'GET',
        shortList:'GET',
        customQuery:'GET'
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Language.list(params), model:[languageInstanceCount: Language.count()]
        } 
        else {
            respond Language.findAllByRecStatus(params.recStatus, params), model:[languageInstanceCount: Language.count()] 
        } 
    }

    def show(Language languageInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && languageInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }                
        respond languageInstance
    }

    def create() {
        respond new Language(params)
    }

    @Transactional
    def save(Language languageInstance) {
        if (languageInstance == null) {
            notFound()
            return
        }

        if (languageInstance.hasErrors()) {
            respond languageInstance.errors, view:'create'
            return
        }

        languageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'languageInstance.label', default: 'Language'), languageInstance.id])
                redirect languageInstance
            }
            '*' { respond languageInstance, [status: CREATED] }
        }
    }

    def edit(Language languageInstance) {
        respond languageInstance
    }

    @Transactional
    def update(Language languageInstance) {
        if (languageInstance == null) {
            notFound()
            return
        }

        if (languageInstance.hasErrors()) {
            respond languageInstance.errors, view:'edit'
            return
        }

        languageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Language.label', default: 'Language'), languageInstance.id])
                redirect languageInstance
            }
            '*'{ respond languageInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Language languageInstance) {
        // example: http://localhost:9991/Commons/language/delete/2
        if (languageInstance == null) {
            notFound()
            return
        }
        languageInstance.recStatus = "Deleted"
        languageInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Language.label', default: 'Language'), languageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond languageInstance, [status: OK] }
        }
    }

    @Transactional 
    def undelete(Language languageInstance) { 
        // example: http://localhost:9991/Commons/language/undelete/2
        if (languageInstance == null) {
            notFound()
            return
        }
        languageInstance.recStatus="Active"
        languageInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Language.label', default: 'Language'), languageInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond languageInstance, [status: OK]}
        }
    }    
    
    
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'languageInstance.label', default: 'Language'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /language/getByIso2.xml?iso2=el
    def getByIso2(String iso2) {
        // example: <server:port>/Commons/language/getByIso2?iso2=en
        //          <server:port>/Commons/language/getByIso2/fr
        if (!iso2 || !request.get) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return           
        }
        def languageInstance = Language.findByIso2(iso2.toUpperCase())
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (languageInstance==null || languageInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render languageInstance as JSON}
                xml  {render  languageInstance as XML}
                '*' {render languageInstance as JSON}
                
        }     
    }

    def shortList() {
        // example: <server:port>/Commons/language/shortList
        params.max = Math.min(params.max ?: 50, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def languageInstance 
        if (params.recStatus == "All" ) { 
            languageInstance = Language.list(params)
        } 
        else {
            languageInstance = Language.findAllByRecStatus(params.recStatus, params)
        }        
        if (languageInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        languageInstance.each {
           result[it.iso2] = [ name:"$it.name", nameInt:"$it.nameInt", id:"$it.id", recStatus:"$it.recStatus"] 
        }
        withFormat{        
            html {render result as JSON}
            xml  {render  result as XML}
            '*'  {render result as JSON}
                
        }  
    } 
    
//    def shortList() {
//        // example: <server:port>/Commons/language/getListOfIso3
//        def languageInstance =  Language.findAll()
//        if (languageInstance==null) {
//            request.withFormat {
//                '*'{ render status: NOT_FOUND }
//            }
//            return
//        }
//        def result =[:]
//        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
//        println "params.recStatus: $params.recStatus"
//        languageInstance.each {
//            println "languageInstance.recStatus: $languageInstance.recStatus" 
//            if (params.recStatus == "All" || languageInstance.recStatus == params.recStatus) {
//                result[it.iso2] = [ name:"$it.name", nameInt:"$it.nameInt", id:"$it.id", recStatus:"$it.recStatus"]
//            }
//        }
//        withFormat{      
//                html {render result as JSON}
//                xml  {render result as XML}
//                '*'  {render result as JSON}
//        }  
//    }    
}
