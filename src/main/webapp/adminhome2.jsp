<!DOCTYPE html>
<%@page import="middleware_DAO.BankDao"%>
<%@page import="backend_DTO.BankAccount"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Assets/Css/adminhome.css">
    <link rel="apple-touch-icon" sizes="180x180" href="Assets/Icons/Admin/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="Assets/Icons/Admin/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="Assets/Icons/Admin/favicon-16x16.png">
    <link rel="manifest" href="/Assets/Icons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Home | Admin</title>
    <%BankDao bankDao = new BankDao(); %>
    <%List<BankAccount> accounts =  bankDao.fetchBank();%>
</head>
<body>
    <nav>
        <div id="logo">HDBC</div>
        <div id="menu">
            <i class="fa-solid fa-magnifying-glass"></i>
            <i class="fa-solid fa-bars" id="bars"></i>
        </div>
    </nav>
    <header>
        <aside>
            <div class="taskviews">
                <h1>Welcome: Admin</h1>
                <h1>Users: <%@include file="Assets/Messages/count.jsp" %></h1>
                <h1>Male users: <%@include file="Assets/Messages/messages.jsp" %></h1>
                <h1>Female users: <%@include file="Assets/Messages/userName.jsp" %></h1>
            </div>
            <div class="taskviews">
                <h1>Transactions: </h1>
            	<h1>Filter: </h1>
            </div>
            <div class="taskviews">
                <h1>Savings accounts: </h1>
                <h1>Current accounts: </h1>
                <h1>Active users: </h1>
                <h1>Pending users: </h1>
            </div>
        </aside>
        <article>
        	<table border="1">
        		<tr>
      				<th>Customer Name</th>
        			<th>Account Type</th>
        			<th>Account Balance</th>
        			<th>Status</th>
        			<th>Change status</th>
        		</tr>
        		<%for(BankAccount account: accounts) {%>
        		<tr>
        			
        			<td><%=account.getCustomer().getCustomerName() %></td>
        			<td><%=account.getAccountType() %></td>
        			<td><%=account.getBalance() %></td>
        			<td><%=account.isStatus() %></td>
        			<td><a href="statusChange?param=<%=account.getAccountNumber()%>"><button>Change</button></a></td>
        		</tr>
        		<% }%>
        	</table>
        </article>
    </header>

    <div id="sidebar-holder">
        <div id="side-bar">
            <div id="close"><i class="fa-solid fa-xmark"></i></div>
            <div id="sidebar-options">
                <a href="#">Profile</a>
                <a href="#">Instructions</a>
                <a href="#">Loans</a>
                <a href="#">Insights</a>
                <a href="#">Logistics</a>
                <a href="#">Features</a>
                <a href="#">Lifecycles</a>
                <a href="#">Settings</a>
                <a href="#">Contacts</a>
                <a href="logouturl?param=logout">Logout</a>
            </div>
        </div>
    </div>


    <script src="Assets/Js/adminhome.js"></script>
</body>
</html>