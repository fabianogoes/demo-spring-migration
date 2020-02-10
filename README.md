# Demo Spring Boot Migration with Flyway

- Add Gradle plugin: `id("org.flywaydb.flyway") version "6.2.2"`  
- To configure Spring properties default: `application.properties`   
     
```
spring.datasource.url=jdbc:postgresql://localhost:5432/demo
spring.datasource.username=postgres
spring.datasource.password=postgres

spring.jpa.show-sql=true
spring.jpa.generate-ddl=false
spring.jpa.hibernate.ddl-auto=validate
spring.jpa.properties.hibernate.format_sql=false

spring.flyway.enabled=false

logging.level.root=INFO
logging.level.org.flywaydb=DEBUG
logging.level.org.springframework=INFO
logging.level.org.hibernate=ERROR
```   
   
- To configure Spring properties dbmigration: `application-dbmigration.properties`   
```
spring.main.web-application-type=none

spring.flyway.enabled=true
spring.flyway.locations=classpath:db/migration
```

- Running Postgres by docker:   

```
sudo docker run -p 5432:5432 -d \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB=demo \
    -v pgdata:/var/lib/postgresql/data \
    postgres
```

- Running application in **default** mode: `SPRING_PROFILES_ACTIVE=default ./gradlew clean bootRun`

:warning: In this mode you **should not** run migration  

- Running application in **dbmigration** mode: `SPRING_PROFILES_ACTIVE=dbmigration ./gradlew clean bootRun`

:warning: In this mode you **should** run migration