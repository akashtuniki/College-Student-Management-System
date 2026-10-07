<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Update Profile</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <!-- Navigation Bar -->

    <div class="navbar">

        <h2>Student Management System</h2>

        <div>
            <a href="student-dashboard.jsp">Dashboard</a>
            <a href="profile">Profile</a>
            <a href="logout">Logout</a>
        </div>

    </div>


    <!-- Update Form -->

    <div class="form-container">

        <h1>Update Profile</h1>

        <form action="update-profile" method="post">

            <label>Name</label>

            <input
                type="text"
                name="name"
                value="${name}"
                required
            >


            <label>Phone</label>

            <input
                type="text"
                name="phone"
                value="${phone}"
                required
            >


            <label>Gender</label>

            <select name="gender" required>

                <option value="">Select Gender</option>

                <option value="Male"
                    ${gender == 'Male' ? 'selected' : ''}>
                    Male
                </option>

                <option value="Female"
                    ${gender == 'Female' ? 'selected' : ''}>
                    Female
                </option>

                <option value="Other"
                    ${gender == 'Other' ? 'selected' : ''}>
                    Other
                </option>

            </select>


            <label>Date of Birth</label>

            <input
                type="date"
                name="dob"
                value="${dob}"
                required
            >


            <label>Address</label>

            <textarea
                name="address"
                rows="4"
                required
            >${address}</textarea>


            <button type="submit">
                Update Profile
            </button>

        </form>


        <div style="text-align:center; margin-top:20px;">

            <a href="profile" class="btn">
                Back to Profile
            </a>

        </div>

    </div>

</body>

</html>