package entities

class TheBank {
    String      shortName
    String      officialName
    String      officialNameInt
    String      swiftBankCode
    Country     hostCountry
    Currency    baseCurrency
    Language    officialLanguage
    Iban        iBAN
    Timezone    hQTimezone
    String      siteHome = "www.AgileBank.com"
    String      email = "info@AgileBank.com"
    String      adminMail = "webmaster@AgileBank.com"
    OrgUnit     orgTreeRoot
    int         UNIQUE_KEY = 1
    String      notes
    Date        dateCreated
    Date        lastUpdated
    String      recStatus = "Active"
    
    String toString() {"$shortName"}
    static mapping = {
        table 'bank'
    }
    
    static hasMany = [channels:Channel]
    
    static constraints = {
        shortName(nullable:false, maxsize:30)
        officialName(nullable:false)
        officialNameInt(nullable:false)
        swiftBankCode(nullable:false)//, size:8..8)
        hostCountry(nullable:false)
        baseCurrency(nullable:false)
        officialLanguage(nullable:false)
        iBAN(nullable:false)
        hQTimezone(nullable:true)
        siteHome(nullable:true)
        email(email:true)
        adminMail(email:true, nullable:true)
        orgTreeRoot(nullable:false)
        channels(nullable:true)
        notes (nullable:true, size:0..2000, widget: 'textarea')
        dateCreated(editable:false, bindable:false)
        lastUpdated(editable:false, bindable:false)
        UNIQUE_KEY(unique:true, min:1, max:1, editable:false, bindable:false, display:false)
        recStatus(display:false, editable:false, inList:["Active"])
    }
    def beforeUpdate() {
        recStatus = "Active" // always Active
    }     
}