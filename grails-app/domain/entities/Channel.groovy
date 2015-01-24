package entities

class Channel {   
    String  code
    String  title
    String  titleInt
    String  notes
    Date    dateCreated
    Date    lastUpdated
    String  recStatus = "Active" 
    
    String toString() {"$code: $title/$titleInt"}
    
    static mapping = {
        table 'channels'
        version true
        autoTimestamp true
        code index:'code_Idx'
        sort "code"
    }    
    
    static constraints = {
        code        unique:true, nullable:false, size:3..3
        title       unique:true, nullable:false
        titleInt    unique:true, nullable:false
        notes       nullable:true, size:0..2000, widget: 'textarea'
        dateCreated ()// implied => editable:false, bindable: false
        lastUpdated ()// implied => editable:false, bindable: false
        recStatus   editable:false, display:false, inList:["Active", "Deleted"] 
    }
    
    def beforeUpdate() {
        code = code.toUpperCase()
    }    
}