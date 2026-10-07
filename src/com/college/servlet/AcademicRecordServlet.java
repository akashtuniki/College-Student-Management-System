package com.college.servlet;

import com.college.dao.AcademicRecordDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/academic-records")
public class AcademicRecordServlet extends HttpServlet {

    @Override
    protected void doGet(
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

        AcademicRecordDAO dao =
                new AcademicRecordDAO();

        String[] student =
                dao.getStudentDetails(studentId);

        request.setAttribute(
                "student",
                student);

        request.getRequestDispatcher(
                "academic-records.jsp")
                .forward(request, response);
    }
}