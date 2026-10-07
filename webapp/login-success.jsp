<!DOCTYPE html>
<html>

<head>
    <title>Login Successful</title>
    <link rel="stylesheet" href="css/style.css">

    <style>
        .success-container {
            width: 450px;
            max-width: 95%;
            margin: 100px auto;
            background: white;
            padding: 40px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.12);
        }

        .success-icon {
            font-size: 55px;
            color: green;
            margin-bottom: 15px;
        }

        .success-container h1 {
            color: green;
            margin-bottom: 15px;
        }

        .success-container p {
            font-size: 16px;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="navbar">
        <h2>Student Management System</h2>

        <div>
            <a href="Login.jsp">Login</a>
        </div>
    </div>

    <div class="success-container">

        <div class="success-icon">✓</div>

        <h1>Login Successful!</h1>

        <p>
            You have logged in successfully.
        </p>

        <p>
            Welcome to your Student Portal.
        </p>

        <a href="student-dashboard.jsp" class="btn">
            Go to Dashboard
        </a>

    </div>

</body>
</html>