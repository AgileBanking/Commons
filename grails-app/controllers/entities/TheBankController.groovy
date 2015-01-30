package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class TheBankController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        create:'GET',
        update:['POST','PUT'],
        delete:'POST',
        undelete:"POST",
        getBank:'GET'
    ]

    def index(Integer max) {
//        params.max = Math.min(max ?: 10, 100) // there is only one resource
        respond TheBank.list(params), model:[theBankInstanceCount: TheBank.count()]
    }

    def show(TheBank theBankInstance) {
        respond theBankInstance
    }

    def create() {
        if (TheBank.count()) {
            respond status:403, notes: "Forbidded. It is already defined." // Forbiddent 
            return
        }
        respond new TheBank(params)
    }

    @Transactional
    def save(TheBank theBankInstance) {
        if (theBankInstance == null) {
            notFound()
            return
        }

        if (theBankInstance.hasErrors()) {
            respond theBankInstance.errors, view:'create'
            return
        }

        theBankInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'theBankInstance.label', default: 'TheBank'), theBankInstance.id])
                redirect theBankInstance
            }
            '*' { respond theBankInstance, [status: CREATED] }
        }
    }

    def edit(TheBank theBankInstance) {
        respond theBankInstance
    }

    @Transactional
    def update(TheBank theBankInstance) {
        if (theBankInstance == null) {
            notFound()
            return
        }

        if (theBankInstance.hasErrors()) {
            respond theBankInstance.errors, view:'edit'
            return
        }

        theBankInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TheBank.label', default: 'TheBank'), theBankInstance.id])
                redirect theBankInstance
            }
            '*'{ respond theBankInstance, [status: OK] }
        }
    }

//    @Transactional
    def delete(TheBank theBankInstance) {
//
//        if (theBankInstance == null) {
//            notFound()
//            return
//        }
//
//        theBankInstance.delete flush:true

        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TheBank.label', default: 'TheBank'), theBankInstance.id])
//                redirect action:"index", method:"GET"
//            }
            '*'{ respond status:403, notes: "Forbidded. It is not allowed to delete theBank."  } // Forbiddent
        }
    }
    
//    @Transactional
    def undelete(TheBank theBankInstance) {
        request.withFormat {
            '*'{ render status: 403 } // Forbiddent
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'theBankInstance.label', default: 'TheBank'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
   // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /theBank/getByCode.xml?code=bod
    def getBank() {
        // example: <server:port>/Commons/theBank/getBank
        def theBankInstance = TheBank.first() 
        if (theBankInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render theBankInstance as JSON}
                xml  {render  theBankInstance as XML}
                '*' {render theBankInstance as JSON}
                
        }     
    }
    
    def hostCountry() {
        println "hostCountry called"
        render TheBank.first().hostCountry as JSON
    }
    
    def baseCurrency() {
        render TheBank.first().baseCurrency as JSON
    }    
    
    def officialLanguage() {
        render TheBank.first().officialLanguage as JSON
    }     
    
    def iban() {
        render TheBank.first().iBAN as JSON
    } 
    
    def hQTimezone() {
        render TheBank.first().hQTimezone as JSON
    } 
    
    def orgTreeRoot() {
        render TheBank.first().orgTreeRoot as JSON
    }     
    
    def channels() {
        render TheBank.first().channels as JSON
    }
}