package com.college.servlet;

import com.college.dao.StudentDAO;
import com.college.model.Student;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class StudentRegistrationServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int studentId =
                    Integer.parseInt(request.getParameter("studentId"));

            String name =
                    request.getParameter("name");

            String email =
                    request.getParameter("email");

            String phone =
                    request.getParameter("phone");

            String gender =
                    request.getParameter("gender");

            String dob =
                    request.getParameter("dob");

            String address =
                    request.getParameter("address");

            int departmentId =
                    Integer.parseInt(
                            request.getParameter("departmentId"));

            String password =
                    request.getParameter("password");

            Student student = new Student();

            student.setStudentId(studentId);
            student.setName(name);
            student.setEmail(email);
            student.setPhone(phone);
            student.setGender(gender);
            student.setDob(dob);
            student.setAddress(address);
            student.setDepartmentId(departmentId);
            student.setPassword(password);

            StudentDAO dao = new StudentDAO();

            boolean result =
                    dao.registerStudent(student);

            if (result) {

                response.sendRedirect(
                        "registration-success.jsp");

            } else {

                response.sendRedirect(
                        "registration-failed.jsp");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "registration-failed.jsp");
        }
    }
}