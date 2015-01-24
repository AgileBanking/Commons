
package entities

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import org.codehaus.groovy.grails.web.json.*
import grails.converters.*

@Transactional(readOnly = true)
class HolidayController extends BaseController {

    static allowedMethods = [
        show:'GET',
        edit:['GET', 'POST'],
        save:'POST',
        update:['POST','PUT'],
        delete:['POST','DELETE'],
        getByCountryIso2:'GET',
        shortList:'GET',
        customQuery: 'GET'
    ]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize() 
        if (params.recStatus == "All" ) { 
            respond Holiday.list(params), model:[holidayInstanceCount: Holiday.count()]
        } 
        else {
            respond Holiday.findAllByRecStatus(params.recStatus, params), model:[holidayInstanceCount: Holiday.count()] 
        } 
    }

    def show(Holiday holidayInstance) {
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (params.recStatus != "All" && holidayInstance.recStatus != params.recStatus) { 
            notFound()
            return
        }         
        respond holidayInstance
    }

    def create() {
        if (Country.count()==0) {
            response.status = 400 // Bad Request
            render "Please enter countries before holidays."            
            return}
        respond new Holiday(params)
    }

    @Transactional
    def save(Holiday holidayInstance) {
        if (holidayInstance == null) {
            notFound()
            return
        }

        if (holidayInstance.hasErrors()) {
            respond holidayInstance.errors, view:'create'
            return
        }

        holidayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'holidayInstance.label', default: 'Holiday'), holidayInstance.id])
                redirect holidayInstance
            }
            '*' { respond holidayInstance, [status: CREATED] }
        }
    }

    def edit(Holiday holidayInstance) {
        respond holidayInstance
    }

    @Transactional
    def update(Holiday holidayInstance) {
        if (holidayInstance == null) {
            notFound()
            return
        }

        if (holidayInstance.hasErrors()) {
            respond holidayInstance.errors, view:'edit'
            return
        }

        holidayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Holiday.label', default: 'Holiday'), holidayInstance.id])
                redirect holidayInstance
            }
            '*'{ respond holidayInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Holiday holidayInstance) {
        // example: http://localhost:9991/Commons/holiday/delete/2
        if (holidayInstance == null) {
            notFound()
            return
        }
        holydayInstance.recStatus = "Deleted"
        holidayInstance.update flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Holiday.label', default: 'Holiday'), holidayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond holidayInstance, [status: OK] }
        }
    }

    @Transactional 
    def undelete(Holiday holidayInstance) { 
        // example: http://localhost:9991/Commons/holiday/undelete/2
        if (holidayInstance == null) {
            notFound()
            return
        }
        holidayInstance.recStatus="Active"
        holidayInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.undeleted.message', args: [message(code: 'Holiday.label', default: 'Holiday'), holidayInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ respond holidayInstance, [status: OK] }
        }
    } 
    
    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'holidayInstance.label', default: 'Holiday'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
    // READ ONLY Services. They return either XML or JSON (Default)
    // the format is declared at the end of URI, e.g. /nationalHoliday/getByCountryIso2.xml?iso2=usa
    def getByCountryIso2(String iso2) {
        // example: <server:port>/Commons/currency/getByIso2?iso2=USA   
        //          <server:port>/Commons/currency/getByIso2/GRE
        if (!iso2 || iso2.size()!=2) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def holidayInstance = Country.findWhere(iso2: iso2.toUpperCase()).holidays
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        if (holidayInstance==null || holidayInstance.recStatus[0] != params.recStatus) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render holidayInstance as JSON}
                xml  {render  holidayInstance as XML}
                '*' {render holidayInstance as JSON}
                
        }     
    }
    
    def getYearHolidays(String iso2, String year) {
        // example: <server:port>/Commons/currency/getByIso2?iso2=USA&year2014   
        //          <server:port>/Commons/currency/getByIso2/GRE
        if (year==null) {
            year = (new Date().year + 1900).toString()
        }
        if (!iso2 || !iso2.size()==3) {
            request.withFormat {
                '*'{ render status: 400}
            }
            return            
        }
        def holidayInstance = Country.findWhere(iso2: iso2.toUpperCase()).holidays
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        def result =[]
        holidayInstance.each {
            if (it.recStatus == params.recStatus && it.holiday.year+1900 == year.toInteger()) {
                result.add it
            }                
        }
        if (result==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND}
            }
            return
        }          
        withFormat{       
                html {render result as JSON}
                xml  {render  result. as XML}
                '*' {render result. as JSON}
                
        }     
    }
    
         
    def shortList() {
        // example: <server:port>/Commons/currency/shortList
        def holidayInstance =  Holiday.findAll()
        if (holidayInstance==null) {
            request.withFormat {
                '*'{ render status: NOT_FOUND }
            }
            return
        }
        def result =[:]
        params.recStatus = (params.recStatus ? params.recStatus.toLowerCase() : "Active").capitalize()
        holidayInstance.each {
            if (params.recStatus == "All" || it.recStatus == params.recStatus) {
                result["$it.country.iso2/" + it.holiday.format('yyyy-MM-dd')] = [ title:"$it.title", titleInt:"$it.titleInt", id:"$it.id", recStatus: "$it.recStatus"]
            }
        }
        withFormat{       
                html {render result as JSON}
                xml  {render  result as XML}
                '*' {render result as JSON}
                
        }  
    }    
}
