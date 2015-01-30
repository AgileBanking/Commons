package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class OrgUnitTypeController  extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete: 'POST',
        undelete: "POST",
        getByCode:'GET',
        shortList:'GET',
        customQuery: 'GET'
    ]

    def index(Integer max) { 
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond OrgUnitType.list(params), model:[orgUnitTypeInstanceCount: OrgUnitType.count()]
        } 
        else {
            respond OrgUnitType.findAllByRecStatus(params.recStatus, params), model:[orgUnitTypeInstanceCount: OrgUnitType.count()] 
        } 
    }
    
    def show(OrgUnitType orgUnitTypeInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && orgUnitTypeInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond orgUnitTypeInstance
    }

    def create() {
        respond new OrgUnitType(params)
    }

    @Transactional
    def save(OrgUnitType orgUnitTypeInstance) {
        if (orgUnitTypeInstance == null) {
            notFound()
            return
        }

        if (orgUnitTypeInstance.hasErrors()) {
            respond orgUnitTypeInstance.errors, view:'create'
            return
        }

        orgUnitTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orgUnitTypeInstance.label', default: 'OrgUnitType'), orgUnitTypeInstance.id])
                redirect orgUnitTypeInstance
            }
            '*' { respond orgUnitTypeInstance, [status: CREATED] }
        }
    }

    def edit(OrgUnitType orgUnitTypeInstance) {
        respond orgUnitTypeInstance
    }

    @Transactional
    def update(OrgUnitType orgUnitTypeInstance) {
        if (orgUnitTypeInstance == null) {
            notFound()
            return
        }

        if (orgUnitTypeInstance.hasErrors()) {
            respond orgUnitTypeInstance.errors, view:'edit'
            return
        }

        orgUnitTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrgUnitType.label', default: 'OrgUnitType'), orgUnitTypeInstance.id])
                redirect orgUnitTypeInstance
            }
            '*'{ respond orgUnitTypeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrgUnitType orgUnitTypeInstance) {
        // example: http://localhost:9991/Commons/orgUnitType/delete/2

        if (orgUnitTypeInstance == null) {
            notFound()
            return
        }
        orgUnitTypeInstance.recStatus="Deleted"
        orgUnitTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrgUnitType.label', default: 'OrgUnitType'), orgUnitTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond orgUnitTypeInstance, [status: OK] }
        }
    }
    
    @Transactional 
    def undelete(OrgUnitType orgUnitTypeInstance) { 
        // example: http://localhost:9991/Commons/orgUnitType/undelete/2
        if (orgUnitTypeInstance == null) {
            notFound()
            return
        }
        orgUnitTypeInstance.recStatus="Active"
        orgUnitTypeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'OrgUnitType.label', default: 'OrgUnitType'), orgUnitTypeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond orgUnitTypeInstance, [status: OK] }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgUnitTypeInstance.label', default: 'OrgUnitType'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
   // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /orgUnitType/getByCode.xml?code=bod
    def getByCode(String code) {
        // example: <server:port>/Commons/orgUnitType/getByCode?code=bod
        //          <server:port>/Commons/orgUnitType/getByCode/bod
        if (!code) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def orgUnitTypeInstance = OrgUnitType.findByCode(code.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (orgUnitTypeInstance==null || orgUnitTypeInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render orgUnitTypeInstance as JSON}
                xml  {render  orgUnitTypeInstance as XML}
                '*' {render orgUnitTypeInstance as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/orgUnitType/shortList
        def orgUnitTypeInstance =  OrgUnitType.findAll()
        if (orgUnitTypeInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        orgUnitTypeInstance.each {
            if (params.recStatus == "All" || orgUnitTypeInstance.recStatus == params.recStatus) {
                result[it.code] = [ title:"$it.title", titleInt:"$it.titleInt", id:"$it.id", recStatus:"$it.recStatus"]
            }
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}
                
        }  
    }    
}