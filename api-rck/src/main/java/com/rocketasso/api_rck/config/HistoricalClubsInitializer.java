package com.rocketasso.api_rck.config;

import javax.sql.DataSource;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;

/** Incorpora clubes ausentes y sus escudos sin sobrescribir estadísticas. */
@Component
public class HistoricalClubsInitializer implements ApplicationRunner {
    private final DataSource dataSource;

    public HistoricalClubsInitializer(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    @Override
    public void run(ApplicationArguments args) {
        ResourceDatabasePopulator scripts = new ResourceDatabasePopulator();
        scripts.setSqlScriptEncoding("UTF-8");
        scripts.addScript(new ClassPathResource("db/historical-aliases.sql"));
        scripts.addScript(new ClassPathResource("db/historical-clubs.sql"));
        scripts.addScript(new ClassPathResource("db/historical-logos.sql"));
        scripts.execute(dataSource);
    }
}