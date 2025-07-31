<%@ page import="com.r3sys.model.BusinessOwner" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Business Details</title>

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
      display: flex;
      height: 100vh;
      background-color: #f4f4f4;
    }

    .sidebar {
      width: 270px;
      background: #f7f7f7;
      border-right: 1px solid #ddd;
      padding: 30px 20px;
      box-shadow: 8px 0 20px rgba(0, 0, 0, 0.05);
      display: flex;
      flex-direction: column;
      position: relative;
    }

    .logo {
      margin-bottom: 30px;
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
    }

    .logo small {
      margin-top: 6px;
      font-size: 14px;
      color: #666;
      padding-left: 8px;
      border-left: 3px solid #ccc;
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
      text-decoration: none;
      color: #333;
      font-weight: 500;
      gap: 10px;
      transition: all 0.3s ease;
    }

    .nav-links a:hover {
      background: #f0f0f0;
      transform: translateX(5px);
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
      transition: 0.3s ease;
    }

    .logout:hover {
      background: #e74c3c;
      color: #fff;
    }

    .main-content {
      flex: 1;
      padding: 40px;
      background: #fff;
      overflow-y: auto;
    }

    h2 {
      color: #2c3e50;
      margin-bottom: 20px;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      margin-bottom: 40px;
    }

    table, th, td {
      border: 1px solid #ccc;
    }

    th, td {
      padding: 12px;
      text-align: left;
    }

    th {
      background-color: #f4f4f4;
    }

    /* Review Form */
    form {
      background: #fdfdfd;
      padding: 25px;
      border: 1px solid #ddd;
      border-radius: 10px;
      max-width: 600px;
    }

    label {
      font-weight: 500;
      margin-top: 10px;
      display: block;
    }

    textarea, input[type="date"] {
      width: 100%;
      padding: 10px;
      margin-top: 6px;
      margin-bottom: 15px;
      border-radius: 8px;
      border: 1px solid #ccc;
    }

    input[type="submit"] {
      background-color: #2ecc71;
      color: white;
      border: none;
      padding: 10px 20px;
      border-radius: 8px;
      cursor: pointer;
      font-weight: bold;
      transition: 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #27ae60;
    }

    .rating-stars {
      margin-top: 6px;
      font-size: 24px;
      color: #ccc;
      cursor: pointer;
    }

    .rating-stars .fa-star.checked {
      color: #f1c40f;
    }

  </style>

  <script>
    function setRating(star) {
      const stars = document.querySelectorAll('.fa-star');
      document.getElementById('ratingInput').value = star;
      stars.forEach((s, index) => {
        if (index < star) {
          s.classList.add('checked');
        } else {
          s.classList.remove('checked');
        }
      });
    }
  </script>
</head>

<body>

<!-- Sidebar -->
<div class="sidebar">
  <div class="logo">
    <div class="title">
      <img src="https://cdn-icons-png.flaticon.com/512/2622/2622865.png" alt="logo">
      <h2>LocalBizFinder</h2>
    </div>
    <small>User Dashboard</small>
  </div>

  <div class="nav-links">
    <a href="UserDashboard.jsp"><i class="fas fa-home"></i> Dashboard Home</a>
    <a href="UserSearchBusinessByName"><i class="fas fa-search"></i> Search Business</a>
  </div>

  <a href="index.html" class="logout" title="Logout">
    <i class="fas fa-sign-out-alt"></i>
  </a>
</div>

<!-- Main Content -->
<div class="main-content">
<%
    BusinessOwner b = (BusinessOwner) request.getAttribute("businessOwner");
    if (b != null) {
%>
  <h2>Business Details</h2>
  <table>
    <tr><th>Business Name</th><td><%= b.getBusinessName() %></td></tr>
    <tr><th>Business Category</th><td><%= b.getBusinessCategory() %></td></tr>
    <tr><th>Business Address</th><td><%= b.getBusinessAddress() %></td></tr>
    <tr><th>Business Description</th><td><%= b.getBusinessDescription() %></td></tr>
    <tr><th>Owner Name</th><td><%= b.getOwnerName() %></td></tr>
    <tr><th>Owner Contact</th><td><%= b.getOwnerContact() %></td></tr>
    <tr><th>Owner Email</th><td><%= b.getOwnerEmail() %></td></tr>
    <tr><th>Owner City</th><td><%= b.getOwnerCity() %></td></tr>
  </table>

  <h2>Submit a Review</h2>
  <form action="ReviewSubmit" method="post">
    <% String userContact = (String) request.getAttribute("userContact"); %>
    <input type="hidden" name="ownerContact" value="<%= b.getOwnerContact() %>">
    <input type="hidden" name="userContact" value="<%= userContact %>">
    <input type="hidden" id="ratingInput" name="rating" value="">

    <label>Rating:</label>
    <div class="rating-stars">
      <i class="fa fa-star" onclick="setRating(1)"></i>
      <i class="fa fa-star" onclick="setRating(2)"></i>
      <i class="fa fa-star" onclick="setRating(3)"></i>
      <i class="fa fa-star" onclick="setRating(4)"></i>
      <i class="fa fa-star" onclick="setRating(5)"></i>
    </div>

    <label for="comment">Comment:</label>
    <textarea id="comment" name="comment" rows="4" required></textarea>

    <label for="date">Date:</label>
    <input type="date" id="date" name="date" required>

    <input type="submit" value="Submit Review">
  </form>
<%
    } else {
%>
  <p style="color: red; font-weight: bold;">Something went wrong. Business not found.</p>
<%
    }
%>
</div>

</body>
</html>
