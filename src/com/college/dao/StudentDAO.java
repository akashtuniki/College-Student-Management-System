package com.college.dao;

import com.college.model.Student;
import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class StudentDAO {

    public boolean registerStudent(Student student) {

        String sql = "INSERT INTO STUDENT "
                   + "(student_id, name, email, phone, gender, dob, "
                   + "address, department_id, password) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, student.getStudentId());
            ps.setString(2, student.getName());
            ps.setString(3, student.getEmail());
            ps.setString(4, student.getPhone());
            ps.setString(5, student.getGender());

            // DOB will be handled later
            ps.setDate(6, java.sql.Date.valueOf(student.getDob()));

            ps.setString(7, student.getAddress());
            ps.setInt(8, student.getDepartmentId());
            ps.setString(9, student.getPassword());

            int rows = ps.executeUpdate();

            return rows > 0;

        } catch (Exception e) {

            e.printStackTrace();
            return false;
        }
    }
public boolean loginStudent(int studentId, String password) {

    String sql = "SELECT * FROM STUDENT "
               + "WHERE student_id = ? AND password = ?";

    try (
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(sql)
    ) {

        ps.setInt(1, studentId);
        ps.setString(2, password);

        var rs = ps.executeQuery();

        return rs.next();

    } catch (Exception e) {

        e.printStackTrace();
        return false;
    }
}
}