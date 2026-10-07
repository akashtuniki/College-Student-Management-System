<!DOCTYPE html>
<html>

<head>

    <title>Student Registration</title>

    <link rel="stylesheet" href="css/style.css">

</head>

<body>

    <div class="form-container">

        <h1>Student Registration</h1>

        <form action="register" method="post">

            <label>Student ID</label>
            <input type="number" name="studentId" required>


            <label>Name</label>
            <input type="text" name="name" required>


            <label>Email</label>
            <input type="email" name="email" required>


            <label>Phone</label>
            <input type="text" name="phone" required>


            <label>Gender</label>

            <select name="gender" required>
                <option value="">Select Gender</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>


            <label>Date of Birth</label>
            <input type="date" name="dob" required>


            <label>Address</label>
            <textarea name="address" rows="3" required></textarea>


            <label>Department</label>

            <select name="departmentId" required>

                <option value="">Select Department</option>

                <option value="1">
                    Computer Science
                </option>

                <option value="2">
                    Information Technology
                </option>

                <option value="3">
                    Electronics and Communication
                </option>

            </select>


            <label>Password</label>
            <input type="password" name="password" required>


            <button type="submit">
                Register
            </button>

        </form>


        <p style="text-align:center; margin-top:20px;">

            Already have an account?

            <a href="Login.jsp">
                Login here
            </a>

        </p>

    </div>

</body>

</html>