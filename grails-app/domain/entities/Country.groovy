package entities

class Country {
    // http://countrycode.org/
    // ISO 3166-1: http://en.wikipedia.org/wiki/ISO_3166-1
    //             http://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
    //             http://en.wikipedia.org/wiki/ISO_3166-1_alpha-3
    //             http://en.wikipedia.org/wiki/ISO_3166-1_numeric
    // CIA         https://www.cia.gov/library/publications/the-world-factbook/appendix/appendix-d.html
    // ISO.org     http://www.iso.org/iso/country_codes
    //             http://www.iso.org/iso/country_codes/iso_3166_code_lists/country_names_and_code_elements.htm
    // Downloadable http://www.textfixer.com/resources/country-dropdowns.php
    
        
    String      name
    String      nameInt
    String      iso2
//    String      iso3
    int         numCode
    String      internetCode
    String      capital
    String      dateFormat = "dd-mm-yyyy" //= "yyyy-mm-dd hh:mm:ss aa zzz"
    String      workingDays = "MTWTF--"
    String      phoneCode
    Currency    currency
    Iban        iban
    String      notes    
    Date        dateCreated //system timestamp
    Date        lastUpdated //system timestamp
    String      recStatus = "Active"

    
    String toString()  {"$iso2: $name/$nameInt"}
    
    static hasMany = [languages: Language, holidays:Holiday, timeZones: Timezone]
//    static hasOne = [iban:Iban]
    
    static mapping = {
        table 'countries'
//        id generator: 'assigned', name: "iso2"
        version true
        autoTimestamp true
//        iso2 index:'CountryIso2_Idx'
//        iso3 index:'CountryIso3_Idx'
        sort "iso2"
    }
    
    static constraints = {
        name(unique:true)
        nameInt(unique:true)
        iso2(unique:true, size:2..2)
//        iso3(unique:true, size:3..3)
        numCode(nullable:true, unique:true, min:1, max:999)
        internetCode(nullable:true, blank:true)
        capital(nullable:true, unique:true)
        timeZones(nullable:true)
        dateFormat(nullable:true)
        workingDays(nullable:true, size:7..7)
        phoneCode(nullable:true)
        currency(nullable:true)
        languages(nullable:true)
        holidays(nullable:true)
        iban(nullable:true)
        notes(nullable:true, size:0..2048, widget: 'textarea')
        dateCreated()
        lastUpdated()
        recStatus (editable:false, display:false, inList:["Active", "Deleted"] )
    }
    def beforeUpdate() {
        iso2 = iso2.toUpperCase()
//        iso3 = iso3.toUpperCase()
        internetCode = internetCode.toLowerCase()
        recStatus = recStatus.capitalize()
    }        
}