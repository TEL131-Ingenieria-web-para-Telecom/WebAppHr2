package com.example.webapphr2.Controllers;

import com.example.webapphr2.Beans.Employee;
import com.example.webapphr2.Daos.EmployeeDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action") != null ? req.getParameter("action") : "login";

        if (action.equals("login")) {

            HttpSession session = req.getSession();

            if(session != null && session.getAttribute("usuarioLog") != null){

                Employee employee = (Employee) session.getAttribute("usuarioLog");

                if(employee.getEmployeeId()>0){ //estoy loggedIn
                    resp.sendRedirect(req.getContextPath() + "/EmployeeServlet");
                }else{ // no estoy loggedId
                    RequestDispatcher dispatcher = req.getRequestDispatcher("loginPage.jsp");
                    dispatcher.forward(req, resp);
                }
            }
        }else{ //logout
            req.getSession().invalidate();
            resp.sendRedirect(req.getContextPath());
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("inputEmail");
        String pass = req.getParameter("inputPassword");

        EmployeeDao employeeDao = new EmployeeDao();

        Employee employee = employeeDao.validateUsernameAndPassword(email, pass);


        if (employee != null) { //usuario y password correctos
            HttpSession session = req.getSession();
            session.setAttribute("usuarioLog", employee);

            session.setMaxInactiveInterval(300);//en segundos

            resp.sendRedirect(req.getContextPath());
        } else { //usuario o password incorrectos
            req.setAttribute("error", "Usuario o password incorrectos");
            req.getRequestDispatcher("loginPage.jsp").forward(req, resp);
        }
    }
}
