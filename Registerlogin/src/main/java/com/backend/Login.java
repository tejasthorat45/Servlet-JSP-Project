package com.backend;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/loginforrm")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String myemailString = request.getParameter("email1");
        String mypassString = request.getParameter("pass1");

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/yt_demo?useSSL=false", "root", "@Tejas123");

            // Query to validate user
            String sql = "SELECT * FROM Register WHERE email = ? AND password = ?";
            PreparedStatement pStatement = connection.prepareStatement(sql);
            pStatement.setString(1, myemailString);
            pStatement.setString(2, mypassString);

            ResultSet resultSet = pStatement.executeQuery();

            if (resultSet.next()) {
            	HttpSession session = request.getSession();
            	session.setAttribute("Sessionname", resultSet.getString("name"));
            	session.setAttribute("Sessionemail",resultSet.getString("email"));
            	session.setAttribute("Sessioncity",resultSet.getString("city"));
            	session.setAttribute("Sessiongender",resultSet.getString("gender"));
            	
            	
                // User authenticated, forward to profile page
                RequestDispatcher rDispatcher = request.getRequestDispatcher("/profile.jsp");
                rDispatcher.forward(request, response);
            } else {
                // Authentication failed
                out.print("<h3 style='color:red'>Email ID and Password didn't match</h3>");
                RequestDispatcher rDispatcher = request.getRequestDispatcher("/login.jsp");
                rDispatcher.include(request, response);
            }
        } catch (Exception e) {
            // Handle exceptions
            e.printStackTrace();
            out.print("<h3 style='color:red'>" + e.getMessage() + "</h3>");
            RequestDispatcher rDispatcher = request.getRequestDispatcher("/login.jsp");
            rDispatcher.include(request, response);
        }
    }
}
