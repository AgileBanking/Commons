package entities
 
class Timezone {
    // http://www.grails.org/JodaTime+Plugin
    // http://joda-time.sourceforge.net/
    
    String          location
    String          offset 
    String          notes
    String          recStatus = "Active"
    
    static mapping = {
        table 'timezones'
        location index:'city_Idx'
        sort "location"
    }
//    static searchFields = ['location']

    String toString()  {"$location: $offset"}
    
    static constraints = {
        location(nullable:false, unique:true, size:1..100)
        offset(nullable:false) // min:-12, max:12
        notes(nullable:true, size:0..2000, widget: 'textarea')
        recStatus (editable:false, display:false, inList:["Active", "Deleted"] )
    }
}
