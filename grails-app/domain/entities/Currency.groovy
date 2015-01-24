package entities

class Currency {
    // http://www.xe.com/iso4217.php
    
    String      iso3
    String      name
    String      nameInt
    String      area
    String      notes
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"
        
    String toString()  {"$iso3: $nameInt"}
    
    static mapping = {
        table 'currencies'
        iso3 index:'CurrencyIso3_Idx'
        version true
        sort "iso3"
    }
    static constraints = {
        iso3        (unique:true, nullable:false, blank:false, size:3..3)
        name        (unique:true, nullable:false, blank:false, maxsize:30)
        nameInt     (unique:true, nullable:false, blank:false, maxsize:30)
        area        (nullable:false, blank:false, inList:["EU-EUR", "EU-None EUR", "Europe", "Asia", "North America","South America", "Australia", "Other"])
        notes       (nullable:true, size:0..2000, widget: 'textarea')
        dateCreated()
        lastUpdated(editable:false)  
        recStatus   (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    def beforeUpdate() {
        iso3 = iso3.toUpperCase()
        recStatus = recStatus.capitalize()
    }      
}
