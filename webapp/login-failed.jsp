<!DOCTYPE html>
<html>

<head>
    <title>Login Failed</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .error-container {
            width: 450px;
            max-width: 95%;
            margin: 100px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .error-icon {
            font-size: 55px;
            color: red;
            margin-bottom: 15px;
        }

        .error-container h1 {
            color: red;
            margin-bottom: 15px;
        }

        .error-container p {
            font-size: 16px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="navbar">
        <h2>Student Management System</h2>

        <div>
            <a href="Registration.jsp">Register</a>
            <a href="Login.jsp">Login</a>
        </div>
    </div>

    <div class="error-container">

        <div class="error-icon">✕</div>

        <h1>Login Failed</h1>

        <p>
            Invalid Student ID or password.
        </p>

        <p>
            Please check your credentials and try again.
        </p>

        <a href="Login.jsp" class="btn">
            Try Again
        </a>

        <br>

        <a href="Registration.jsp" class="btn">
            Create Account
        </a>

    </div>

</body>
</html>