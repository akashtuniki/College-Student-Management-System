<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>College Student Management System</title>

    <link rel="stylesheet"
          href="css/style.css">

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #fff8ed;
        }

        .home-header {
            background: linear-gradient(
                135deg,
                #c2410c,
                #ea580c,
                #f59e0b
            );

            color: white;
            padding: 30px 20px;
            text-align: center;
        }

        .home-header h1 {
            margin: 0;
            font-size: 34px;
        }

        .home-header p {
            margin-top: 10px;
            font-size: 17px;
        }

        .welcome {
            text-align: center;
            padding: 35px 20px 20px;
        }

        .welcome h2 {
            color: #c2410c;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #555;
            font-size: 16px;
        }

        .login-section {
            text-align: center;
            margin: 20px 0 30px;
        }

        .login-btn {
            display: inline-block;
            padding: 13px 30px;
            background: #c2410c;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            transition: 0.3s;
        }

        .login-btn:hover {
            background: #9a3412;
            transform: translateY(-2px);
        }

        .services {
            max-width: 1100px;
            margin: auto;
            padding: 10px 25px 40px;

            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(280px, 1fr));

            gap: 22px;
        }

        .service-card {
            background: white;
            border-radius: 12px;
            padding: 25px;
            text-align: center;

            border: 2px solid #fed7aa;

            box-shadow:
                0 5px 15px rgba(0,0,0,0.08);

            transition: 0.3s;
        }

        .service-card:hover {
            transform: translateY(-6px);

            border-color: #f59e0b;

            box-shadow:
                0 8px 20px rgba(0,0,0,0.12);
        }

        .service-icon {
            font-size: 38px;
            margin-bottom: 12px;
        }

        .service-card h3 {
            color: #c2410c;
            margin: 10px 0;
        }

        .service-card p {
            color: #666;
            line-height: 1.5;
            font-size: 14px;
        }

        .service-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 9px 18px;

            background: #f59e0b;
            color: white;

            text-decoration: none;
            border-radius: 6px;

            font-size: 14px;
            font-weight: bold;

            transition: 0.3s;
        }

        .service-btn:hover {
            background: #d97706;
        }

        .home-footer {
            background: #7c2d12;
            color: white;
            text-align: center;
            padding: 18px;
            margin-top: 20px;
        }

        .home-footer p {
            margin: 0;
            font-size: 14px;
        }

        @media (max-width: 600px) {

            .home-header h1 {
                font-size: 26px;
            }

            .services {
                grid-template-columns: 1fr;
                padding: 10px 15px 30px;
            }

        }

    </style>

</head>

<body>

<!-- HEADER -->

<div class="home-header">

    <h1>🎓 College Student Management System</h1>

    <p>
        A complete platform for managing student academic information
    </p>

</div>


<!-- WELCOME -->

<div class="welcome">

    <h2>Welcome</h2>

    <p>
        Manage student registration, departments, attendance,
        marks and academic records in one place.
    </p>

</div>


<!-- LOGIN -->

<div class="login-section">

    <a href="Login.jsp" class="login-btn">
        🔐 Student Login
    </a>

</div>


<!-- SERVICES -->

<div class="services">


    <!-- REGISTRATION -->

    <div class="service-card">

        <div class="service-icon">📝</div>

        <h3>Student Registration</h3>

        <p>
            Register a new student with personal and
            academic information.
        </p>

        <a href="Registration.jsp"
           class="service-btn">
            Register
        </a>

    </div>


    <!-- DEPARTMENT -->

    <div class="service-card">

        <div class="service-icon">🏫</div>

        <h3>Department Management</h3>

        <p>
            View the departments available in the college
            and their information.
        </p>

        <a href="departments"
           class="service-btn">
            View Departments
        </a>

    </div>


    <!-- ATTENDANCE -->

    <div class="service-card">

        <div class="service-icon">📅</div>

        <h3>Attendance Tracking</h3>

        <p>
            Track student attendance and view
            attendance percentage.
        </p>

        <a href="attendance"
           class="service-btn">
            Attendance
        </a>

    </div>


    <!-- MARKS -->

    <div class="service-card">

        <div class="service-icon">📊</div>

        <h3>Marks Management</h3>

        <p>
            View subject-wise marks, average marks
            and academic performance.
        </p>

        <a href="marks"
           class="service-btn">
            View Marks
        </a>

    </div>


    <!-- PROFILE -->

    <div class="service-card">

        <div class="service-icon">👤</div>

        <h3>Profile Updates</h3>

        <p>
            View and update student profile
            information.
        </p>

        <a href="profile"
           class="service-btn">
            View Profile
        </a>

    </div>


    <!-- ACADEMIC RECORDS -->

    <div class="service-card">

        <div class="service-icon">🎓</div>

        <h3>Academic Records</h3>

        <p>
            Access student academic information,
            department details and performance.
        </p>

        <a href="academic-records"
           class="service-btn">
            View Records
        </a>

    </div>


</div>


<!-- FOOTER -->

<div class="home-footer">

    <p>
        © 2026 College Student Management System |
        JSP • Servlets • JDBC • Oracle
    </p>

</div>

</body>

</html>