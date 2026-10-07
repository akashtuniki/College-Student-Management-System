package com.college.dao;

import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MarksDAO {

    public List<String[]> getMarks(int studentId) {

        List<String[]> marksList = new ArrayList<>();

        String sql =
                "SELECT subject_name, marks "
                + "FROM MARKS "
                + "WHERE student_id = ? "
                + "ORDER BY subject_name";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                String[] record = {
                    rs.getString("subject_name"),
                    String.valueOf(rs.getDouble("marks"))
                };

                marksList.add(record);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return marksList;
    }
}