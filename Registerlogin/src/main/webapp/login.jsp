<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
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
    input {
        width: 100%;
        padding: 8px;
        margin-bottom: 10px;
    }
    input[type="submit"] {
        background-color: #007BFF;
        color: white;
        border: none;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .message {
        color: red;
        text-align: center;
        margin-bottom: 20px;
    }
</style>
</head>
<body>
    <h2 style="text-align: center;">User Login</h2>

    <div class="message">
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) { 
        %>
            <p><%= message %></p>
        <% } %>
    </div>

    <form action="loginforrm" method="post">
        <label for="email1">Email:</label>
        <input type="email" id="email1" name="email1" required />

        <label for="pass1">Password:</label>
        <input type="password" id="pass1" name="pass1" required />

        <input type="submit" value="Login" />
    </form>
</body>
</html>
