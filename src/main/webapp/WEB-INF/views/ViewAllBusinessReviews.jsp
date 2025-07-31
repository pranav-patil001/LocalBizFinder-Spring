<%@page import="com.r3sys.model.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.r3sys.model.BusinessOwner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Business Reviews - Owner Dashboard</title>

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

    .main-content h2 {
      font-size: 26px;
      color: #222;
      margin-bottom: 25px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-bottom: 30px;
      background: #fff;
      box-shadow: 0 2px 10px rgba(0,0,0,0.05);
      border-radius: 8px;
      overflow: hidden;
    }

    th, td {
      padding: 16px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #f4f4f4;
      font-weight: 600;
    }

    tr:hover {
      background-color: #fafafa;
    }

    p {
      font-size: 16px;
      color: #555;
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
    <%
      BusinessOwner owner = (BusinessOwner) request.getAttribute("businessOwner");
      List<Review> reviewList = (List<Review>) request.getAttribute("review");
      List<String> userNames = (List<String>) request.getAttribute("userName");
    %>

    <h2>Business Details</h2>
    <table>
      <tr>
        <th>Business Name</th>
        <td><%= owner.getBusinessName() %></td>
      </tr>
      <tr>
        <th>Owner Name</th>
        <td><%= owner.getOwnerName() %></td>
      </tr>
      <tr>
        <th>Category</th>
        <td><%= owner.getBusinessCategory() %></td>
      </tr>
    </table>

    <h2>Customer Reviews</h2>
    <%
      if (reviewList != null && !reviewList.isEmpty()) {
    %>
    <table>
      <tr>
        <th>Reviewer Name</th>
        <th>User Contact</th>
        <th>Review</th>
        <th>Rating</th>
        <th>Date</th>
      </tr>
      <%
        for (int i = 0; i < reviewList.size(); i++) {
          Review r = reviewList.get(i);
          String reviewerName = userNames.get(i);
      %>
      <tr>
        <td><%= reviewerName %></td>
        <td><%= r.getUserContact() %></td>
        <td><%= r.getComment() %></td>
        <td><%= r.getRating() %></td>
        <td><%= r.getDate() %></td>
      </tr>
      <%
        }
      %>
    </table>
    <%
      } else {
    %>
    <p>No reviews available for this business.</p>
    <%
      }
    %>
  </div>

</body>
</html>
