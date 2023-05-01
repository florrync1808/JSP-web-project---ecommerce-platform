package da;

import domain.Country;
import java.sql.*;
import java.util.ArrayList;

public class CountriesDA {

    private String host = "jdbc:derby://localhost:1527/pepegaco";
    private String user = "nbuser";
    private String password = "nbuser";
    private String tableName = "";
    private Connection conn;
    private PreparedStatement stmt;
    private String sqlQueryStr = "SELECT * from " + tableName;
    private String sqlInsertStr = "INSERT INTO " + tableName + " VALUES(?, ?, ?)";
    private ResultSet rs;

    public CountriesDA() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(host, user, password);
            stmt = conn.prepareStatement(sqlQueryStr);
        } catch (Exception ex) {
            ex.getMessage();
        }
    }

    public Country getCurrentRecord() {
        Country country = null;
        try {
            country = new Country(rs.getString(1), rs.getString(2), rs.getString(3));
        } catch (SQLException ex) {
            ex.getMessage();
        }
        return country;
    }

    public void addRecord(Country country) {
        try {
            PreparedStatement stmt = conn.prepareStatement(sqlInsertStr);
            stmt.setString(1, country.getName());
            stmt.setString(2, country.getFullName());
            stmt.setString(3, country.getCapital());
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.getMessage();
        }
    }

    public ArrayList<Country> getCountries() {

        ArrayList<Country> countries = new ArrayList<Country>();
        try {
            stmt = conn.prepareStatement(sqlQueryStr);
            rs = stmt.executeQuery();
            while (rs.next()) {
                countries.add(getCurrentRecord());
            }
        } catch (SQLException ex) {
            ex.getMessage();
        }

        return countries;
    }

//    private static Connection conn2;


    public static String login(domain.LoginPost loginPost) {
        // https://krazytech.com/programs/a-login-application-in-java-using-model-view-controllermvc-design-pattern
        Connection conn2;
        String query = "select * from CUSTOMERS where name=? and password=?";
        try {
            PreparedStatement stmt = conn2.prepareStatement(query);
            stmt.setString(1, loginPost.getEmail());
            stmt.setString(2, loginPost.getPassword());
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return "true";
            } else {
                return "false";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "error";
    }
}
