<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Change Password - User Panel</title>

  <!-- Font Awesome -->
  <link rel="stylesheet"
        href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Segoe UI', sans-serif;
    }

    body {
      height: 100vh;
      display: flex;
      background: #f0f0f0;
    }

    .sidebar {
      width: 270px;
      background: #f7f7f7;
      border-right: 1px solid #ddd;
      display: flex;
      flex-direction: column;
      padding: 30px 20px;
      box-shadow: 8px 0 20px rgba(0, 0, 0, 0.05);
      position: relative;
    }

    .header {
      margin-bottom: 30px;
    }

    .logo {
      display: flex;
      flex-direction: column;
    }

    .logo .title {
      display: flex;
      align-items: center;
    }

    .logo img {
      width: 35px;
      margin-right: 10px;
    }

    .logo h2 {
      font-size: 24px;
      color: #222;
      text-shadow: 0 0 4px #fff;
    }

    .logo small {
      margin-top: 6px;
      font-size: 14px;
      color: #666;
      font-weight: 500;
      padding-left: 8px;
      border-left: 3px solid #ccc;
      text-transform: uppercase;
      letter-spacing: 0.5px;
    }

    .nav-links {
      flex-grow: 1;
      margin-top: 20px;
    }

    .nav-links a {
      display: flex;
      align-items: center;
      padding: 12px 16px;
      margin: 10px 0;
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 10px;
      color: #333;
      text-decoration: none;
      font-weight: 500;
      gap: 12px;
      transition: 0.3s ease;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
    }

    .nav-links a:hover {
      background: #f0f0f0;
      transform: translateX(5px);
    }

    .nav-links a i {
      font-size: 16px;
    }

    .logout {
      position: absolute;
      bottom: 15px;
      left: 20px;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: #fff;
      border: 1px solid #e74c3c;
      color: #e74c3c;
      display: flex;
      justify-content: center;
      align-items: center;
      text-decoration: none;
      font-size: 18px;
      box-shadow: 0 0 10px rgba(255, 255, 255, 0.6);
      transition: 0.3s ease;
    }

    .logout:hover {
      background: #e74c3c;
      color: #fff;
    }

    .main-content {
      flex: 1;
      padding: 40px;
      background: #ffffff;
    }

    h2 {
      color: #2c3e50;
      margin-bottom: 20px;
    }

    form {
      background: #fdfdfd;
      padding: 30px;
      border: 1px solid #ddd;
      border-radius: 10px;
      max-width: 500px;
    }

    .input-group {
      position: relative;
      margin-bottom: 25px;
    }

    .input-group input {
      width: 100%;
      padding: 10px 40px 10px 10px;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 16px;
    }

    .input-group i {
      position: absolute;
      right: 10px;
      top: 50%;
      transform: translateY(-50%);
      cursor: pointer;
      color: #888;
    }

    button[type="submit"] {
      padding: 10px 20px;
      background: #2ecc71;
      color: white;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      font-size: 16px;
      transition: 0.3s ease;
    }

    button[type="submit"]:hover {
      background: #27ae60;
    }
  </style>

  <script>
    function togglePassword(id, icon) {
      const input = document.getElementById(id);
      if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    }
  </script>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <div class="header">
      <div class="logo">
        <div class="title">
          <img src="https://cdn-icons-png.flaticon.com/512/2622/2622865.png" alt="logo">
          <h2>LocalBizFinder</h2>
        </div>
        <small>User Dashboard</small>
      </div>
    </div>

    <div class="nav-links">
      <a href="UserDashboard.jsp"><i class="fas fa-home"></i> Dashboard Home</a>
      <a href="UserSearchBusinessByName"><i class="fas fa-search"></i> Search Business</a>
      <a href="UserPasswordChange"><i class="fas fa-key"></i> Change Password</a>
    </div>

    <a href="index.html" class="logout" title="Logout">
      <i class="fas fa-sign-out-alt"></i>
    </a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <h2>Change Your Password</h2>
    <form action="UserPasswordChangeSubmit" method="post" autocomplete="off">

      <div class="input-group">
        <input type="password" id="currentPassword" name="userCurrentPassword" placeholder="Current Password" required />
        <i class="fas fa-eye" onclick="togglePassword('currentPassword', this)"></i>
      </div>

      <div class="input-group">
        <input type="password" id="newPassword" name="userNewPassword" placeholder="New Password" required />
        <i class="fas fa-eye" onclick="togglePassword('newPassword', this)"></i>
      </div>

      <button type="submit">Change Password</button>
    </form>
  </div>

</body>
</html>
