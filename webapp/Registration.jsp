<!DOCTYPE html>
<html>
<head>
    <title>Student Registration</title>
</head>
<body>

    <h1>Student Registration</h1>

    <form action="register" method="post">

        Student ID:
        <input type="number" name="studentId" required>
        <br><br>

        Name:
        <input type="text" name="name" required>
        <br><br>

        Email:
        <input type="email" name="email" required>
        <br><br>

        Phone:
        <input type="text" name="phone">
        <br><br>

        Gender:
        <select name="gender">
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
        <br><br>

        Date of Birth:
        <input type="date" name="dob" required>
        <br><br>

        Address:
        <textarea name="address"></textarea>
        <br><br>

        Department:
        <select name="departmentId" required>
            <option value="1">Computer Science</option>
            <option value="2">Information Technology</option>
            <option value="3">Electronics and Communication</option>
        </select>
        <br><br>

        Password:
        <input type="password" name="password" required>
        <br><br>

        <button type="submit">Register</button>

    </form>

</body>
</html>