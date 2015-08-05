package WAD;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class dbConnection {
    private final String url;
    private final String user;
    private final String password;
    
    public dbConnection(){
        url="jdbc:mysql://localhost/login?";
        user="root";
        password="root";
    }
    
    public ArrayList getColumn(String table, String label, String order){
        ArrayList info=new ArrayList();
        Connection con=getConnection(url, user, password);
        try{
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM "+table+" ORDER BY "+order);
            while(rs.next()){
                info.add(rs.getString(label));
            }
            con.close();
            
        }catch(SQLException ex){
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return info;
    }
    
    public ArrayList getRow(String table, String id){
        ArrayList info=new ArrayList();
        Connection con=getConnection(url, user, password);
        try{
            
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM "+table+" WHERE name=\""+id+"\"");
            ResultSetMetaData RSMD = rs.getMetaData();
            int columns = RSMD.getColumnCount();
            while(rs.next()){
                for(int i =1; i<columns+1 ; i++)
                    info.add(rs.getString(i));
            }
            con.close();
            
        }catch(SQLException ex){
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return info;
    }
    
    public String getValue(String table, String attribute, String selector, String id){
        String value = null;
        Connection con = getConnection(url, user, password);
        try{
            
            Statement st=con.createStatement();
            String query="SELECT * FROM "+table+" WHERE "+selector+"= \""+id+"\"";
            ResultSet rs=st.executeQuery(query);
            if(rs.next())
                value=rs.getString(attribute);
            con.close();
        }catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return value;
    }
    
    public boolean updateValues(String table, String values, String id){
        boolean succes= false;
        Connection con=getConnection(url, user, password);
        try{
            
            Statement st=con.createStatement();
            String query = "UPDATE "+table+" SET "+ values +" WHERE name=\""+ id+"\"";
            if(st.executeUpdate(query) != 0)
                succes = true;
            con.close();
            
        }catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return succes;
    }
    
    public boolean insertInto(String table, String values){
        Connection con=getConnection(url, user, password);
        boolean succes = false;
        try{
            
            Statement st=con.createStatement();
            String query = "INSERT INTO "+table+" VALUES("+values+")";
            if(st.executeUpdate(query) != 0)
                succes = true;
            con.close();
            
        }catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return succes;
    }
    
    public boolean delete(String table, String id){
        Connection con=getConnection(url, user, password);
        boolean succes = false;
        try{
            
            Statement st=con.createStatement();
            String query = "DELETE FROM "+table+" WHERE name =\""+id+"\"";
            if(st.executeUpdate(query) != 0)
                succes = true;
            con.close();
            
        }catch (SQLException ex) {
            System.out.println("SQLException: " + ex.getMessage());
            System.out.println("SQLState: " + ex.getSQLState());
            System.out.println("VendorError: " + ex.getErrorCode());
        }
        return succes;
    }
    
    private Connection getConnection(String url, String user, String password){
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        }catch(ClassNotFoundException | InstantiationException | IllegalAccessException ex){}
        finally{}
        try{
            con= DriverManager.getConnection(url, user, password);
        }catch(SQLException ex){}finally{}
        return con;
    }
    
    /*public static void main (String [] args){
        dbConnection conn = new dbConnection();
ArrayList<String> users = conn.getColumn("users", "name", "ID");
System.out.println(users);
System.out.println(conn.updateValues("users", "name=\"B\",password=\"C\",ID=2", "A"));
    }*/
}
