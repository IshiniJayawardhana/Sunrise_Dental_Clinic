package com.sunriseDental.util;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;


public final class dbConnection {

    private static final String CONFIG_FILE = "db.properties";
    private static String url;
    private static String username;
    private static String password;

    static {
        Properties props = new Properties();
        try (InputStream in = dbConnection.class.getClassLoader().getResourceAsStream(CONFIG_FILE)) {
            if (in == null) {
                throw new RuntimeException(
                        "Could not find " + CONFIG_FILE + " on the classpath. " +
                        "Place it in WEB-INF/classes (or src/main/resources if using Maven).");
            }
            props.load(in);

            String driver = props.getProperty("db.driver");
            url = props.getProperty("db.url");
            username = props.getProperty("db.username");
            password = props.getProperty("db.password");

            if (driver == null || url == null) {
                throw new RuntimeException("db.properties is missing db.driver or db.url");
            }

            // Loads and registers the JDBC driver class
            Class.forName(driver);

        } catch (IOException e) {
            throw new RuntimeException("Failed to load " + CONFIG_FILE, e);
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("JDBC driver class not found on classpath. " +
                    "Add the driver jar (e.g. mysql-connector-j) to WEB-INF/lib.", e);
        }
    }

    private dbConnection() {
       
    }

     public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(url, username, password);
    }
}
