package model;

import java.sql.*;

public class LoginDao {

    private String userIdDB = "";
    private String userHumanNameDB = "";
    private String userEmailDB = "";
    private String passwordDB = "";
    private Connection con = null;
    private PreparedStatement statement = null;
    private ResultSet resultSet = null;

    public String authenticateUser(String loginUsernameInput, String password) {

        String staffLog = "";
        String customerLog = "";

        staffLog = staffLogin(loginUsernameInput, password);
        customerLog = customerLogin(loginUsernameInput, password);

        if (staffLog.equals("SUCCESS")) {
            return "STAFFSUCCESS";
        } else if (customerLog.equals("SUCCESS")) {
            return "CUSTOMERSUCCESS";
        }
        return "Invalid Login Credentials"; // Return appropriate message in case of failure
    }

    public String staffLogin(String loginUsernameInput, String password) {
        this.setStaff(loginUsernameInput, password);

        if (loginUsernameInput.equals(userIdDB) && password.equals(passwordDB)) {
            return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
        }
        return "Invalid";
    }

    public String customerLogin(String loginUsernameInput, String password) {

        this.setCustomer(loginUsernameInput, password);
        if (loginUsernameInput.equals(userEmailDB) && password.equals(passwordDB)) {
            return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
        }
        return "Invalid";
    }

    public void setStaff(String loginUsernameInput, String password) {
        String query = "SELECT * from STAFFS where staff_id=? and password=?";
        try {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1, loginUsernameInput);
            statement.setString(2, password);
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (this.resultSet.next()) // Until next row is present otherwise it return false
            {
                userIdDB = resultSet.getString("staff_id"); //fetch the values present in database
                userHumanNameDB = resultSet.getString("name"); //fetch the values present in database
                userEmailDB = resultSet.getString("email"); //fetch the values present in database
                passwordDB = resultSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setCustomer(String loginUsernameInput, String password) {
        String query = "SELECT * from CUSTOMERS where email=? and password=?";

        try {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1, loginUsernameInput);
           statement.setString(2, password);
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (resultSet.next()) // Until next row is present otherwise it return false
            {
               userIdDB = resultSet.getString("customer_id"); //fetch the values present in database
                userHumanNameDB = resultSet.getString("name"); //fetch the values present in database
                userEmailDB = resultSet.getString("email"); //fetch the values present in database
                passwordDB = resultSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public String getUserIdDB() {
        return userIdDB;
    }

    public String getUserHumanNameDB() {
        return userHumanNameDB;
    }

    public String getUserEmailDB() {
        return userEmailDB;
    }
}
