<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Student Profile</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <!-- Navigation Bar -->

    <div class="navbar">

        <h2>Student Management System</h2>

        <div>
            <a href="student-dashboard.jsp">Dashboard</a>
            <a href="logout">Logout</a>
        </div>

    </div>


    <div class="container">

        <h1 style="text-align:center;">
            Student Profile
        </h1>


        <div class="profile-card">

            <div class="profile-row">
                <strong>Student ID</strong>
                <span>${studentId}</span>
            </div>

            <div class="profile-row">
                <strong>Name</strong>
                <span>${name}</span>
            </div>

            <div class="profile-row">
                <strong>Email</strong>
                <span>${email}</span>
            </div>

            <div class="profile-row">
                <strong>Phone</strong>
                <span>${phone}</span>
            </div>

            <div class="profile-row">
                <strong>Gender</strong>
                <span>${gender}</span>
            </div>

            <div class="profile-row">
                <strong>Date of Birth</strong>
                <span>${dob}</span>
            </div>

            <div class="profile-row">
                <strong>Address</strong>
                <span>${address}</span>
            </div>

            <div class="profile-row">
                <strong>Department</strong>
                <span>${departmentId}</span>
            </div>


            <div style="text-align:center; margin-top:25px;">

                <a href="update-profile.jsp" class="btn">
                    Update Profile
                </a>

                <a href="student-dashboard.jsp" class="btn">
                    Back to Dashboard
                </a>

            </div>

        </div>

    </div>

</body>

</html>