<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // Check session
    if (session.getAttribute("studentId") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }

    Integer studentId =
            (Integer) session.getAttribute("studentId");

    // Get dynamic dashboard values
    Double attendance =
            (Double) request.getAttribute("attendance");

    Double averageMarks =
            (Double) request.getAttribute("averageMarks");

    Integer subjectCount =
            (Integer) request.getAttribute("subjectCount");

    // Default values
    if (attendance == null) {
        attendance = 0.0;
    }

    if (averageMarks == null) {
        averageMarks = 0.0;
    }

    if (subjectCount == null) {
        subjectCount = 0;
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Dashboard</title>

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f7fb;
            color: #333;
        }

        /* ================= HEADER ================= */

        .header {
            height: 70px;
            background: linear-gradient(
                135deg,
                #1f3c88,
                #5b2c83
            );

            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 30px;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.15);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo svg {
            width: 38px;
            height: 38px;
        }

        .logo h2 {
            font-size: 21px;
        }

        .student-info {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 15px;
        }

        .student-icon {
            width: 38px;
            height: 38px;

            background: rgba(255,255,255,0.2);

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* ================= LAYOUT ================= */

        .layout {
            display: flex;
            min-height: calc(100vh - 70px);
        }

        /* ================= SIDEBAR ================= */

        .sidebar {
            width: 240px;

            background: #172b5c;

            padding: 25px 15px;

            color: white;
        }

        .sidebar-title {
            font-size: 13px;
            color: #b9c7e6;
            margin: 10px 15px 15px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .menu {
            list-style: none;
        }

        .menu li {
            margin-bottom: 8px;
        }

        .menu a {
            display: flex;
            align-items: center;
            gap: 13px;

            color: white;

            text-decoration: none;

            padding: 13px 15px;

            border-radius: 8px;

            transition: 0.3s;
        }

        .menu a:hover {
            background: #29488e;
        }

        .menu svg {
            width: 21px;
            height: 21px;
            flex-shrink: 0;
        }

        .logout {
            margin-top: 25px;
            border-top: 1px solid rgba(255,255,255,0.15);
            padding-top: 20px;
        }

        .logout a {
            background: #d9534f;
        }

        .logout a:hover {
            background: #c9302c;
        }

        /* ================= MAIN ================= */

        .main {
            flex: 1;
            padding: 30px;
            overflow-x: hidden;
        }

        /* ================= WELCOME ================= */

        .welcome {
            background: linear-gradient(
                135deg,
                #ffffff,
                #eef3ff
            );

            border-radius: 15px;

            padding: 28px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.07);

            margin-bottom: 25px;
        }

        .welcome-text h1 {
            color: #1f3c88;
            font-size: 29px;
            margin-bottom: 10px;
        }

        .welcome-text p {
            color: #666;
            font-size: 15px;
        }

        .welcome-illustration {
            width: 130px;
            height: 100px;
        }

        /* ================= STATS ================= */

        .section-title {
            color: #333;
            margin-bottom: 15px;
            font-size: 20px;
        }

        .stats {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;

            margin-bottom: 30px;
        }

        .stat-card {
            background: white;

            border-radius: 12px;

            padding: 20px;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.07);

            display: flex;

            align-items: center;

            gap: 15px;

            transition: 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-4px);

            box-shadow:
                0 7px 20px rgba(0,0,0,0.12);
        }

        .stat-icon {
            width: 55px;
            height: 55px;

            border-radius: 12px;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stat-icon svg {
            width: 28px;
            height: 28px;
        }

        .attendance-icon {
            background: #e1f5e9;
            color: #20a05a;
        }

        .marks-icon {
            background: #fff0dc;
            color: #f39c12;
        }

        .academic-icon {
            background: #e4e9ff;
            color: #405de6;
        }

        .id-icon {
            background: #f4e3ff;
            color: #8e44ad;
        }

        .stat-content h4 {
            font-size: 13px;
            color: #777;
            margin-bottom: 5px;
        }

        .stat-value {
            font-size: 23px;
            font-weight: bold;
            color: #1f3c88;
        }

        /* ================= SERVICES ================= */

        .services {
            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;
        }

        .service-card {
            background: white;

            border-radius: 12px;

            padding: 25px 20px;

            text-align: center;

            box-shadow:
                0 3px 12px rgba(0,0,0,0.07);

            transition: 0.3s;
        }

        .service-card:hover {
            transform: translateY(-5px);

            box-shadow:
                0 8px 20px rgba(0,0,0,0.12);
        }

        .service-icon {
            width: 60px;
            height: 60px;

            margin: auto auto 15px;

            border-radius: 15px;

            display: flex;

            align-items: center;

            justify-content: center;
        }

        .service-icon svg {
            width: 30px;
            height: 30px;
        }

        .blue {
            background: #e4ecff;
            color: #3d65e5;
        }

        .green {
            background: #e2f8ec;
            color: #20a05a;
        }

        .orange {
            background: #fff0dc;
            color: #ef9416;
        }

        .purple {
            background: #f2e5ff;
            color: #8d48c5;
        }

        .red {
            background: #ffe5e5;
            color: #e44d4d;
        }

        .cyan {
            background: #def7fa;
            color: #1596a3;
        }

        .service-card h3 {
            margin-bottom: 8px;
            color: #333;
            font-size: 17px;
        }

        .service-card p {
            color: #777;
            font-size: 13px;
            line-height: 1.5;
        }

        .service-card a {
            display: inline-block;

            margin-top: 15px;

            padding: 9px 15px;

            border-radius: 6px;

            background: #1f3c88;

            color: white;

            text-decoration: none;

            font-size: 13px;
        }

        .service-card a:hover {
            background: #162d68;
        }

        /* ================= FOOTER ================= */

        .footer {
            text-align: center;

            margin-top: 35px;

            padding: 20px;

            color: #777;

            font-size: 13px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .stats {
                grid-template-columns:
                    repeat(2, 1fr);
            }

            .services {
                grid-template-columns:
                    repeat(2, 1fr);
            }
        }

        @media (max-width: 800px) {

            .sidebar {
                width: 200px;
            }

            .main {
                padding: 20px;
            }
        }

        @media (max-width: 650px) {

            .layout {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
            }

            .menu {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: 5px;
            }

            .stats {
                grid-template-columns: 1fr;
            }

            .services {
                grid-template-columns: 1fr;
            }

            .welcome {
                flex-direction: column;
                text-align: center;
                gap: 20px;
            }

            .header {
                padding: 0 15px;
            }

            .student-info {
                font-size: 12px;
            }
        }

    </style>

</head>

<body>


<!-- ================= HEADER ================= -->

<div class="header">

    <div class="logo">

        <svg viewBox="0 0 24 24"
             fill="none"
             stroke="currentColor"
             stroke-width="2">

            <path d="M2 10l10-5 10 5-10 5-10-5z"/>

            <path d="M6 12v5c3 3 9 3 12 0v-5"/>

            <path d="M22 10v6"/>

        </svg>

        <h2>
            College Student Portal
        </h2>

    </div>


    <div class="student-info">

        <div class="student-icon">

            <svg viewBox="0 0 24 24"
                 fill="none"
                 stroke="currentColor"
                 stroke-width="2">

                <circle cx="12" cy="8" r="4"/>

                <path d="M4 21c0-4 3-7 8-7s8 3 8 7"/>

            </svg>

        </div>

        Student ID: <%= studentId %>

    </div>

</div>


<!-- ================= LAYOUT ================= -->

<div class="layout">


    <!-- ================= SIDEBAR ================= -->

    <aside class="sidebar">

        <div class="sidebar-title">
            Main Menu
        </div>


        <ul class="menu">

            <!-- Dashboard -->

            <li>

                <a href="dashboard">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <rect x="3" y="3"
                              width="7"
                              height="7"/>

                        <rect x="14" y="3"
                              width="7"
                              height="7"/>

                        <rect x="3" y="14"
                              width="7"
                              height="7"/>

                        <rect x="14" y="14"
                              width="7"
                              height="7"/>

                    </svg>

                    Dashboard

                </a>

            </li>


            <!-- Profile -->

            <li>

                <a href="profile">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <circle cx="12" cy="8" r="4"/>

                        <path d="M4 21c0-4 3-7 8-7s8 3 8 7"/>

                    </svg>

                    My Profile

                </a>

            </li>


            <!-- Departments -->

            <li>

                <a href="departments">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M3 21h18"/>

                        <path d="M5 21V7l7-4 7 4v14"/>

                        <path d="M9 21v-5h6v5"/>

                    </svg>

                    Departments

                </a>

            </li>


            <!-- Attendance -->

            <li>

                <a href="attendance">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <rect x="3" y="4"
                              width="18"
                              height="17"
                              rx="2"/>

                        <path d="M8 2v4"/>
                        <path d="M16 2v4"/>

                        <path d="M3 10h18"/>

                        <path d="M8 15l2 2 5-5"/>

                    </svg>

                    Attendance

                </a>

            </li>


            <!-- Marks -->

            <li>

                <a href="marks">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 19V5"/>
                        <path d="M4 19h17"/>

                        <path d="M7 16l4-5 3 2 5-7"/>

                    </svg>

                    Marks

                </a>

            </li>


            <!-- Academic Records -->

            <li>

                <a href="academic-records">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 4h16v16H4z"/>

                        <path d="M8 8h8"/>
                        <path d="M8 12h8"/>
                        <path d="M8 16h5"/>

                    </svg>

                    Academic Records

                </a>

            </li>


            <!-- Change Password -->

            <li>

                <a href="change-password.jsp">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <rect x="5" y="10"
                              width="14"
                              height="10"
                              rx="2"/>

                        <path d="M8 10V7a4 4 0 018 0v3"/>

                    </svg>

                    Change Password

                </a>

            </li>

        </ul>


        <!-- Logout -->

        <div class="logout">

            <ul class="menu">

                <li>

                    <a href="logout">

                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke="currentColor"
                             stroke-width="2">

                            <path d="M10 17l5-5-5-5"/>

                            <path d="M15 12H3"/>

                            <path d="M21 3v18"/>

                        </svg>

                        Logout

                    </a>

                </li>

            </ul>

        </div>

    </aside>


    <!-- ================= MAIN ================= -->

    <main class="main">


        <!-- ================= WELCOME ================= -->

        <div class="welcome">

            <div class="welcome-text">

                <h1>
                    Welcome Back, Student!
                </h1>

                <p>
                    Manage your academic information,
                    attendance and performance from one place.
                </p>

            </div>


            <div class="welcome-illustration">

                <svg viewBox="0 0 140 110"
                     fill="none">

                    <rect x="15"
                          y="30"
                          width="110"
                          height="65"
                          rx="8"
                          fill="#dfe8ff"/>

                    <path d="M35 30
                             L70 12
                             L105 30"
                          stroke="#1f3c88"
                          stroke-width="5"
                          stroke-linecap="round"
                          stroke-linejoin="round"/>

                    <rect x="42"
                          y="48"
                          width="18"
                          height="30"
                          rx="2"
                          fill="#6b82e8"/>

                    <rect x="80"
                          y="48"
                          width="18"
                          height="30"
                          rx="2"
                          fill="#8e5bc7"/>

                    <circle cx="70"
                            cy="72"
                            r="10"
                            fill="#f3a84b"/>

                </svg>

            </div>

        </div>


        <!-- ================= STATISTICS ================= -->

        <h2 class="section-title">
            Academic Overview
        </h2>


        <div class="stats">


            <!-- Attendance -->

            <div class="stat-card">

                <div class="stat-icon attendance-icon">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M5 13l4 4L19 7"/>

                    </svg>

                </div>


                <div class="stat-content">

                    <h4>
                        Attendance
                    </h4>

                    <div class="stat-value">

                        <%= String.format(
                                "%.2f",
                                attendance
                           ) %>%

                    </div>

                </div>

            </div>


            <!-- Average Marks -->

            <div class="stat-card">

                <div class="stat-icon marks-icon">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 19V5"/>
                        <path d="M4 19h17"/>

                        <path d="M7 16l4-5 3 2 5-7"/>

                    </svg>

                </div>


                <div class="stat-content">

                    <h4>
                        Average Marks
                    </h4>

                    <div class="stat-value">

                        <%= String.format(
                                "%.2f",
                                averageMarks
                           ) %>

                    </div>

                </div>

            </div>


            <!-- Registered Subjects -->

            <div class="stat-card">

                <div class="stat-icon academic-icon">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 4h16v16H4z"/>

                        <path d="M8 8h8"/>
                        <path d="M8 12h8"/>
                        <path d="M8 16h5"/>

                    </svg>

                </div>


                <div class="stat-content">

                    <h4>
                        Registered Subjects
                    </h4>

                    <div class="stat-value">

                        <%= subjectCount %>

                    </div>

                </div>

            </div>


            <!-- Student ID -->

            <div class="stat-card">

                <div class="stat-icon id-icon">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <circle cx="12"
                                cy="12"
                                r="9"/>

                        <path d="M8 12h8"/>
                        <path d="M8 8h4"/>
                        <path d="M8 16h5"/>

                    </svg>

                </div>


                <div class="stat-content">

                    <h4>
                        Student ID
                    </h4>

                    <div class="stat-value">

                        <%= studentId %>

                    </div>

                </div>

            </div>

        </div>


        <!-- ================= SERVICES ================= -->

        <h2 class="section-title">
            Student Services
        </h2>


        <div class="services">


            <!-- Profile -->

            <div class="service-card">

                <div class="service-icon blue">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <circle cx="12" cy="8" r="4"/>

                        <path d="M4 21c0-4 3-7 8-7s8 3 8 7"/>

                    </svg>

                </div>

                <h3>
                    My Profile
                </h3>

                <p>
                    View and update your personal information.
                </p>

                <a href="profile">
                    View Profile
                </a>

            </div>


            <!-- Departments -->

            <div class="service-card">

                <div class="service-icon purple">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M3 21h18"/>

                        <path d="M5 21V7l7-4 7 4v14"/>

                        <path d="M9 21v-5h6v5"/>

                    </svg>

                </div>

                <h3>
                    Departments
                </h3>

                <p>
                    View available college departments.
                </p>

                <a href="departments">
                    View Departments
                </a>

            </div>


            <!-- Attendance -->

            <div class="service-card">

                <div class="service-icon green">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <rect x="3" y="4"
                              width="18"
                              height="17"
                              rx="2"/>

                        <path d="M8 2v4"/>
                        <path d="M16 2v4"/>

                        <path d="M3 10h18"/>

                        <path d="M8 15l2 2 5-5"/>

                    </svg>

                </div>

                <h3>
                    Attendance
                </h3>

                <p>
                    Check your attendance records and percentage.
                </p>

                <a href="attendance">
                    View Attendance
                </a>

            </div>


            <!-- Marks -->

            <div class="service-card">

                <div class="service-icon orange">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 19V5"/>
                        <path d="M4 19h17"/>

                        <path d="M7 16l4-5 3 2 5-7"/>

                    </svg>

                </div>

                <h3>
                    Marks
                </h3>

                <p>
                    View your subject-wise marks and performance.
                </p>

                <a href="marks">
                    View Marks
                </a>

            </div>


            <!-- Academic Records -->

            <div class="service-card">

                <div class="service-icon cyan">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M4 4h16v16H4z"/>

                        <path d="M8 8h8"/>
                        <path d="M8 12h8"/>
                        <path d="M8 16h5"/>

                    </svg>

                </div>

                <h3>
                    Academic Records
                </h3>

                <p>
                    View your complete academic information.
                </p>

                <a href="academic-records">
                    View Records
                </a>

            </div>


            <!-- Update Profile -->

            <div class="service-card">

                <div class="service-icon blue">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M12 20h9"/>

                        <path d="M16.5 3.5
                                 a2.121 2.121 0 013 3L7 19l-4 1
                                 1-4z"/>

                    </svg>

                </div>

                <h3>
                    Update Profile
                </h3>

                <p>
                    Update your personal details.
                </p>

                <a href="profile">
                    Update Profile
                </a>

            </div>


            <!-- Change Password -->

            <div class="service-card">

                <div class="service-icon red">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <rect x="5"
                              y="10"
                              width="14"
                              height="10"
                              rx="2"/>

                        <path d="M8 10V7a4 4 0 018 0v3"/>

                    </svg>

                </div>

                <h3>
                    Change Password
                </h3>

                <p>
                    Secure your account by changing your password.
                </p>

                <a href="change-password.jsp">
                    Change Password
                </a>

            </div>


            <!-- Logout -->

            <div class="service-card">

                <div class="service-icon red">

                    <svg viewBox="0 0 24 24"
                         fill="none"
                         stroke="currentColor"
                         stroke-width="2">

                        <path d="M10 17l5-5-5-5"/>

                        <path d="M15 12H3"/>

                        <path d="M21 3v18"/>

                    </svg>

                </div>

                <h3>
                    Logout
                </h3>

                <p>
                    Safely logout from your student account.
                </p>

                <a href="logout">
                    Logout
                </a>

            </div>


        </div>


        <!-- ================= FOOTER ================= -->

        <div class="footer">

            © 2026 College Student Management System

        </div>


    </main>

</div>

</body>

</html>