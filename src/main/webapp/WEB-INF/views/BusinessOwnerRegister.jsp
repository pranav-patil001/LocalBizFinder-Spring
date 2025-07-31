<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Business Owner Registration</title>

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
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    padding: 40px 20px;
  }

  .form-box {
    background: #ffffff;
    border: 2px solid #ddd;
    border-radius: 16px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.1);
    padding: 40px;
    width: 100%;
    max-width: 900px;
  }

  .form-box h2 {
    text-align: center;
    color: #333;
    font-size: 28px;
    margin-bottom: 30px;
  }

  .form-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 25px;
  }

  .form-group {
    display: flex;
    flex-direction: column;
  }

  .form-group label {
    margin-bottom: 8px;
    font-weight: 500;
    color: #444;
  }

  .form-group input,
  .form-group textarea {
    padding: 12px 14px;
    border: 1px solid #ccc;
    border-radius: 8px;
    background: #f9f9f9;
    font-size: 16px;
    color: #333;
  }

  .form-group input:focus,
  .form-group textarea:focus {
    outline: none;
    background: #fff;
    border-color: #999;
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
    margin-top: 25px;
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

  <form class="form-box" action="BusinessOwnerRegisterSubmit" method="post">
    <h2>Business Owner Registration</h2>

    <div class="form-grid">
      <div class="form-group">
        <label for="ownerName">Owner Name:</label>
        <input type="text" name="ownerName" placeholder="Enter full name" required />
      </div>

      <div class="form-group">
        <label for="ownerEmail">Email Address:</label>
        <input type="email" name="ownerEmail" placeholder="example@domain.com" required />
      </div>

      <div class="form-group">
        <label for="ownerContact">Contact Number:</label>
        <input type="text" name="ownerContact" placeholder="10-digit number" required />
      </div>

      <div class="form-group">
        <label for="ownerPassword">Password:</label>
        <input type="password" name="ownerPassword" placeholder="Choose a strong password" required />
      </div>

      <div class="form-group">
        <label for="ownerCity">City:</label>
        <input type="text" name="ownerCity" placeholder="Enter your city" required />
      </div>

      <div class="form-group">
        <label for="businessName">Business Name:</label>
        <input type="text" name="businessName" placeholder="Name of your business" required />
      </div>

      <div class="form-group">
        <label for="businessCategory">Business Category:</label>
        <input type="text" name="businessCategory" placeholder="e.g., Food, Services" required />
      </div>

      <div class="form-group">
        <label for="businessDescription">Business Description:</label>
        <textarea name="businessDescription" rows="4" placeholder="Describe your business in detail" required></textarea>
      </div>

      <div class="form-group">
        <label for="businessAddress">Business Address:</label>
        <textarea name="businessAddress" rows="3" placeholder="Full business address" required></textarea>
      </div>
    </div>

    <button type="submit">Register</button>

    <div class="back">
      <a href="index"><i class="fas fa-arrow-left"></i> Back to Home</a>
    </div>
  </form>

</body>
</html>
