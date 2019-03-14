package com.webserviceslaboratory.rest;

import com.webserviceslaboratory.data.model.User;
import com.webserviceslaboratory.data.model.Test;

import java.sql.*;
import java.util.Map;
import java.util.HashMap;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
 
@Path("/MCQService")
public class MCQService {
	
	// JDBC driver name and database URL
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
	static final String DB_URL = "jdbc:mysql://localhost/MCQService";
	// Database credentials
    static final String USER = "root";
    static final String PASS = "root";
    
	@GET
	@Path("/{param}")
	public Response getMsg(@PathParam("param") String msg) {
 
		String output = "Welcome " + msg + " !!!";
 
		return Response.status(200).entity(output).build();
 
	}
	
	@POST
	@Path("/register")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response register(User user) {
		
		Connection conn = null;
		Statement stmt = null;
		try{
			//Register JDBC driver
		    Class.forName("com.mysql.jdbc.Driver");

		    //Open a connection
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);

		    //Execute a query
		    stmt = conn.createStatement();
		    
		    String sql = "select * from user";
			  
		    ResultSet rs = stmt.executeQuery(sql);
		    
		    while(rs.next()) {
		    	if((rs.getString("email")).equals(user.getEmail()) && (rs.getString("password")).equals(user.getPassword())) {
		    		return Response.status(201).entity("Already registered!").build();
		    	}
		    }
		      
		    sql = "INSERT INTO user (full_name, email, password) VALUES ('" + user.getFullName() + "','" + user.getEmail() + "','" + user.getPassword() + "')";
		    stmt.executeUpdate(sql);
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try

		return Response.status(201).entity("Registered Successfully!").build();
	}
	
	@POST
	@Path("/login")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response login(User user) {
		
		Connection conn = null;
		Statement stmt = null;
		try{
			//Register JDBC driver
		    Class.forName("com.mysql.jdbc.Driver");

		    //Open a connection
		    conn = DriverManager.getConnection(DB_URL, USER, PASS);

		    //Execute a query
		    stmt = conn.createStatement();
		      
		    String sql = "select * from user";
		  
		    ResultSet rs = stmt.executeQuery(sql);
		    
		    while(rs.next()) {
		    	if((rs.getString("email")).equals(user.getEmail()) && (rs.getString("password")).equals(user.getPassword())) {
		    		return Response.status(201).entity("true").build();
		    	}
		    }
		   }catch(SQLException se){
		      //Handle errors for JDBC
		      se.printStackTrace();
		   }catch(Exception e){
		      //Handle errors for Class.forName
		      e.printStackTrace();
		   }finally{
		      //finally block used to close resources
		      try{
		         if(stmt!=null)
		            stmt.close();
		      }catch(SQLException se2){
		      }// nothing we can do
		      try{
		         if(conn!=null)
		            conn.close();
		      }catch(SQLException se){
		         se.printStackTrace();
		      }//end finally try
		   }//end try

		return Response.status(201).entity("false").build();
	}
	
	@POST
	@Path("/calculateResult")
	@Consumes(MediaType.APPLICATION_JSON)
	public Response calculateResult(Test test) {
		Map<String, String> qnAnswer = new HashMap<String, String>();
		int mark = 0;
		qnAnswer.put("qn1", "153600");
		qnAnswer.put("qn2", ".06");
		qnAnswer.put("qn3", "Friday");
		qnAnswer.put("qn4", "log (2 + 3) = log (2 x 3)");
		qnAnswer.put("qn5", "7.2");
		
		for (Map.Entry<String,String> entry : (test.getSubmittedTest()).entrySet()) {
            if((entry.getValue()).equals(qnAnswer.get(entry.getKey()))) {
            	mark += 2;
            }
    	} 
		
		return Response.status(201).entity(String.valueOf(mark)).build();
	}	
}