package com.backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/regiform")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Register() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        String myname = request.getParameter("name1");
        String myemailString = request.getParameter("email1");
        String mypass = request.getParameter("pass1");
        String mygender = request.getParameter("gender1");
        String mycitString = request.getParameter("city1");

        // Validate that all fields are filled
        if (myname.isEmpty() || myemailString.isEmpty() || mypass.isEmpty() || mygender.isEmpty() || mycitString.isEmpty()) {
            out.print("<h3 style='color:red'>All fields are required.</h3>");
            RequestDispatcher Rd = request.getRequestDispatcher("/register.jsp");
            Rd.include(request, response);
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yt_demo", "root", "@Tejas123");

            // Check if email is already registered
            PreparedStatement psCheckEmail = con.prepareStatement("SELECT * FROM register WHERE email = ?");
            psCheckEmail.setString(1, myemailString);
            ResultSet rs = psCheckEmail.executeQuery();

            if (rs.next()) {
                // Email already exists
                request.setAttribute("errorMessage", "Email already registered. Please use a different email.");
                RequestDispatcher Rd = request.getRequestDispatcher("/register.jsp");
                Rd.forward(request, response);
                return;
            }

            // Insert user data into the database
            PreparedStatement ps = con.prepareStatement("INSERT INTO register (name, email, password, gender, city) VALUES (?, ?, ?, ?, ?)");
            ps.setString(1, myname);
            ps.setString(2, myemailString);
            ps.setString(3, mypass); // Plain text password
            ps.setString(4, mygender);
            ps.setString(5, mycitString);

            int count = ps.executeUpdate();

            if (count > 0) {
                // Registration successful
            	
                out.print("<h3 style='color:green'>User registration successful!</h3>");
                RequestDispatcher Rd = request.getRequestDispatcher("/register.jsp");
                Rd.include(request, response);
            } else {
                // Registration failed
                out.print("<h3 style='color:red'>User registration failed. Please try again.</h3>");
                RequestDispatcher Rd = request.getRequestDispatcher("/register.jsp");
                Rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher Rd = request.getRequestDispatcher("/register.jsp");
            Rd.include(request, response);
        }
    }
}
