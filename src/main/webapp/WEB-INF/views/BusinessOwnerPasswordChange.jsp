<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Change Password - Owner Dashboard</title>

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
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 40px;
      background: #ffffff;
    }

    .change-box {
      background: #ffffff;
      border: 2px solid #ddd;
      border-radius: 16px;
      box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
      padding: 50px 40px;
      width: 95%;
      max-width: 480px;
    }

    .change-box h2 {
      text-align: center;
      color: #333;
      font-size: 28px;
      margin-bottom: 30px;
    }

    .input-group {
      margin-bottom: 25px;
      position: relative;
    }

    .input-group input {
      width: 100%;
      padding: 14px 16px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background: #f9f9f9;
      color: #333;
      font-size: 16px;
    }

    .input-group input::placeholder {
      color: #888;
    }

    .input-group input:focus {
      outline: none;
      background: #fff;
      border-color: #999;
    }

    .input-group i {
      position: absolute;
      right: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #888;
      cursor: pointer;
    }

    .error {
      color: red;
      text-align: center;
      margin-top: 15px;
      font-size: 14px;
      font-weight: 500;
    }

    button {
      width: 100%;
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

    button:hover {
      background: linear-gradient(135deg, #a1c4fd, #c2e9fb);
      transform: scale(1.02);
    }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <div class="header">
      <div class="logo">
        <div class="title">
          <img src="https://cdn-icons-png.flaticon.com/512/2659/2659360.png" alt="logo">
          <h2>LocalBizFinder</h2>
        </div>
        <small>Owner Dashboard</small>
      </div>
    </div>

    <div class="nav-links">
      <a href="ViewOwnBusinessInformation"><i class="fas fa-store"></i> View Business Info</a>
      <a href="UpdateOwnBusinessInformation"><i class="fas fa-store"></i> Update Business Info</a>
      <a href="ViewReviewsOwnBusiness"><i class="fas fa-comments"></i> Business Reviews</a>
      <a href="ViewAllBusiness"><i class="fas fa-briefcase"></i> Explore Businesses</a>
      <a href="BusinessOwnerPasswordChange"><i class="fas fa-key"></i> Change Password</a>
    </div>

    <a href="index.html" class="logout" title="Logout">
      <i class="fas fa-sign-out-alt"></i>
    </a>
  </div>

  <!-- Main Content -->
  <div class="main-content">
    <form class="change-box" action="BusinessOwnerPasswordChangeSubmit" method="post" autocomplete="off">
      <h2>Change Password</h2>

      <div class="input-group">
        <input type="password" id="currentPassword" name="currentPassword" placeholder="Current Password" required />
        <i class="fas fa-eye" onclick="togglePassword('currentPassword', this)"></i>
      </div>

      <div class="input-group">
        <input type="password" id="newPassword" name="newPassword" placeholder="New Password" required />
        <i class="fas fa-eye" onclick="togglePassword('newPassword', this)"></i>
      </div>

      <button type="submit">Change Password</button>
    </form>
  </div>

  <script>
    function togglePassword(fieldId, icon) {
      const input = document.getElementById(fieldId);
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

</body>
</html>
