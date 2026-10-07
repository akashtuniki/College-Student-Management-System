<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Change Password</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        .password-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .password-header h1 {
            margin-bottom: 8px;
        }

        .password-header p {
            color: #777;
        }

        .password-info {
            background: #f4f6f9;
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 20px;
            color: #555;
            font-size: 14px;
        }

    </style>

</head>

<body>

    <!-- Navigation -->

    <div class="navbar">

        <h2>Student Management System</h2>

        <div>
            <a href="student-dashboard.jsp">Dashboard</a>
            <a href="profile">Profile</a>
            <a href="logout">Logout</a>
        </div>

    </div>


    <!-- Password Form -->

    <div class="form-container">

        <div class="password-header">

            <h1>Change Password</h1>

            <p>
                Update your account password securely.
            </p>

        </div>


        <div class="password-info">

            Enter your current password and choose a new password.

        </div>


        <form action="change-password" method="post">

            <label>
                Current Password
            </label>

            <input
                type="password"
                name="currentPassword"
                required
            >


            <label>
                New Password
            </label>

            <input
                type="password"
                name="newPassword"
                required
            >


            <label>
                Confirm New Password
            </label>

            <input
                type="password"
                name="confirmPassword"
                required
            >


            <button type="submit">
                Change Password
            </button>

        </form>


        <div style="text-align:center; margin-top:20px;">

            <a href="student-dashboard.jsp" class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>