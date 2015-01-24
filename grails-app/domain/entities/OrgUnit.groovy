package entities

class OrgUnit {   
    String      code
    String      title
    String      titleInt
    OrgUnit     parentUnit 
    OrgUnitType orgType
    String      type = "Unit" 
    String      status = "Active"
    String      notes
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"
    

    String  toString() {"$code: $title/$titleInt"}
    
    static hasMany = [childUnits:OrgUnit]
    static belongsTo = [parentUnit:OrgUnit]
    
    static mapping = {
        table 'orgunits'
        parentUnit index:'OrgUnitRoot_idx'
        code index:'OrgUnitCode_idx'
        sort "code"
    }    
    
    static constraints = {
        code        unique:true, nullable:false
        title       unique:true, nullable:false
        titleInt    unique:true, nullable:false
        orgType     nullable:false
        type        nullable:false, inList:["Unit", "Person", "Partner"]
        parentUnit  nullable:true
        childUnits  nullable:true
        status      nullable:false, inList:["Active", "Inactive", "Removed", "Planned"]
        notes       nullable:true, size:0..2000, widget: 'textarea'
        dateCreated() // implied => editable:false, bindable: false
        lastUpdated() // implied => editable:false, bindable: false
        recStatus   (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    def beforeUpdate() {
        code = code.toUpperCase()
    }     
}
