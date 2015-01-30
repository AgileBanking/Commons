package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class IbanController  extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:'POST',
        delete:'POST',
        getByCountryIso2:'GET',
        shortList:'GET',
        customQuery:'GET'
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Iban.list(params), model:[ibanInstanceCount: Iban.count()]
        } 
        else {
            respond Iban.findAllByRecStatus(params.recStatus, params), model:[ibanInstanceCount: Iban.count()] 
        } 
    }

    def show(Iban IbanInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && IbanInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }         
        respond IbanInstance
    }

    def create() {
        respond new Iban(params)
    }

    @Transactional
    def save(Iban IbanInstance) {
        if (IbanInstance == null) {
            notFound()
            return
        }

        if (IbanInstance.hasErrors()) {
            respond IbanInstance.errors, view:'create'
            return
        }

        IbanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'IbanInstance.label', default: 'Iban'), IbanInstance.id])
                redirect IbanInstance
            }
            '*' { respond IbanInstance, [status: CREATED] }
        }
    }

    def edit(Iban IbanInstance) {
        respond IbanInstance
    }

    @Transactional
    def update(Iban IbanInstance) {
        if (IbanInstance == null) {
            notFound()
            return
        }

        if (IbanInstance.hasErrors()) {
            respond IbanInstance.errors, view:'edit'
            return
        }

        IbanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Iban.label', default: 'Iban'), IbanInstance.id])
                redirect IbanInstance
            }
            '*'{ respond IbanInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Iban IbanInstance) {
        // example: http://localhost:9991/Commons/iban/delete/2
        if (IbanInstance == null) {
            notFound()
            return
        }
        IbanInstance.recStatus = "Deleted"
        IbanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Iban.label', default: 'Iban'), IbanInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond IbanInstance, [status: OK] }
        }
    }

    @Transactional 
    def undelete(Iban IbanInstance) {
        // example: http://localhost:9991/Commons/iban/undelete/2
        if (IbanInstance == null) {
            notFound()
            return
        }
        IbanInstance.recStatus = "Active"
        IbanInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Iban.label', default: 'Iban'), IbanInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond IbanInstance, [status: OK] }
        }
    }  

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'IbanInstance.label', default: 'Iban'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    
    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /Iban/getByIso2.xml?iso2=us
    def getByCountryIso2(String iso2) {
        // example: <server:port>/Commons/Iban/getByIso3?iso2=US
        //          <server:port>/Commons/Iban/getByIso2/GR
        if (!iso2 || !iso2.size()==2) {
            response.status = 400 // 400 Bad Request
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def IbanInstance = Iban.findByCountryIso2(iso2.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (IbanInstance==null || IbanInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render IbanInstance as JSON}
                xml  {render IbanInstance as XML}
                '*'  {render IbanInstance as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/Iban/shortList
        def IbanInstance = Iban.list(params)
//        def IbanInstance =  Iban.executeQuery('select countryIso2, fields, chars, recStatus, id from Iban order by countryIso2')
        if (IbanInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def result =[:]
        IbanInstance.each {
            if (it.recStatus == "All" || it.recStatus == params.recStatus) {
                result[it.countryIso2] = [ fields:"$it.fields", chars:it.chars, id:"$it.id", recStatus:"$it.recStatus"]
            }
        }        
        withFormat{       
                html {render result as JSON}
                xml  {render result as XML}
                '*'  {render result as JSON}
                
        }  
    }    
}
