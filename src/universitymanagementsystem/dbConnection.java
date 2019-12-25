/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package universitymanagementsystem;
import java.sql.*;
/**
 *
 * @author Pasindu Chinthana
 */
public class dbConnection {
    
    Connection con;
    ResultSet rs;
    Statement stmt;
    
    public dbConnection(){
    }
    public ResultSet getResult(String query){
        rs=null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://"+dbConnector.host+":"+dbConnector.port+"/university_management_system",""+dbConnector.dbUsername+"",""+dbConnector.dbPassword+"");
            stmt=con.createStatement();
            rs=stmt.executeQuery(query);  
        }catch(Exception e){
        System.out.println("GetResult Error : "+e);
        }
        return rs;
    }
    
    public void insertResult(String query){
        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://"+dbConnector.host+":"+dbConnector.port+"/university_management_system",""+dbConnector.dbUsername+"",""+dbConnector.dbPassword+"");
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.execute();
        }catch(Exception e){
        System.out.println("InsertResult Error : "+e);
        }
        
    }
}
