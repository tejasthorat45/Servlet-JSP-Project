<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile Page</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f9;
        color: #333;
    }

    header {
        background-color: #4CAF50;
        color: white;
        padding: 20px 0;
        text-align: center;
    }

    header h1 {
        margin: 0;
        font-size: 2.5rem;
    }

    main {
        max-width: 800px;
        margin: 50px auto;
        background: white;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }

    .welcome-message {
        text-align: center;
        margin-bottom: 20px;
    }

    .welcome-message h3 {
        font-size: 1.8rem;
        color: #4CAF50;
    }

    .profile-details {
        margin: 20px 0;
    }

    .profile-details h2 {
        font-size: 1.5rem;
        margin-bottom: 10px;
        color: #333;
        border-bottom: 2px solid #4CAF50;
        display: inline-block;
    }

    .profile-details ul {
        list-style: none;
        padding: 0;
    }

    .profile-details li {
        padding: 8px 0;
        font-size: 1.1rem;
        color: #555;
    }

    footer {
        text-align: center;
        margin-top: 30px;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        font-size: 0.9rem;
    }

    .logout-button {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        background-color: #f44336;
        color: white;
        text-decoration: none;
        border-radius: 5px;
        font-size: 1rem;
        text-align: center;
        transition: background-color 0.3s ease;
    }

    .logout-button:hover {
        background-color: #d32f2f;
    }
</style>
</head>
<body>
    <header>
        <h1>Your Profile</h1>
    </header>

    <main>
        <div class="welcome-message">
            <h3>Welcome, <strong>${Sessionname}</strong>!</h3>
            <p>We’re glad to have you here. Below are your profile details.</p>
        </div>

        <div class="profile-details">
            <h2>Profile Information</h2>
            <ul>
                <li><strong>Name:</strong> ${Sessionname}</li>
                <li><strong>Email:</strong> ${Sessionemail}</li>
                <li><strong>City:</strong> ${Sessioncity}</li>
                <li><strong>Gender:</strong> ${Sessiongender}</li>
            </ul>
        </div>

        <a href="register.jsp" class="logout-button">Logout</a>
    </main>

    <footer>
        &copy; 2025 Your Company. All rights reserved.
    </footer>
</body>
</html>
