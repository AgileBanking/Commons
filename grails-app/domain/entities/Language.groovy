package entities

class Language {
    // http://www.loc.gov/standards/iso639-2/php/code_list.php
//    static expose = 'language'
    
    String      iso2
    String      name
    String      nameInt
//    boolean     leftToRight = Boolean.true
    String      notes
    Date        dateCreated 
    Date        lastUpdated 
    String      recStatus = "Active"
    
    String toString()  {"$iso2: $nameInt"}
    
    static mapping = {
        table 'languages'
        iso2 index:'LanguageIso_Idx'
        sort "iso2"
    }
    
    static constraints = {
        iso2(maxsize:3, unique:true, blank:false, nullable:false)
        name(maxsize:30, unique:true, blank:false, nullable:false)
        nameInt(maxsize:30,unique:true, blank:false, nullable:false)
//        leftToRight(nullable:false)
        notes(size:0..2000, nullable:true, blank:true, widget:'textarea')
        dateCreated ()
        lastUpdated ()    
        recStatus   (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    
    def beforeUpdate() {
        iso2 = iso2.toUpperCase()
    }      
}
