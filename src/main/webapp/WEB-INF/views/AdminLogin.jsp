<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login - Disaster Relief</title>

<!-- Font Awesome -->
<link rel="stylesheet" 
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

<style>
  * {
    margin: 0; padding: 0; box-sizing: border-box;
    font-family: 'Segoe UI', sans-serif;
  }

  body {
    background: #fff;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  .login-box {
    background: #ffffff;
    border: 2px solid #ddd;
    border-radius: 16px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
    padding: 50px 40px;
    width: 95%;
    max-width: 480px;
  }

  .login-box h2 {
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

  .message {
    text-align: center;
    margin-top: 15px;
    font-size: 14px;
    font-weight: 500;
  }

  .error {
    color: red;
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

  .back {
    text-align: center;
    margin-top: 20px;
  }

  .back a {
    color: #555;
    text-decoration: none;
    font-size: 14px;
  }

  .back a:hover {
    text-decoration: underline;
  }
</style>
</head>
<body>

  <form class="login-box" action="AdminLoginSubmit" method="post" autocomplete="off">
    <h2>Admin Login</h2>

    <div class="input-group">
      <input type="email" name="aemail" placeholder="Enter Email" required />
    </div>

    <div class="input-group">
      <input type="password" id="apassword" name="apassword" placeholder="Enter Password" required />
      <i class="fas fa-eye" id="togglePassword" onclick="togglePassword()"></i>
    </div>

    <button type="submit">Login</button>

    <div class="back">
      <a href="index"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>

    <div class="message" id="errorMsg"></div>
    <script>
      const params = new URLSearchParams(window.location.search);
      if (params.get('status') === 'fail') {
        document.getElementById("errorMsg").innerHTML = '<p class="error">Incorrect email or password!</p>';
      }
    </script>
  </form>

  <script>
    function togglePassword() {
      const password = document.getElementById("apassword");
      const icon = document.getElementById("togglePassword");
      if (password.type === "password") {
        password.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        password.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    }
  </script>

</body>
</html>
