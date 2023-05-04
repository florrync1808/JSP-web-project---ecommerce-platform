package model;

import java.sql.*;

public class LoginDao {

    String userIdDB = "";
    String userHumanNameDB = "";
    String userEmailDB = "";
    String passwordDB = "";
    Connection con = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

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
        if (loginUsernameInput.equals(this.userEmailDB) && password.equals(this.passwordDB)) {
            return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
        }
        return "Invalid";
    }

    public void setStaff(String loginUsernameInput, String password) {
        String query = "SELECT * from STAFFS where staff_id=? and password=?";
        try {
            this.con = DBConnection.createConnection(); //Fetch database connection object
            this.statement = con.prepareStatement(query); //Statement is used to write queries. 
            this.statement.setString(1, loginUsernameInput);
            this.statement.setString(2, password);
            this.resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (this.resultSet.next()) // Until next row is present otherwise it return false
            {
                this.userIdDB = resultSet.getString("staff_id"); //fetch the values present in database
                this.userHumanNameDB = resultSet.getString("name"); //fetch the values present in database
                this.userEmailDB = resultSet.getString("email"); //fetch the values present in database
                this.passwordDB = resultSet.getString("password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void setCustomer(String loginUsernameInput, String password) {
        String query = "SELECT * from CUSTOMERS where email=? and password=?";

        try {
            this.con = DBConnection.createConnection(); //Fetch database connection object
            this.statement = con.prepareStatement(query); //Statement is used to write queries. 
            this.statement.setString(1, loginUsernameInput);
            this.statement.setString(2, password);
            this.resultSet = this.statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (this.resultSet.next()) // Until next row is present otherwise it return false
            {
                this.userIdDB = this.resultSet.getString("customer_id"); //fetch the values present in database
                this.userHumanNameDB = this.resultSet.getString("name"); //fetch the values present in database
                this.userEmailDB = this.resultSet.getString("email"); //fetch the values present in database
                this.passwordDB = this.resultSet.getString("password");
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
