package entities
import grails.converters.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
abstract class BaseController {

    def customQuery(String query) {
        def result = [:] 
        result.query = "$query"
        
        /* Examples:
        // customQuery?query=select iso2, name, nameInt from Language
        /country/customQuery?query=select iso2, name, nameInt from Country
        */
        
        //It is not allowed to contain the words: 'Update', 'Delete', 'Set' and '*'
         
        def x = query.toUpperCase() 
        if (x.contains('*') || x.contains('UPDATE') || x.contains('DELETE') || x.contains('SET') || !x.contains(params.controller.toUpperCase())) { 
            response.status = 400 // Bad Request
            result.errorcode="$response.status"
            result.body="Not Allowed query"
            withFormat{
                json {render result as JSON}
                xml  {render result as XML}
                '*'  {render result as JSON}
            }
            return
        }
        def countryInstance
        try {
            countryInstance =  Country.executeQuery(query)
        } catch (Exception e){
            response.status = 404 // Not Found
            withFormat{
                json {render result as JSON}
                xml  {render result as XML}
                '*'  {render result as JSON}
            }
            return
        }
        JSON.use('deep')
        XML.use('deep') 
        withFormat{
            json {render countryInstance as JSON} 
            xml  {render countryInstance as XML}
            '*'  {render countryInstance as JSON} 
        }
    }    

}
