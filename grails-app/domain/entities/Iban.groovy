package entities

class Iban {
    /*
        http://en.wikipedia.org/wiki/International_Bank_Account_Number
        http://goo.gl/fHg1z
        http://www.swift.com/dsp/resources/documents/IBAN_Registry.pdf
        IBAN Checkers: http://goo.gl/YUijB
        IBAN Examples: http://toms-cafe.de/iban/iban.html
        IBAN Calculator: http://www.ibancalculator.com/
    */
    
    String      countryIso2 
    int         chars
    String      ibanFormat
    String      fields
    String      notes
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"

    static belongsTo = Country
    static mapping = {
        table 'ibans'
        recStatus index:'RecordStatus_Idx'
        sort "countryIso2"
    }    
//    static belongsTo = [country:Country]
    
    String toString() {fields[0..1]}
    
    static constraints = {
        countryIso2(nullable:false, size:2..2, unique:true)
        chars()
        ibanFormat()
        fields()
        notes(nullable:true, size:0..2000, widget: 'textarea')
        dateCreated (editable:false)
        lastUpdated (editable:false)    
        recStatus   (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    def beforeUpdate() {
        countryIso2 = countryIso2.toUpperCase()
        recStatus = recStatus.capitalize()
    }  
}
