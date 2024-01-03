<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HDBC | Login</title>
    <link rel="stylesheet" href="Assets/Css/homepage.css">
    <link rel="apple-touch-icon" sizes="180x180" href="Assets/Icons/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="Assets/Icons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="Assets/Icons/favicon-16x16.png">
    <link rel="manifest" href="/Assets/Icons/site.webmanifest">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <div id="main">
        <div id="left-page">
            <h1><span>H</span><span>D</span><span>B</span><span>C</span></h1>
            <p id="logo-description">your favorite bank management app</p>
        </div>
        <div id="right-page">
            <div id="login-type">User</div>
            <div id="mode">
                <div id="slider"><i class="fa-solid fa-bars"></i></div>
            </div>

            <div id="customer-login-page">
                <form action="CustomerLogin" id="customer-login" method="post">
                    <h3>Login to your account</h3>
                    <input type="email" name="customerEmail" placeholder="Enter Email">
                    <div id="message-area-1">
                    	<%@include file="Assets/Messages/messageUsername.jsp" %>
                    </div>
                    <input type="password" name="customerPassword" placeholder="Enter Password">
                    <div id="message-area-2">
                    	<%@include file="Assets/Messages/messages.jsp" %>
                    </div>
                    <button id="login-button">Login</button>
                </form>
                <h4>Don't have an account yet? </h4>
                <button id="create-account-link">Create an account</button>
            </div>

            <div id="admin-login-page">
                <h3>Enter Credentials</h3>
                <form action="AdminLogin" id="admin-login">
                    <input type="text" name="adminID" placeholder="Enter Admin ID">
                    <div id="error-message-admin1">
                    	<%@include file="Assets/Messages/adminID.jsp" %>
                    </div>
                    <input type="password" name="adminPassword" placeholder="Enter Admin Password">
                    <div id="error-message-admin2">
                    	<%@include file="Assets/Messages/adminPassword.jsp" %>
                    </div>
                    <button>Login</button>
                </form>
            </div>


        </div>
        <div id="sign-up-page">
            <div id="sign-up-form-container">
                <button id="close">X</button>
                <form action="createAccount" id="createAccount">
                    <h1>Create an account</h1>
                    <div id="form-inputs">
                        <label for="createName">Name: </label>
                        <input type="text" name="createName" required>
                        <br>
                        <label for="createPhoneNumber">Phone number: </label>
                        <input type="text" name="createPhoneNumber" required>
                        <br>
                        <label for="createEmail">Email: </label>
                        <input type="text" name="createEmail" required>
                        <br>
                        <label for="createPassword">Password</label>
                        <input type="password" name="createPassword" id="createPassword" required>
                        <br>
                        <label for="confirmPassword">Confirm Password: </label>
                        <input type="password" name="confirmPassword" id="confirmPassword" required>
                        <br>
                        <div>
                            <label for="createGender">Gender: </label>
                            <input type="radio" name="createGender" value="male"> Male
                            <input type="radio" name="createGender" value="female"> Female
                        </div>
                        <br>
                        <label for="dob">Date of birth: </label>
                        <input type="date" name="createDob" required id="createDob">
                    </div>
                    <div id="submit-button">
                        <input type="submit" id="create-submit">
                    </div>
                </form>
            </div>
        </div>
    </div>


    <script src="Assets/Js/homepage.js"></script>
</body>
</html>