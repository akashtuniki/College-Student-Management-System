package com.college.dao;

import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AttendanceDAO {

    public List<String[]> getAttendance(int studentId) {

        List<String[]> attendance = new ArrayList<>();

        String sql =
                "SELECT attendance_date, status "
                + "FROM ATTENDANCE "
                + "WHERE student_id = ? "
                + "ORDER BY attendance_date DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] record = {
                    rs.getDate("attendance_date").toString(),
                    rs.getString("status")
                };

                attendance.add(record);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return attendance;
    }
}