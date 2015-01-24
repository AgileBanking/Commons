class UrlMappings {

	static mappings = {
        "/currency/getByIso3/$iso3" (controller:"currency", action: "getByIso3")
        "/channel/getByCode/$code" (controller:"channel", action: "getByCode")
        "/IBAN/getByIso3/$iso3"(controller:"IABN", action: "getByIso3")
        "/language/getByIso2/$iso2"(controller:"language", action: "getByIso2")
        "/country/getByIso2/$iso2"(controller:"country", action: "getByIso2")
        "/orgUnitType/getByCode/$code" (controller:"orgUnitType", action: "getByCode")
        "/timezone/getByLocation/$location" (controller:"timezone", action:"getByLocation")
//        "/holiday/getHolidaysOfYear/$iso3/$year?" (controller:"holiday", action:"getHolidayOfYear")
        
        
       
        "/$controller/$action?/$id?(.$format)?"{
//        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}
