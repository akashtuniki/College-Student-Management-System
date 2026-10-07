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

@WebServlet("/change-password")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("Login.jsp");
            return;
        }

        int studentId =
                (Integer) session.getAttribute("studentId");

        String currentPassword =
                request.getParameter("currentPassword");

        String newPassword =
                request.getParameter("newPassword");

        String confirmPassword =
                request.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect(
                    "change-password.jsp?error=mismatch");

            return;
        }

        String checkSql =
                "SELECT password FROM STUDENT "
                + "WHERE student_id = ?";

        String updateSql =
                "UPDATE STUDENT SET password = ? "
                + "WHERE student_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement checkPs =
                     con.prepareStatement(checkSql)) {

            checkPs.setInt(1, studentId);

            ResultSet rs = checkPs.executeQuery();

            if (rs.next()) {

                String databasePassword =
                        rs.getString("password");

                if (!databasePassword.equals(currentPassword)) {

                    response.sendRedirect(
                            "change-password.jsp?error=incorrect");

                    return;
                }
            }

            try (PreparedStatement updatePs =
                         con.prepareStatement(updateSql)) {

                updatePs.setString(1, newPassword);
                updatePs.setInt(2, studentId);

                int rows = updatePs.executeUpdate();

                if (rows > 0) {

                    response.sendRedirect(
                            "change-password.jsp?success=true");

                } else {

                    response.sendRedirect(
                            "change-password.jsp?error=failed");
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "change-password.jsp?error=failed");
        }
    }
}