package com.manish;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet{
   
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		  PrintWriter out = res.getWriter() ; 
		  
		//  out.println("Hello");
		  
		 String userName = req.getParameter("name");
		 String userEmail = req.getParameter("email");
		 String userPassword = req.getParameter("pass");
		 String userContact = req.getParameter("contact");
		 
		  RequestDispatcher rd = null;
		 out.println(userName + "  "+ userEmail + " "+ userPassword);
		 
		 out.println(userContact);
		  Connection conn = null;
	
		  
		 try {
			   Class.forName("org.postgresql.Driver");
			   conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root");
		
			   
			   
			 String query = "insert into person(name, email, password, contact) values(?,?,?,?)";
			 
			  
			  PreparedStatement stmt = conn.prepareStatement(query);
			  
			  stmt.setString(1, userName);
			  stmt.setString(2, userEmail);
			  stmt.setString(3, userPassword);
			  stmt.setString(4, userContact);
			  
			    int rowCount =  stmt.executeUpdate();
			    rd = req.getRequestDispatcher("registration.jsp");
			    
			     out.println("done");
			    if(rowCount > 0) {
			    	 req.setAttribute("status", "success");
			    	 
			    }
			    else {
			    	 req.setAttribute("status", "failed");
			    }
			  
			 // out.println("connected to db");
			    rd.forward(req, res);
			       
			    
		 
		 }  
		 catch(Exception e) {
			   e.printStackTrace();
			   out.println(e.getMessage());
		 }
		  
		 
		 finally {
			  try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		 }
		  }
		 
	     
		 
	}
	
