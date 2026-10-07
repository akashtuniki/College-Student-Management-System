package com.college.util;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

public class DBConnection {

    private static String URL;
    private static String USER;
    private static String PASSWORD;

    static {

        try {

            Properties properties = new Properties();

            InputStream input =
                    new FileInputStream("db.properties");

            properties.load(input);

            URL =
                    properties.getProperty("db.url");

            USER =
                    properties.getProperty("db.user");

            PASSWORD =
                    properties.getProperty("db.password");

            input.close();

        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName(
                    "oracle.jdbc.OracleDriver"
            );

            con = DriverManager.getConnection(
                    URL,
                    USER,
                    PASSWORD
            );

            System.out.println(
                    "Database Connected Successfully!"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}