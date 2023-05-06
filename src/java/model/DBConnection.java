package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBConnection {

    public static Connection conn;
    public static PreparedStatement statement = null;
    public static ResultSet resultSet = null;

    public static Connection createConnection() {
        conn = null;
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
    public static void insertUpdateFromSqlQuery(String SqlQueryString) {

        try {
            //Checking whether the connection is null or null
            if (conn == null) {
                conn = createConnection();
            }
            //Querying the query
            conn.createStatement().executeUpdate(SqlQueryString);

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public static ResultSet getRSfromQuery(String SqlQueryString){
            ResultSet rs = null;
        try {
            statement = conn.prepareStatement(SqlQueryString);
            rs = statement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
            return rs;
    }

    public static boolean searchForExistingProduct(String productId, String custId) {
        try {
            //Checking whether the connection is null or null
            if (conn == null) {
                conn = createConnection();
            }
            //Querying the query
            String query = "SELECT * FROM CART_LISTS WHERE CUSTOMER_ID=? AND PRODUCT_ID=? ";
            statement = conn.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1,custId );
            statement.setString(2, productId);
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
            System.out.println(resultSet);
            if (resultSet.next()) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }
    
    public static boolean searchForExistingCustomer(String email) {
        try {
            //Checking whether the connection is null or null
            if (conn == null) {
                conn = createConnection();
            }
            //Querying the query
            String query = "SELECT * FROM CUSTOMERS WHERE EMAIL=? ";
            statement = conn.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1,email );
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.
            System.out.println(resultSet);
            if (resultSet.next()) {
                return true;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return false;
    }

}
