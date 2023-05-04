package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
 
    public static Connection conn;
    
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
    //universal method to query for inserting or updating information in mysql database
    public static int insertUpdateFromSqlQuery(String SqlQueryString) {
        int i = 2;
        try {
            //Checking whether the connection is null or null
            if (conn == null) {
                createConnection();
            }
            //Querying the query
            i = conn.createStatement().executeUpdate(SqlQueryString);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return i;
    }
    
    

}
