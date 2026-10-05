package com.college.servlet;

import com.college.dao.StudentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/login")
public class StudentLoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int studentId =
                    Integer.parseInt(
                            request.getParameter("studentId"));

            String password =
                    request.getParameter("password");

            StudentDAO dao = new StudentDAO();

            boolean result =
                    dao.loginStudent(studentId, password);
if (result) {

    response.sendRedirect(
            "student-dashboard.jsp");

}  else {

                response.sendRedirect(
                        "login-failed.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "login-failed.jsp");
        }
    }
}