package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class OrgUnitController  extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete:'POST',
        undelete:"POST",
        getByCode:'GET',
        shortList:'GET',
        customQuery: 'GET'
    ]

    def index(Integer max) { 
        params.max = Math.min(max ?: 10, 100) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond OrgUnit.list(params), model:[orgUnitInstanceCount: OrgUnit.count()]
        } 
        else {
            respond OrgUnit.findAllByRecStatus(params.recStatus, params), model:[orgUnitInstanceCount: OrgUnit.count()] 
        } 
    }
    
    def show(OrgUnit orgUnitInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && orgUnitInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }            
        respond orgUnitInstance
    }

    def create() {
        respond new OrgUnit(params)
    }

    @Transactional
    def save(OrgUnit orgUnitInstance) {
        if (orgUnitInstance == null) {
            notFound()
            return
        }

        if (orgUnitInstance.hasErrors()) {
            respond orgUnitInstance.errors, view:'create'
            return
        }

        orgUnitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'orgUnitInstance.label', default: 'OrgUnit'), orgUnitInstance.id])
                redirect orgUnitInstance
            }
            '*' { respond orgUnitInstance, [status: CREATED] }
        }
    }

    def edit(OrgUnit orgUnitInstance) {
        respond orgUnitInstance
    }

    @Transactional
    def update(OrgUnit orgUnitInstance) {
        if (orgUnitInstance == null) {
            notFound()
            return
        }

        if (orgUnitInstance.hasErrors()) {
            respond orgUnitInstance.errors, view:'edit'
            return
        }

        orgUnitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'OrgUnit.label', default: 'OrgUnit'), orgUnitInstance.id])
                redirect orgUnitInstance
            }
            '*'{ respond orgUnitInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(OrgUnit orgUnitInstance) {
        // example: http://localhost:9991/Commons/orgUnit/delete/2

        if (orgUnitInstance == null) {
            notFound()
            return
        }
        orgUnitInstance.recStatus="Deleted"
        orgUnitInstance.save flush:true
//        orgUnitInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'OrgUnit.label', default: 'OrgUnit'), orgUnitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond orgUnitInstance, [status: OK] }
        }
    }
    
    @Transactional 
    def undelete(OrgUnit orgUnitInstance) { 
        // example: http://localhost:9991/Commons/orgUnit/undelete/2
        if (orgUnitInstance == null) {
            notFound()
            return
        }
        orgUnitInstance.recStatus="Active"
        orgUnitInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'OrgUnit.label', default: 'OrgUnit'), orgUnitInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond orgUnitInstance, [status: OK] } 
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'orgUnitInstance.label', default: 'OrgUnit'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
   // READ ONLY Services. They return either XML or JSON (Default)
   // the format is declared at the end of URI, e.g. /orgUnit/getByCode.xml?code=bod
    def getByCode(String code) {
        // example: <server:port>/Commons/orgUnit/getByCode?code=bod
        //          <server:port>/Commons/orgUnit/getByCode/bod
        if (!code) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def orgUnitInstance = OrgUnit.findByCode(code.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (orgUnitInstance==null || orgUnitInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render orgUnitInstance as JSON}
                xml  {render  orgUnitInstance as XML}
                '*' {render orgUnitInstance as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/orgUnit/shortList
        def orgUnitInstance =  OrgUnit.findAll()
        if (orgUnitInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        orgUnitInstance.each {
            if (params.recStatus == "All" || it.recStatus == params.recStatus) {
                result[it.code] = [ title:"$it.title", titleInt:"$it.titleInt", parent:"$it.parentUnit", id:"$it.id", recStatus:"$it.recStatus"]
            }
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}
                
        }  
    }    
    
    def getOrgUnitType(Long id) {
        redirect (controller:"OrgUnitType", action: "show", params:[id:"$id"])
    }
}
