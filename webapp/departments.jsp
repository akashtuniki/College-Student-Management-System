<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Departments</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <div class="navbar">

        <h2>Student Management System</h2>

        <div>
            <a href="student-dashboard.jsp">Dashboard</a>
            <a href="profile">Profile</a>
            <a href="logout">Logout</a>
        </div>

    </div>


    <div class="container">

        <h1>Departments</h1>

        <p>
            Available departments in the college
        </p>


        <table>

            <thead>

                <tr>
                    <th>Department ID</th>
                    <th>Department Name</th>
                </tr>

            </thead>

            <tbody>

                <%
                    if (request.getAttribute("departments") != null) {

                        java.util.List<String[]> departments =
                            (java.util.List<String[]>) request.getAttribute("departments");

                        for (String[] department : departments) {
                %>

                <tr>

                    <td>
                        <%= department[0] %>
                    </td>

                    <td>
                        <%= department[1] %>
                    </td>

                </tr>

                <%
                        }
                    }
                %>

            </tbody>

        </table>


        <div style="text-align:center; margin-top:25px;">

            <a href="student-dashboard.jsp" class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>