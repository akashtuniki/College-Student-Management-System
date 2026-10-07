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
import java.sql.ResultSet;

@WebServlet("/profile")
public class StudentProfileServlet extends HttpServlet {

    @Override
    protected void doGet(
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

        String sql =
                "SELECT * FROM STUDENT WHERE student_id = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)
        ) {

            ps.setInt(1, studentId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute(
                        "studentId",
                        rs.getInt("student_id"));

                request.setAttribute(
                        "name",
                        rs.getString("name"));

                request.setAttribute(
                        "email",
                        rs.getString("email"));

                request.setAttribute(
                        "phone",
                        rs.getString("phone"));

                request.setAttribute(
                        "gender",
                        rs.getString("gender"));

                request.setAttribute(
                        "dob",
                        rs.getDate("dob"));

                request.setAttribute(
                        "address",
                        rs.getString("address"));

                request.setAttribute(
                        "departmentId",
                        rs.getInt("department_id"));

                request.getRequestDispatcher(
                        "profile.jsp")
                        .forward(request, response);

            } else {

                response.sendRedirect(
                        "student-dashboard.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "student-dashboard.jsp");
        }
    }
}