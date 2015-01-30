package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
//import grails.converters.deep.*
import grails.converters.*

@Transactional(readOnly = true)
class CountryController extends BaseController{
    
    
    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:['POST','PUT'],
        update:['POST','PUT'],
        delete:['DELETE'], 
        delete:['DELETE'],
        getByIso2:'GET',
        shortList:'GET',
        customQuery:'GET'
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.recStatus = (params.recStatus ?: "Active").toLowerCase().capitalize()
        if (params.recStatus == "All" ) { 
            respond Country.list(params), model:[countryInstanceCount: Country.count()]
        } 
        else {
            respond Country.findAllByRecStatus(params.recStatus, params), model:[countryInstanceCount: Country.count()] 
        } 
    }

    def show(Country countryInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus != "All" && countryInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }             
        respond countryInstance
    }

    def create() {
        respond new Country(params)
    }

    @Transactional
    def save(Country countryInstance) {
        if (countryInstance == null) {
            notFound()
            return
        }

        if (countryInstance.hasErrors()) {
            respond countryInstance.errors, view:'create'
            return
        }

        countryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'countryInstance.label', default: 'Country'), countryInstance.iso2])
                redirect countryInstance
            }
            '*' { respond countryInstance, [status: CREATED] }
        }
    }

    def edit(Country countryInstance) {
        respond countryInstance
    }

    @Transactional
    def update(Country countryInstance) {
        if (countryInstance == null) {
            notFound()
            return
        }

        if (countryInstance.hasErrors()) {
            respond countryInstance.errors, view:'edit'
            return
        }

        countryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Country.label', default: 'Country'), countryInstance.iso2])
                redirect countryInstance
            }
            '*'{ respond countryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Country countryInstance) {

        if (countryInstance == null) {
            notFound()
            return
        }
        countryInstance.recStatus="Deleted"
        countryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Country.label', default: 'Country'), countryInstance.iso2])
                redirect action:"index", method:"GET"
            }
            '*'{ respond countryInstance, [status: OK] }
        }
    }
    
    @Transactional 
    def undelete(Country countryInstance) { 
        
        if (countryInstance == null) {
            notFound()
            return
        }
        countryInstance.recStatus="Active"
        countryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Country.label', default: 'Country'), countryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond countryInstance, [status: OK] }
        }
    }    

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'countryInstance.label', default: 'Country'), params.iso2])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }

    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /country/getByIso2.xml?iso2=gr
    def getByIso2(String iso2) {
        // example: <server:port>/Commons/country/getByIso2?iso2=GR
        //          <server:port>/Commons/country/getByIso2/US
        if (!iso2) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def countryInstance = Country.findByIso2(iso2.toUpperCase()) 
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (countryInstance==null || countryInstance.recStatus != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
//        JSON.use('deep')
        withFormat{       
            html {render countryInstance as JSON}
            xml  {render  countryInstance as XML}
            '*' {render countryInstance as JSON}
                
        }     
    }
         
    def shortList() {
        // example: <server:port>/Commons/country/shortList
        def countryInstance =  Country.findAll()
        if (countryInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def result = [:] 
        countryInstance.each {
            if (it.recStatus == "All" || it.recStatus == params.recStatus) {
                result["$it.iso2"] = [ name:"$it.name", nameInt:"$it.nameInt", capital:"$it.capital", id:"$it.id", recStatus:"$it.recStatus"]
            }
        }
        respond result
    }     
}