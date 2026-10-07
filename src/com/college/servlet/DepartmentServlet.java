package com.college.servlet;

import com.college.dao.DepartmentDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/departments")
public class DepartmentServlet extends HttpServlet {

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

        DepartmentDAO dao =
                new DepartmentDAO();

        List<String[]> departments =
                dao.getDepartments();

        request.setAttribute(
                "departments",
                departments);

        request.getRequestDispatcher(
                "departments.jsp")
                .forward(request, response);
    }
}