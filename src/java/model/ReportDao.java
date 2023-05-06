package model;

import java.sql.*;

public class ReportDao {

    Connection con = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    String userNameDB = "";
    String passwordDB = "";
    String query = "SELECT SUM(OL.ORDER_QTY), P.PRODUCT_NAME from Order_Lists OL join Products P on OL.PRODUCT_ID = P.PRODUCT_ID group by P.PRODUCT_NAME";

    public ResultSet selectRecord() {
        String query = "SELECT SUM(OL.ORDER_QTY), P.PRODUCT_NAME from Order_Lists OL join Products P on OL.PRODUCT_ID = P.PRODUCT_ID group by P.PRODUCT_NAME";
        resultSet = null;
        try {
            con = DBConnection.createConnection(); 
            statement = con.prepareStatement(query);
            resultSet = statement.executeQuery();
            
        } catch (SQLException e) {
            e.printStackTrace();

        }
        return resultSet;
    }

}
