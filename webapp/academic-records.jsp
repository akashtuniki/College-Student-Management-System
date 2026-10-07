<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    String[] student =
        (String[]) request.getAttribute("student");
%>

<!DOCTYPE html>
<html>

<head>

    <title>Academic Records</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        .records-header {
            margin-bottom: 30px;
        }

        .records-header h1 {
            font-size: 36px;
            margin-bottom: 8px;
        }

        .records-header p {
            color: #777;
            font-size: 16px;
        }

        .student-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 30px;
        }

        .student-card h2 {
            color: #1f3c88;
            margin-bottom: 20px;
        }

        .record-row {
            display: flex;
            justify-content: space-between;
            padding: 15px;
            border-bottom: 1px solid #eee;
        }

        .record-label {
            font-weight: bold;
            color: #555;
        }

        .record-value {
            color: #333;
        }

        .academic-options {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .academic-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .academic-card h3 {
            color: #1f3c88;
            margin-bottom: 10px;
        }

        .academic-card p {
            color: #777;
        }

        @media (max-width: 700px) {

            .academic-options {
                grid-template-columns: 1fr;
            }

            .record-row {
                flex-direction: column;
                gap: 5px;
            }

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


    <div class="container">

        <div class="records-header">

            <h1>Academic Records</h1>

            <p>
                View your student information and academic records.
            </p>

        </div>


        <!-- Student Information -->

        <div class="student-card">

            <h2>Student Information</h2>

            <%
                if (student != null) {
            %>

            <div class="record-row">

                <span class="record-label">
                    Student ID
                </span>

                <span class="record-value">
                    <%= student[0] %>
                </span>

            </div>


            <div class="record-row">

                <span class="record-label">
                    Name
                </span>

                <span class="record-value">
                    <%= student[1] %>
                </span>

            </div>


            <div class="record-row">

                <span class="record-label">
                    Email
                </span>

                <span class="record-value">
                    <%= student[2] %>
                </span>

            </div>


            <div class="record-row">

                <span class="record-label">
                    Department
                </span>

                <span class="record-value">
                    <%= student[3] %>
                </span>

            </div>

            <%
                } else {
            %>

            <p>
                Student information not found.
            </p>

            <%
                }
            %>

        </div>


        <!-- Academic Options -->

        <h2>Academic Information</h2>

        <div class="academic-options">

            <div class="academic-card">

                <h3>Attendance</h3>

                <p>
                    View your attendance records.
                </p>

                <a href="attendance" class="btn">
                    View Attendance
                </a>

            </div>


            <div class="academic-card">

                <h3>Marks</h3>

                <p>
                    View your subject-wise marks.
                </p>

                <a href="marks" class="btn">
                    View Marks
                </a>

            </div>

        </div>


        <div style="text-align:center; margin-top:30px;">

            <a href="student-dashboard.jsp" class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>