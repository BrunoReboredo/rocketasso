package com.rocketasso.api_rck.config;

import javax.sql.DataSource;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.datasource.init.ResourceDatabasePopulator;
import org.springframework.stereotype.Component;

/** Incorpora clubes, escudos y migraciones de puntos históricos verificadas. */
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
        scripts.addScript(new ClassPathResource("db/historical-points.sql"));
        scripts.addScript(new ClassPathResource("db/historical-points-purple.sql"));
        scripts.addScript(new ClassPathResource("db/historical-points-blue.sql"));
        scripts.addScript(new ClassPathResource("db/hall-of-fame.sql"));
        scripts.addScript(new ClassPathResource("db/news-circuit-closure.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-varions.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-ventucorp.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-gmask.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-cierzo.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-karasu.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-galaxy.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-madness.sql"));
        scripts.addScript(new ClassPathResource("db/historical-winx-orion.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-orion.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-legends.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-yayo.sql"));
        scripts.addScript(new ClassPathResource("db/historical-matches-ventucorp.sql"));
        scripts.execute(dataSource);
    }
}