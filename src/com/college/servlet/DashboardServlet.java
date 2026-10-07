package com.college.servlet;

import com.college.dao.DashboardDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("studentId") == null) {

            response.sendRedirect("Login.jsp");
            return;
        }

        // Get logged-in student ID
        int studentId =
                (Integer) session.getAttribute("studentId");

        // Create DAO
        DashboardDAO dao =
                new DashboardDAO();

        // Get dashboard data
        double attendance =
                dao.getAttendancePercentage(studentId);

        double averageMarks =
                dao.getAverageMarks(studentId);

        int subjectCount =
                dao.getSubjectCount(studentId);

        // Send data to JSP
        request.setAttribute(
                "attendance",
                attendance);

        request.setAttribute(
                "averageMarks",
                averageMarks);

        request.setAttribute(
                "subjectCount",
                subjectCount);

        // Open dashboard
        request.getRequestDispatcher(
                "student-dashboard.jsp")
                .forward(request, response);
    }
}