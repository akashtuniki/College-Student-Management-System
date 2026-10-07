package com.college.dao;

import com.college.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDAO {

    public List<String[]> getDepartments() {

        List<String[]> departments = new ArrayList<>();

        String sql =
                "SELECT department_id, department_name "
                + "FROM DEPARTMENT";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery()
        ) {

            while (rs.next()) {

                String[] department = {
                    String.valueOf(rs.getInt("department_id")),
                    rs.getString("department_name")
                };

                departments.add(department);
            }

        } catch (Exception e) {

            e.printStackTrace();
        }

        return departments;
    }
}