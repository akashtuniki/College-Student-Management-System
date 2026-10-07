<%
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    java.util.List<String[]> attendance =
        (java.util.List<String[]>) request.getAttribute("attendance");

    int total = 0;
    int present = 0;
    int absent = 0;

    if (attendance != null) {
        total = attendance.size();

        for (String[] record : attendance) {
            if ("Present".equalsIgnoreCase(record[1])) {
                present++;
            } else if ("Absent".equalsIgnoreCase(record[1])) {
                absent++;
            }
        }
    }

    double percentage = 0;

    if (total > 0) {
        percentage = ((double) present / total) * 100;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <title>Attendance</title>

    <link rel="stylesheet" href="css/style.css">

    <style>

        .attendance-header {
            margin-bottom: 30px;
        }

        .attendance-header h1 {
            font-size: 36px;
            margin-bottom: 8px;
        }

        .attendance-header p {
            color: #777;
            font-size: 16px;
        }

        .attendance-main-card {
            background: white;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
            margin-bottom: 25px;
        }

        .attendance-summary {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 30px;
        }

        .attendance-title {
            font-size: 26px;
            font-weight: bold;
        }

        .attendance-percentage {
            font-size: 48px;
            font-weight: bold;
            color: #1f3c88;
        }

        .percentage-label {
            color: #777;
            font-size: 14px;
        }

        .summary-cards {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-bottom: 30px;
        }

        .summary-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .summary-card h3 {
            font-size: 16px;
            color: #777;
        }

        .summary-number {
            font-size: 32px;
            font-weight: bold;
            margin-top: 10px;
        }

        .present-number {
            color: #28a745;
        }

        .absent-number {
            color: #dc3545;
        }

        .total-number {
            color: #1f3c88;
        }

        .history-title {
            margin-bottom: 20px;
        }

        .attendance-record {
            background: white;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.07);
        }

        .record-date {
            font-size: 17px;
            font-weight: bold;
        }

        .record-status {
            padding: 8px 18px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
        }

        .present-status {
            background: #d4edda;
            color: #155724;
        }

        .absent-status {
            background: #f8d7da;
            color: #721c24;
        }

        .no-records {
            background: white;
            padding: 30px;
            text-align: center;
            border-radius: 10px;
            color: #777;
            box-shadow: 0 3px 10px rgba(0,0,0,0.07);
        }

        @media (max-width: 700px) {

            .summary-cards {
                grid-template-columns: 1fr;
            }

            .attendance-summary {
                flex-direction: column;
                text-align: center;
            }

            .attendance-record {
                flex-direction: column;
                gap: 15px;
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

        <div class="attendance-header">

            <h1>Attendance</h1>

            <p>
                View your attendance records and overall attendance percentage.
            </p>

        </div>


        <!-- Overall Attendance -->

        <div class="attendance-main-card">

            <div class="attendance-summary">

                <div>

                    <div class="attendance-title">
                        Your Attendance
                    </div>

                    <div class="percentage-label">
                        Overall attendance percentage
                    </div>

                </div>


                <div class="attendance-percentage">

                    <%= String.format("%.2f", percentage) %>%

                </div>

            </div>

        </div>


        <!-- Summary -->

        <div class="summary-cards">

            <div class="summary-card">

                <h3>Present</h3>

                <div class="summary-number present-number">
                    <%= present %>
                </div>

            </div>


            <div class="summary-card">

                <h3>Absent</h3>

                <div class="summary-number absent-number">
                    <%= absent %>
                </div>

            </div>


            <div class="summary-card">

                <h3>Total Classes</h3>

                <div class="summary-number total-number">
                    <%= total %>
                </div>

            </div>

        </div>


        <!-- Attendance History -->

        <h2 class="history-title">
            Attendance History
        </h2>


        <%

            if (attendance != null && !attendance.isEmpty()) {

                for (String[] record : attendance) {

                    String status = record[1];

        %>

        <div class="attendance-record">

            <div class="record-date">

                <%= record[0] %>

            </div>


            <div>

                <% if ("Present".equalsIgnoreCase(status)) { %>

                    <span class="record-status present-status">
                        Present
                    </span>

                <% } else { %>

                    <span class="record-status absent-status">
                        Absent
                    </span>

                <% } %>

            </div>

        </div>

        <%

                }

            } else {

        %>

        <div class="no-records">

            No attendance records found.

        </div>

        <%

            }

        %>


        <div style="text-align:center; margin-top:30px;">

            <a href="student-dashboard.jsp" class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>