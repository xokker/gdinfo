package com.hackaton.duma.pool;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.commons.dbcp.DataSourceConnectionFactory;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

/**
 * Created by IntelliJ IDEA.
 * User: ernest
 * Date: 9/14/13
 * Time: 6:22 PM
 */
@Component(value = "connectionPool")
public class ConnectionPool extends DataSourceConnectionFactory {
    public ConnectionPool() {
        super(setupDataSource());
    }

    public static DataSource setupDataSource() {
        BasicDataSource ds = new BasicDataSource();
        ds.setDriverClassName("org.postgresql.Driver");
        ds.setUsername("postgres");
        ds.setPassword("23574");
        ds.setUrl("jdbc:postgresql://localhost:5432/gdinfo");
        return ds;
    }
}
