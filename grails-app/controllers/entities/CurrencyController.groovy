package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class CurrencyController extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:['POST','PUT'],
        update:['POST','PUT'],
        delete:['POST'],
        undelete:['POST'],
        schema: 'GET',
        getByIso3:'GET',
        shortList:'GET',
        customQuery:'GET'
    ]
    

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Currency.list(params), model:[currencyInstanceCount: Currency.count()]
        } 
        else {
            respond Currency.findAllByRecStatus(params.recStatus, params), model:[currencyInstanceCount: Currency.count()] 
        } 
    }

    def show(Currency currencyInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && currencyInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }         
        respond currencyInstance
    }

    def create() {
        respond new Currency(params)
    }

    @Transactional
    def save(Currency currencyInstance) {
        if (currencyInstance == null) {
            notFound()
            return
        }

        if (currencyInstance.hasErrors()) {
            respond currencyInstance.errors, view:'create'
            return
        }

        if (currencyInstance.recStatus != "Active") {
            respond "not Active resource", view:'create' , status:"400" 
        }
        currencyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'currencyInstance.label', default: 'Currency'), currencyInstance.id])
                redirect currencyInstance
            }
            '*' { respond currencyInstance, [status: CREATED] }
        }
    }

    def edit(Currency currencyInstance) {
        respond currencyInstance
    }

    @Transactional
    def update(Currency currencyInstance) {
        if (currencyInstance == null) {
            notFound()
            return
        }

        if (currencyInstance.hasErrors()) {
            respond currencyInstance.errors, view:'edit'
            return
        }

        currencyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Currency.label', default: 'Currency'), currencyInstance.id])
                redirect currencyInstance
            }
            '*'{ respond currencyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Currency currencyInstance) {
        // example: http://localhost:9991/Commons/currency/delete/2

        if (currencyInstance == null) {
            notFound()
            return
        }
        currencyInstance.recStatus="Deleted"
        currencyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Currency.label', default: 'Currency'), currencyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond currencyInstance, [status: OK] }
        }
    }
    
    @Transactional 
    def undelete(Currency currencyInstance) { 
        // example: http://localhost:9991/Commons/currency/undelete/2
        if (currencyInstance == null) {
            notFound()
            return
        }
        currencyInstance.recStatus="Active"
        currencyInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Currency.label', default: 'Currency'), currencyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond currencyInstance, [status: OK] }
        }
    }   
    
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'currencyInstance.label', default: 'Currency'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /currency/getByIso3.xml?iso3=usd
    def getByIso3(String iso3) {
        // example: <server:port>/Commons/currency/getByIso3?iso3=USD
        //          <server:port>/Commons/currency/getByIso3/USD
        if (!iso3) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def currencyInstance = Currency.findByIso3(iso3.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (currencyInstance==null || currencyInstance.recStatus != params.recStatus ) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render currencyInstance as JSON}
                xml  {render  currencyInstance as XML}
                '*' {render currencyInstance as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/currency/shortList
        def currencyInstance =  Currency.findAll()
        if (currencyInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        currencyInstance.each {
            if (params.recStatus == "All" || it.recStatus == params.recStatus) {
                result[it.iso3] = [ name:"$it.name", nameInt:"$it.nameInt", id:"$it.id", recStatus:"$it.recStatus"]
            }
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}    
        }  
    }      
}