<!DOCTYPE html>
<%@page import="backend_DTO.BankAccount"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User | Dashboard</title>
    <link rel="stylesheet" href="Assets/Css/userdashboard.css">
    <link rel="apple-touch-icon" sizes="180x180" href="Assets/Icons/UserDashBoard/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="Assets/Icons/UserDashBoard/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="Assets/Icons/UserDasBoard/favicon-16x16.png">
    <link rel="manifest" href="Assets/Icons/UserDashBoard/site.webmanifest">
    <%BankAccount currentUser = (BankAccount) session.getAttribute("currentUser"); %>
</head>
<body>
    <div id="main">
        <nav>
            <div id="logo-section">
                <div id="logo"><h1 id="logo-text">HDBC</h1></div>
                <div id="logo-section-menu">
                    <a href="#" id="dashboard-link">Dashboard</a>
                    <a href="#" id="transaction-link">Deposit</a>
                    <a href="#" id="send-money-link">Send Money</a>
                    <a href="logouturl?param=logout" id="logout-link">Logout</a>
                </div>
            </div>
            <div id="menu">
                <input type="search" id="search-bar" placeholder="Payment, Requests, Transactions...  ">
                <div id="name"><%=currentUser.getCustomer().getCustomerName() %> </div>
                <div id="profile"></div>
            </div>
        </nav>
        <div id="actual-body">
            <div id="dashboard">
                <div id="welcome-message"><h1>Welcome Back, <span><%=currentUser.getCustomer().getCustomerName() %>!</span></h1></div>
                <div id="widget-section">
                    <div class="widget-holders">
                        <div id="accounts">
                            <div class="card-title"><h2>ACCOUNT</h2></div>
                            <div class="card-content">
                                <div id="accounts-left-part">
                                    <div class="info">Account Holder:</div>
                                    <div id="dataname"><%=currentUser.getCustomer().getCustomerName() %></div>
                                    <div class="info">Your Balance:</div>
                                    <div id="databalance">$<%=currentUser.getBalance() %></div>
                                    <div class="info">Account Number: </div>
                                    <div id="datanumber">5300 4500 1312</div>
                                </div>
                                <div id="accounts-right-part">
                                    <div class="info">Credit cards: </div>
                                    <div id="card">
                                        <div id="card-bank-name">HDBC</div>
                                        <div id="card-holder-name"><%=currentUser.getCustomer().getCustomerName() %></div>
                                        <div id="card-expiry-date">09/24</div>
                                        <div id="card-holder-account-number">5300 4500 1312</div>
                                        <div id="mastercard-logo"><img src="Assets/Images/Mastercard-Logo-2016-2020.png" height="100px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="widget-holders">
                        <div id="left">
                            <div id="left-top-widget">
                                <div class="card-title"><h2>BALANCE STATEMENT</h2></div>
                            </div>
                            <div id="left-bottom-widget">
                                <div class="card-title"><h2>EXCHANGE RATES</h2></div>
                            </div>
                        </div>
                        <div id="right">
                            <div class="card-title"><h2>RECENT TRANSACTIONS</h2></div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="transaction">
                <form action="depositMoney" method="post" id="depositMoney">
                    <div class="card-title"><h2>DEPOSIT MONEY</h2></div>
                    <div class="take-input">
                        <input type="text" name="deposit" placeholder="Enter your Amount" id="deposit"><br>
                        <button>Deposit</button>
                    </div>
                </form>
            </div>

            <div id="send-money">
                <form action="sendMoney" method="post" id="depositMoney">
                    <div class="card-title"><h2>SEND MONEY</h2></div>
                    <div class="take-input">
                        <input type="text" name="withdraw" placeholder="Enter your Amount"><br>
                        <button>Send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="Assets/Js/userdashboard.js"></script>
</body>
</html>