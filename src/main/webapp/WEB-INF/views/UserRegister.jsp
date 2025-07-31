<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Registration</title>

    <!-- Font Awesome for icons -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .form-container {
            background: #ffffff;
            border: 2px solid #ddd;
            border-radius: 16px;
            box-shadow: 0 0 30px rgba(0, 0, 0, 0.08);
            padding: 40px 30px;
            width: 100%;
            max-width: 550px;
        }

        .form-container h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 25px;
            color: #333;
        }

        form {
            width: 100%;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: 500;
            color: #444;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
            background: #f9f9f9;
            font-size: 15px;
            color: #333;
        }

        input:focus {
            outline: none;
            background: #fff;
            border-color: #888;
        }

        input[type="submit"] {
            width: 100%;
            margin-top: 20px;
            padding: 14px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #74ebd5, #acb6e5);
            color: #000;
            font-weight: bold;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
            transform: scale(1.02);
        }

        .links {
            text-align: center;
            margin-top: 20px;
        }

        .links a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            font-size: 14px;
            color: #555;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>User Registration</h2>
    <form action="UserRegisterSubmit" method="post">
        <label for="userContact">Contact:</label>
        <input type="text" id="userContact" name="userContact" required>

        <label for="userName">Name:</label>
        <input type="text" id="userName" name="userName" required>

        <label for="userEmail">Email:</label>
        <input type="email" id="userEmail" name="userEmail" required>

        <label for="userPassword">Password:</label>
        <input type="password" id="userPassword" name="userPassword" required>

        <label for="userCity">City:</label>
        <input type="text" id="userCity" name="userCity" required>

        <input type="submit" value="Submit">
    </form>

    <div class="links">
        <a href="index"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>
</div>

</body>
</html>
