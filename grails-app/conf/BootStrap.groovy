//import org.codehaus.groovy.grails.commons.ApplicationHolder
import java.util.TimeZone

class BootStrap {

    def init = { servletContext ->
        
        if (entities.TheBank.count()==0) {
        // Channel
//        if (entities.Channel.count()==0) {
            def cnl1 = new entities.Channel(code:"BRN", title:"Δίκτυο Καταστημάτων", titleInt:"Branch Network").save() // failOnError: true, flush:true
            def cnl2 = new entities.Channel(code:"ATM", title:"Δίκτυο ΑΤΜ", titleInt:"ΑΤΜ Network").save()
            def cnl3 = new entities.Channel(code:"WEB", title:"Internet Banking", titleInt:"Internet Banking").save()
            def cnl4 = new entities.Channel(code:"PHN", title:"Αυτόματη Τηλεφωνική Εξυπηρέτηση", titleInt:"Phone Banking").save()
            def cnl5 = new entities.Channel(code:"CCR", title:"Τηλεφωνικό Κέντρο Εξυπηρέτησης", titleInt:"Call Center").save()
            def cnl6 = new entities.Channel(code:"AGT", title:"Δίκτυο Πρακτόρευσης", titleInt:"Agents Banking").save()
//        }
        
        //class OrgUnitType    
//        if (entities.OrgUnitType.count()==0) {
            def ont1 = new entities.OrgUnitType(code:"BANK", title:"Best Bank", titleInt:"Best Bank").save()
            def ont2 = new entities.OrgUnitType(code:"BOD", title:"Διοικητικό Συμβούλιο", titleInt:"Board of Directors").save()
            def ont3 = new entities.OrgUnitType(code:"CHR", title:"Πρόεδρος ΔΣ", titleInt:"Chairman of the BoD").save()
            def ont4 = new entities.OrgUnitType(code:"VCHR", title:"Αντιπρόεδρος ΔΣ", titleInt:"Vice-Chairman of the BoD").save()
            def ont5 = new entities.OrgUnitType(code:"CEO", title:"Διευθύνων Σύμβουλος", titleInt:"Chief Executive Officer").save()
            def ont6 = new entities.OrgUnitType(code:"DCEO", title:"Αναπληρωτής Διευθύνων Σύμβουλος", titleInt:"Deputy Chief Executive Officer").save() 
//        }
//        //class OrgUnit
//        if (entities.OrgUnit.count() == 0) {
            def oun1 = new entities.OrgUnit(code:"BANK", title:"Best Bank", titleInt:"Best Bank", orgType:ont1).save()
            def oun2 = new entities.OrgUnit(code:"BOD", title:"Διοικιτικό Συμβούλιο", titleInt:"Board of Directors", parentUnit: oun1, orgType:ont2).save()
            def oun3 = new entities.OrgUnit(code:"CHR", title:"Πρόεδρος ΔΣ", titleInt:"Chairman of the Board", type:"Person", parentUnit: oun2, orgType:ont3).save()
            def oun4 = new entities.OrgUnit(code:"CHR", title:"Αντιπρόεδρος ΔΣ", titleInt:"Vice-Chairman of the Board", type:"Person", parentUnit: oun2, orgType:ont3).save()    
//        }
        
        // Languages      
//        if (entities.Language.count()==0) {
            def lang1 = new entities.Language(iso2:"el", name:"Ελληνικά", nameInt:"Hellenic - Greek", notes:"").save() // )
            def lang2 = new entities.Language(iso2:"en", name:"Αγγλικά", nameInt:"English", notes:"").save() // ) //(flush:true) 
            def lang3 = new entities.Language(iso2:"de", name:"Γερμανικά", nameInt:"German", notes:"").save() // )
            def lang4 = new entities.Language(iso2:"es", name:"Ισπανικά", nameInt:"Spanish", notes:"").save() // )
            def lang5 = new entities.Language(iso2:"fr", name:"Γαλλικά", nameInt:"French", notes:"").save() // )
            def lang6 = new entities.Language(iso2:"it", name:"Ιταλικά", nameInt:"Italian", notes:"").save() // )
            def lang7 = new entities.Language(iso2:"pr", name:"Πορτογαλικά", nameInt:"Portuguese", notes:"").save() // )
//        }
        
        // Iban
//        if (entities.Iban.count()==0) {
            def iban1 = new entities.Iban(countryIso2:"GR", chars:"27", ibanFormat:"7n,16c", fields:"GRkk bbbs sssc cccc cccc cccc ccc", notes:"").save()
            def iban2 = new entities.Iban(countryIso2:"DE", chars:"22", ibanFormat:"18n", fields:"DEkk bbbb bbbb cccc cccc cc", notes:"").save()
            def iban3 = new entities.Iban(countryIso2:"FR", chars:"27", ibanFormat:"10n,11c,2n", fields:"FRkk bbbb bggg ggcc cccc cccc cxx", notes:"").save()
//        }
    
        // Currencies
        //Euro Member Countries 
//        if (entities.Currency.count()==0) {
            def curr1 = new entities.Currency(iso3:"EUR", name:"ΕΥΡΩ", nameInt:"EURO", area:"EU-EUR" , notes:"").save()
            def curr2 = new entities.Currency(iso3:"USD", name:"ΔΟΛΛΑΡΙΟ ΗΠΑ", nameInt:"USD DOLLAR", area:"North America" , notes:"").save()
            def curr3 = new entities.Currency(iso3:"GBP", name:"ΛΥΡΑ ΑΓΓΛΙΑΣ", nameInt:"UK POUND", area:"EU-None EUR" , notes:"").save()
            def curr4 = new entities.Currency(iso3:"JPY", name:"ΓΙΕΝ ΙΑΠΩΝΙΑΣ", nameInt:"JAPAN YIEN" , area:"Asia", notes:"").save()
//        }

        // Countries
//        if (entities.Country.count()==0) {
            def cou1 = new entities.Country(name:"ΕΛΛΑΔΑ", nameInt:"GREECE", iso2:"GR", numCode:30, internetCode:"gr", capital:"Athens", phoneCode:"0030", currency:curr1, iban:iban1).save()
//        }
            
        //{
        //  capital: "Athens",
        //  currency: {
        //    class: "Currency",
        //    id: 1
        //  },
        //  dateCreated: "2013-11-27T14:58:26Z",
        //  dateFormat: "dd-mm-yyyy",
        //  holidays: [],
        //  iban: {
        //    class: "Iban",
        //    id: 1
        //  },
        //  internetCode: "0",
        //  iso2: "GR",
        //  iso3: "GRE",
        //  languages: [
        //    {
        //      class: "Language",
        //      id: 1
        //    }
        //  ],
        //  lastUpdated: "2013-11-27T14:58:26Z",
        //  name: "Ελλάδα",
        //  nameInt: "Greece",
        //  notes: null,
        //  numCode: 30,
        //  phoneCode: "+30",
        //  timeZones: [
        //    {
        //      class: "Timezone",
        //      id: 433
        //    }
        //  ],
        //  workingDays: "MTWTF--"
        //}
                
                // Timezones
            if (entities.Timezone.count()==0) {
                TimeZone.getAvailableIDs()sort().each() {
                    if (!it.contains("System")) {
                        new entities.Timezone(location:"${it.toUpperCase()}", offset: "${String.format('%+2.2f',TimeZone.getTimeZone("${it}").getOffset(Calendar.ZONE_OFFSET).toInteger() / 3600000).replace(',',':')}").save()
                    }
                }
            }

            def bank = new entities.TheBank(shortName:"AB", officialName:"Ευέλικτη Τράπεζα",officialNameInt:"Agile Bank", swiftBankCode:"AGBK0123", 
            hostCountry:cou1, baseCurrency:curr1, officialLanguage:lang1,iBAN:iban1,orgTreeRoot:oun1, hQTimezone:433).save() //(failOnError: true)
                
        }            
    }
        
    def destroy = {
    }
}