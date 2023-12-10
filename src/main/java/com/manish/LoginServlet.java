package com.manish;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet{
       
	protected void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
	
		String userEmail = req.getParameter("email");
		String password = req.getParameter("password");
		
		PrintWriter out = res.getWriter();
		  HttpSession session = req.getSession();
		   RequestDispatcher rd = null;
		try {
			 //db connection
			 Class.forName("org.postgresql.Driver");
			  Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/postgres", "postgres", "root");
			  String q = "select * from person where email = ? and password = ?";
			  
			  PreparedStatement stmt = conn.prepareStatement(q);
			  stmt.setString(1, userEmail);
			  stmt.setString(2, password);
			  
			  ResultSet rs = stmt.executeQuery();
			    out.println(rs);
			  if(rs.next()) {
				   session.setAttribute("email", rs.getString("email"));
				   
				//   rd = req.getRequestDispatcher("index.jsp");
				//   rd.forward(req, res);
				  // return;
				  res.sendRedirect("index.jsp");
			  }  
			  else {
				    req.setAttribute("status", "failed"); 
				    rd = req.getRequestDispatcher("login.jsp");
			  }
			  
			  rd.forward(req, res);
			   
			 
		}   
		catch(Exception e) {
			   e.printStackTrace();
			   out.println("error");
			   
			}
		
	}
}
