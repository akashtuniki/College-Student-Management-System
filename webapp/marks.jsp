<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    java.util.List<String[]> marks =
        (java.util.List<String[]>)
        request.getAttribute("marks");

    int totalSubjects = 0;
    double totalMarks = 0;
    double highestMark = 0;

    if (marks != null) {

        totalSubjects = marks.size();

        for (String[] record : marks) {

            double mark = Double.parseDouble(record[1]);

            totalMarks += mark;

            if (mark > highestMark) {
                highestMark = mark;
            }
        }
    }

    double averageMarks = 0;

    if (totalSubjects > 0) {
        averageMarks = totalMarks / totalSubjects;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Academic Marks</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        .marks-header {
            margin-bottom: 30px;
        }

        .marks-header h1 {
            font-size: 36px;
            margin-bottom: 8px;
        }

        .marks-header p {
            color: #777;
            font-size: 16px;
        }

        .marks-summary {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 35px;
        }

        .mark-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .mark-card h3 {
            color: #777;
            font-size: 16px;
        }

        .mark-number {
            font-size: 32px;
            font-weight: bold;
            color: #1f3c88;
            margin-top: 10px;
        }

        .marks-section {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .marks-section h2 {
            margin-bottom: 20px;
        }

        .marks-table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: none;
            margin-top: 0;
        }

        .marks-table th {
            background: #1f3c88;
            color: white;
            padding: 14px;
        }

        .marks-table td {
            padding: 14px;
            border-bottom: 1px solid #eee;
        }

        .marks-value {
            font-weight: bold;
            color: #1f3c88;
        }

        .no-marks {
            text-align: center;
            padding: 30px;
            color: #777;
        }

        @media (max-width: 700px) {

            .marks-summary {
                grid-template-columns: 1fr;
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


    <!-- Main Content -->

    <div class="container">

        <div class="marks-header">

            <h1>Academic Marks</h1>

            <p>
                View your subject-wise academic performance.
            </p>

        </div>


        <!-- Summary Cards -->

        <div class="marks-summary">

            <div class="mark-card">

                <h3>Total Subjects</h3>

                <div class="mark-number">
                    <%= totalSubjects %>
                </div>

            </div>


            <div class="mark-card">

                <h3>Average Marks</h3>

                <div class="mark-number">
                    <%= String.format("%.2f", averageMarks) %>
                </div>

            </div>


            <div class="mark-card">

                <h3>Highest Mark</h3>

                <div class="mark-number">
                    <%= String.format("%.2f", highestMark) %>
                </div>

            </div>

        </div>


        <!-- Marks Table -->

        <div class="marks-section">

            <h2>Subject-wise Marks</h2>

            <%

                if (marks != null && !marks.isEmpty()) {

            %>

            <table class="marks-table">

                <thead>

                    <tr>

                        <th>Subject</th>

                        <th>Marks</th>

                    </tr>

                </thead>

                <tbody>

                    <%

                        for (String[] record : marks) {

                    %>

                    <tr>

                        <td>
                            <%= record[0] %>
                        </td>

                        <td class="marks-value">
                            <%= record[1] %>
                        </td>

                    </tr>

                    <%

                        }

                    %>

                </tbody>

            </table>

            <%

                } else {

            %>

            <div class="no-marks">

                No marks records found.

            </div>

            <%

                }

            %>

        </div>


        <div style="text-align:center; margin-top:30px;">

            <a href="student-dashboard.jsp" class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>