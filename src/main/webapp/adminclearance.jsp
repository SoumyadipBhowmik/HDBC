<!DOCTYPE html>
<%@page import="backend_DTO.CustomerData"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HDBC | Waiting</title>
    <link rel="apple-touch-icon" sizes="180x180" href="Assets/Icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="Assets/Icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="Assets/Icons/favicon-16x16.png">
    <link rel="manifest" href="/Assets/Icons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="Assets/Css/adminclearance2.css" />
    <%CustomerData currentUser = (CustomerData) session.getAttribute("customer"); %>
  </head>
  <body>
    <div id="main">
      <nav>
          <div id="logo-section">
              <div id="logo"><h1 id="logo-text">HDBC</h1></div>
              <div id="logo-section-menu">
                  <a href="#" id="dashboard-link">Dashboard</a>
                  <a href="userHome2.jsp" id="change-account-link">Change Account</a>
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
        <div id="animation">
          <span>P</span><span>l</span><span>e</span><span>a</span><span>s</span><span>e</span>
          <span> </span>
          <span>w</span><span>a</span><span>i</span><span>t</span>
          <span></span>
          <span>f</span><span>o</span><span>r</span>
          <span> </span>
          <span>c</span><span>o</span><span>n</span><span>f</span><span>i</span><span>r</span><span>m</span><span>a</span><span>t</span><span>i</span><span>o</span><span>n</span><span>.</span><span>.</span><span>.</span>
        </div>
      </div>
  </div>
    <script src="Assets/Js/adminclearance.js"></script>
  </body>
</html>
