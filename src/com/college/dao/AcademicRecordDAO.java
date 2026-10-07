package com.college.dao;

import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AcademicRecordDAO {

    public String[] getStudentDetails(int studentId) {

        String[] student = null;

        String sql =
                "SELECT s.student_id, s.name, s.email, "
                + "d.department_name "
                + "FROM STUDENT s "
                + "JOIN DEPARTMENT d "
                + "ON s.department_id = d.department_id "
                + "WHERE s.student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                student = new String[] {
                    String.valueOf(rs.getInt("student_id")),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("department_name")
                };
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return student;
    }
}