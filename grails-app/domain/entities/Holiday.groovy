package entities

class Holiday {
    Country     country
    String      title
    String      titleInt
    Date        holiday = new Date().clearTime()
    String      notes
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"

    static belongsTo = Country
    String toString() {"$country: $holiday: $title/$titleInt"}
//    String toString() {"$title?/$titleInt?"}
    
    static mapping = {
        table 'holidays'
        // multi-column index
        country index: 'nathol_idx'
        holiday index: 'nathol_idx' 
        sort "holiday"
    }    
    
    static constraints = {
        country(nullable:false)
        title(nullable:true)
        titleInt(nullable:true)
        holiday (unique:true, nullable:false, min:Date.parse('yyyy-mm-dd','2000-01-01'), max:Date.parse('yyyy-mm-dd','2100-12-31'), format:'yyyy-mm-dd')
        notes(size:0..250, nullable:true, widget: 'textarea')
        dateCreated()
        lastUpdated(editable:false, bindable:false)
        recStatus   (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    
    def beforeUpdate() {
        holiday = holiday.clearTime()
    }      
}
