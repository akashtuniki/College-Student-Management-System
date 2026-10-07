package com.college.servlet;

import com.college.util.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

@WebServlet("/update-profile")
public class StudentUpdateServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("Login.jsp");
            return;
        }

        int studentId =
                (Integer) session.getAttribute("studentId");

        String name =
                request.getParameter("name");

        String phone =
                request.getParameter("phone");

        String gender =
                request.getParameter("gender");

        String dob =
                request.getParameter("dob");

        String address =
                request.getParameter("address");

        String sql =
                "UPDATE STUDENT SET "
                + "name = ?, "
                + "phone = ?, "
                + "gender = ?, "
                + "dob = ?, "
                + "address = ? "
                + "WHERE student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setString(1, name);
            ps.setString(2, phone);
            ps.setString(3, gender);
            ps.setDate(4, java.sql.Date.valueOf(dob));
            ps.setString(5, address);
            ps.setInt(6, studentId);

            int rows = ps.executeUpdate();

            if (rows > 0) {

                response.sendRedirect("profile");

            } else {

                response.sendRedirect("student-dashboard.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "student-dashboard.jsp");
        }
    }
}