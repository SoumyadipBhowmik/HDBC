<!DOCTYPE html>
<%@page import="backend_DTO.CustomerData"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User | Dashboard</title>
    <link rel="stylesheet" href="Assets/Css/userhome2.css">
    <link rel="apple-touch-icon" sizes="180x180" href="/Assets/Icons/UserDashBoard/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/Assets/Icons/UserDashBoard/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/Assets/Icons/UserDashBoard/favicon-16x16.png">
    <link rel="manifest" href="/Assets/Icons/UserDashBoard/site.webmanifest">
</head>
<body>
<% CustomerData currentUser = (CustomerData) session.getAttribute("customer"); %>
    <div id="main">
        <nav>
            <div id="logo-section">
                <div id="logo"><h1 id="logo-text">HDBC</h1></div>
                <div id="logo-section-menu">
                    <a href="#" id="dashboard-link">Dashboard</a>
                    <a href="logouturl?param=logout" id="logout">Logout</a>
                </div>
            </div>
            <div id="menu">
                <input type="search" id="search-bar" placeholder="Payment, Requests, Transactions...  ">
                <div id="name"><%=currentUser.getCustomerName() %> </div>
                <div id="profile"></div>
            </div>
        </nav>
        <div id="actual-body">
            <div id="widget-section">
                <div class="card-title"><h2>CHOOSE ACCOUNT</h2></div>
                <div class="card-content">
                    <a href="accountType?param=current" class="widget-holders">
                        <i class="fa-solid fa-building-columns"></i>
                        <h1>Current Account</h1>
                    </a>
                    <a href="accountType?param=savings" class="widget-holders">
                        <i class="fa-solid fa-shield"></i>
                        <h1>Savings Account</h1>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script src="Assets/Js/userhome2.js"></script>
</body>
</html>