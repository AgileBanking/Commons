package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class TimezoneController  extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete:'POST',
        undelete:'POST',
        getByLocation:'GET',
        shortList:'GET',
        customQuery: 'GET'
    ]

    def index(Integer max) { 
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Timezone.list(params), model:[timezoneInstanceCount: Timezone.count()]
        } 
        else {
            respond Timezone.findAllByRecStatus(params.recStatus, params), model:[timezoneInstanceCount: Timezone.count()] 
        } 
    }
    
    def show(Timezone timezoneInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && timezoneInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond timezoneInstance
    }

    def create() {
        respond new Timezone(params)
    }

    @Transactional
    def save(Timezone timezoneInstance) {
        if (timezoneInstance == null) {
            notFound()
            return
        }

        if (timezoneInstance.hasErrors()) {
            respond timezoneInstance.errors, view:'create'
            return
        }

        timezoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'timezoneInstance.label', default: 'Timezone'), timezoneInstance.id])
                redirect timezoneInstance
            }
            '*' { respond timezoneInstance, [status: CREATED] }
        }
    }

    def edit(Timezone timezoneInstance) {
        respond timezoneInstance
    }

    @Transactional
    def update(Timezone timezoneInstance) {
        if (timezoneInstance == null) {
            notFound()
            return
        }

        if (timezoneInstance.hasErrors()) {
            respond timezoneInstance.errors, view:'edit'
            return
        }

        timezoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Timezone.label', default: 'Timezone'), timezoneInstance.id])
                redirect timezoneInstance
            }
            '*'{ respond timezoneInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Timezone timezoneInstance) {
        // example: http://localhost:9991/Commons/timezone/delete/2

        if (timezoneInstance == null) {
            notFound()
            return
        }
        timezoneInstance.recStatus="Deleted"
        timezoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Timezone.label', default: 'Timezone'), timezoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond timezoneInstance, [status: OK] }
        }
    }
    
    @Transactional 
    def undelete(Timezone timezoneInstance) { 
        // example: http://localhost:9991/Commons/timezone/undelete/2
        if (timezoneInstance == null) {
            notFound()
            return
        }
        timezoneInstance.recStatus="Active"
        timezoneInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Timezone.label', default: 'Timezone'), timezoneInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond timezoneInstance, [status: OK] } 
        }
    }  

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'timezoneInstance.label', default: 'Timezone'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /timezone/getByLocation?location='Europe/Athens'
    def getByLocation(String location) {
        // example: <server:port>/Commons/timezone/getByLocation?location='Europe/Athens'   
        if (!location) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def timezoneInstance = Timezone.findByLocationLike("%$location%")
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (timezoneInstance==null || timezoneInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        def timezone = [location:timezoneInstance.location, offset:timezoneInstance.offset]

        withFormat{       
                html {render timezone as JSON}
                xml  {render  timezoneI as XML}
                '*' {render timezone as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/timezone/shortList
        def timezoneInstance =  Timezone.findAll()
        if (timezoneInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        timezoneInstance.each {
            if (params.recStatus == "All" || timezoneInstance.recStatus == params.recStatus) {
                result[it.location] = [ offset:"$it.offset", notes:"$it.notes", id:"$it.id", recStatus:"$it.recStatus"]
            }
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}
                
        }  
    }    
}