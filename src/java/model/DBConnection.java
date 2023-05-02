package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection createConnection() {
        Connection conn = null;
        String host = "jdbc:derby://localhost:1527/pepegaco"; //DB URL
        String username = "nbuser"; //DB username
        String password = "nbuser"; //DB password   
        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver"); //load driver
            conn = DriverManager.getConnection(host, username, password); //connnect db

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
