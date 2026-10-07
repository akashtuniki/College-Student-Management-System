<!DOCTYPE html>
<html>

<head>
    <title>Registration Failed</title>
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

        <h1>Registration Failed</h1>

        <p>
            Sorry, your registration could not be completed.
        </p>

        <p>
            Please check your details and try again.
        </p>

        <a href="Registration.jsp" class="btn">
            Try Again
        </a>

    </div>

</body>
</html>