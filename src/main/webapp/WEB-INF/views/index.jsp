<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Business Portal</title>

  <!-- Font Awesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    * {
      margin: 0; padding: 0; box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      height: 100vh;
      background: linear-gradient(to right, #f1f1f1, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
      color: #333;
    }

    .container {
      display: flex;
      width: 95%; max-width: 1200px; min-height: 600px;
      background: #fff;
      border-radius: 20px;
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .left {
      flex: 1;
      background: #f9f9f9;
      padding: 40px 30px;
      display: flex;
      flex-direction: column;
      justify-content: center;
      border-right: 1px solid #ddd;
    }

    .logo {
      display: flex;
      align-items: center;
      margin-bottom: 40px;
    }

    .logo img {
      width: 35px;
      margin-right: 15px;
    }

    .logo h2 {
      font-size: 26px;
      color: #444;
      font-weight: bold;
    }

    .left h3 {
      font-size: 22px;
      margin-bottom: 20px;
      color: #444;
    }

    .role-btn {
      width: 100%;
      padding: 12px 20px;
      margin: 10px 0;
      background: linear-gradient(135deg, #74ebd5, #acb6e5);
      color: #000;
      border: none;
      border-radius: 8px;
      font-weight: bold;
      display: flex;
      align-items: center;
      gap: 12px;
      text-decoration: none;
      justify-content: center;
      transition: 0.3s;
    }

    .role-btn:hover {
      transform: scale(1.05);
      background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
    }

    .right {
      flex: 1.5;
      background: url('https://images.unsplash.com/photo-1603575448362-7206f0ff9b40') no-repeat center;
      background-size: cover;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      text-align: center;
      padding: 40px;
      position: relative;
    }

    .welcome-box {
      background: rgba(255, 255, 255, 0.85);
      border: 2px solid rgba(0, 0, 0, 0.1);
      border-radius: 20px;
      padding: 30px;
      max-width: 600px;
      backdrop-filter: blur(10px);
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.05);
    }

    .welcome-box img {
      width: 60px;
      margin-bottom: 15px;
    }

    .welcome-box h1 {
      font-size: 30px;
      margin-bottom: 15px;
      color: #222;
    }

    .welcome-box p {
      font-size: 18px;
      line-height: 1.6;
      color: #555;
    }

    @media (max-width: 768px) {
      .container {
        flex-direction: column;
      }
      .left {
        border-right: none;
        border-bottom: 1px solid #ddd;
      }
    }
  </style>
</head>
<body>
  <div class="container">

    <!-- Left Section with Role Buttons -->
    <div class="left">
      <div class="logo">
        <img src="https://cdn-icons-png.flaticon.com/512/2622/2622865.png" alt="logo" />
        <h2>Business Connect</h2>
      </div>
      <h3>Quick Access</h3>

      <a href="AdminLogin" class="role-btn">
        <i class="fas fa-user-shield"></i> Admin Login
      </a>
      <a href="BusinessOwnerRegister" class="role-btn">
        <i class="fas fa-user-plus"></i> Register Business
      </a>
      <a href="BusinessOwnerLogin" class="role-btn">
        <i class="fas fa-store"></i> Login Business
      </a>
      <a href="UserRegister" class="role-btn">
        <i class="fas fa-user-edit"></i> Register User
      </a>
      <a href="UserLogin" class="role-btn">
        <i class="fas fa-user"></i> Login User
      </a>
    </div>

    <!-- Right Section with Welcome Message -->
    <div class="right">
      <div class="welcome-box">
        <img src="https://cdn-icons-png.flaticon.com/512/4149/4149607.png" alt="business icon" />
        <h1>Welcome to Business Management Portal</h1>
        <p>
          Manage businesses, users, and administrative access all in one place. Choose your role from the panel on the left to begin.
        </p>
      </div>
    </div>

  </div>
</body>
</html>
