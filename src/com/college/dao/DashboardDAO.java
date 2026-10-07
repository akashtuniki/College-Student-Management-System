package com.college.dao;

import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DashboardDAO {

    public double getAttendancePercentage(int studentId) {

        String sql =
                "SELECT " +
                "NVL(SUM(CASE WHEN status = 'Present' THEN 1 ELSE 0 END), 0) " +
                "AS present_count, " +
                "COUNT(*) AS total_count " +
                "FROM ATTENDANCE " +
                "WHERE student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                int present = rs.getInt("present_count");
                int total = rs.getInt("total_count");

                if (total == 0) {
                    return 0;
                }

                return (present * 100.0) / total;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }


    public double getAverageMarks(int studentId) {

        String sql =
                "SELECT NVL(AVG(marks), 0) AS average_marks " +
                "FROM MARKS " +
                "WHERE student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getDouble("average_marks");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }


    public int getSubjectCount(int studentId) {

        String sql =
                "SELECT COUNT(*) AS subject_count " +
                "FROM MARKS " +
                "WHERE student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getInt("subject_count");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }
}