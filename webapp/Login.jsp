<!DOCTYPE html>
<html>

<head>

    <title>Student Login</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <div class="form-container">

        <h1>Student Login</h1>

        <form action="login" method="post">

            <label for="studentId">
                Student ID
            </label>

            <input
                type="number"
                id="studentId"
                name="studentId"
                required
            >


            <label for="password">
                Password
            </label>

            <input
                type="password"
                id="password"
                name="password"
                required
            >


            <button type="submit">
                Login
            </button>

        </form>

        <p style="text-align:center; margin-top:20px;">
            Don't have an account?
            <a href="Registration.jsp">
                Register here
            </a>
        </p>

    </div>

</body>

</html>