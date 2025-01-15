<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 300px;
            margin: 0 auto;
        }
        label {
            display: block;
            margin-bottom: 8px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            margin-bottom: 20px;
        }
        .message p {
            font-size: 16px;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            color: #007BFF;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">User Registration</h2>

    <div class="message">
        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            String successMessage = (String) request.getAttribute("successMessage");

            if (errorMessage != null) {
                out.print("<p style='color:red;'>" + errorMessage + "</p>");
            }
            if (successMessage != null) {
                out.print("<p style='color:green;'>" + successMessage + "</p>");
            }
        %>
    </div>

    <form action="regiform" method="post">
        <label for="name1">Name:</label>
        <input type="text" id="name1" name="name1" required />

        <label for="email1">Email:</label>
        <input type="email" id="email1" name="email1" required />

        <label for="pass1">Password:</label>
        <input type="password" id="pass1" name="pass1" required />

        <label>Gender:</label>
        <input type="radio" id="male" name="gender1" value="male" required />
        <label for="male" style="display: inline;">Male</label>
        <input type="radio" id="female" name="gender1" value="female" required />
        <label for="female" style="display: inline;">Female</label>

        <label for="city1">City:</label>
        <select id="city1" name="city1" required>
            <option value="">Select City</option>
            <option value="Delhi">Delhi</option>
            <option value="Pune">Pune</option>
            <option value="Mumbai">Mumbai</option>
            <option value="Bangalore">Bangalore</option>
        </select>

        <input type="submit" value="Register" />
    </form>

    <div class="login-link">
        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>
