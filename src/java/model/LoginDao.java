package model;

import java.sql.*;

public class LoginDao {

    public String authenticateUser(LoginBean loginBean) {
        String userName = loginBean.getUserName(); //Assign user entered values to temporary variables.
        String password = loginBean.getPassword();

        String staffLog = "";
        String customerLog = "";

        staffLog = staffLogin(userName, password);
        customerLog = customerLogin(userName, password);

        if (staffLog.equals("SUCCESS")) {
            return "STAFFSUCCESS";
        }
        else if (customerLog.equals("SUCCESS")) {
            return "CUSTOMERSUCCESS";
        }
        return "Invalid Login Credentials"; // Return appropriate message in case of failure
    }

    public String staffLogin(String userName, String password) {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";
        String query = "SELECT * from STAFFS where staff_id=? and password=?";

        try {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                userNameDB = resultSet.getString("staff_id"); //fetch the values present in database
                passwordDB = resultSet.getString("password");

                if (userName.equals(userNameDB) && password.equals(passwordDB)) {
                    return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid";
    }

    public String customerLogin(String userName, String password) {
        Connection con = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        String userNameDB = "";
        String passwordDB = "";
        String query = "SELECT * from CUSTOMERS where email=? and password=?";

        try {
            con = DBConnection.createConnection(); //Fetch database connection object
            statement = con.prepareStatement(query); //Statement is used to write queries. 
            statement.setString(1, userName);
            statement.setString(2, password);
            resultSet = statement.executeQuery(); //the table name is users and userName,password are columns. Fetching all the records and storing in a resultSet.

            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                userNameDB = resultSet.getString("email"); //fetch the values present in database
                passwordDB = resultSet.getString("password");

                if (userName.equals(userNameDB) && password.equals(passwordDB)) {
                    return "SUCCESS"; ////If the user entered values are already present in the database, which means user has already registered so return a SUCCESS message.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "Invalid";
    }
}
