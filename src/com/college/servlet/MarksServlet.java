package com.college.servlet;

import com.college.dao.MarksDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/marks")
public class MarksServlet extends HttpServlet {

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

        MarksDAO dao = new MarksDAO();

        List<String[]> marks =
                dao.getMarks(studentId);

        request.setAttribute(
                "marks",
                marks);

        request.getRequestDispatcher(
                "marks.jsp")
                .forward(request, response);
    }
}