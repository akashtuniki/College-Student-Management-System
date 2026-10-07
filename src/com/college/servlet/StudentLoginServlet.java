package com.college.servlet;

import com.college.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        int studentId =
                Integer.parseInt(
                        request.getParameter("studentId")
                );

        String password =
                request.getParameter("password");

        StudentDAO dao =
                new StudentDAO();

        boolean valid =
                dao.loginStudent(
                        studentId,
                        password
                );

        if (valid) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                    "studentId",
                    studentId
            );

            // Go through DashboardServlet
            response.sendRedirect("dashboard");

        } else {

            response.sendRedirect(
                    "login-failed.jsp"
            );
        }
    }
}