dataSource {
    // h2
//    pooled = true
//    driverClassName = "org.h2.Driver"
//    username = "sa"
//    password = ""

    // MySQL
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    username = "client" 
    password = "agiler" 

}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}


// environment specific settings
environments {
    development {
        dataSource {
            dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
//            url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            url = "jdbc:mysql://localhost:3306/commons?useUnicode=yes&characterEncoding=UTF-8"   
//            url = "jdbc:mysql://" + "nslookup commons.db control.lan".execute().text.trim().split(/(\n)/).last().split(/(:)/)[1].trim() + ":3306/commons?useUnicode=yes&characterEncoding=UTF-8" 
            url = "jdbc:mysql://commons.db:3306/commons?useUnicode=yes&characterEncoding=UTF-8" 
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
//            url = "jdbc:mysql://localhost:3306/commons" 
        }
    }
    production {
        dataSource {
            dbCreate = "update"
//            url = "jdbc:h2:prodDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
            url = "jdbc:mysql://commons.db:3306/commons?useUnicode=yes&characterEncoding=UTF-8"     
            properties {
               // See http://grails.org/doc/latest/guide/conf.html#dataSource for documentation
               jmxEnabled = true
               initialSize = 5
               maxActive = 50
               minIdle = 5
               maxIdle = 25
               maxWait = 10000
               maxAge = 10 * 60000
               timeBetweenEvictionRunsMillis = 5000
               minEvictableIdleTimeMillis = 60000
               validationQuery = "SELECT 1"
               validationQueryTimeout = 3
               validationInterval = 15000
               testOnBorrow = true
               testWhileIdle = true
               testOnReturn = false
               jdbcInterceptors = "ConnectionState;StatementCache(max=200)"
               defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
            }
        }
    }
}