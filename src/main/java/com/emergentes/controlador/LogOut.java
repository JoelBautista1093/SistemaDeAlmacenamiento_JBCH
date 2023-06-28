
package com.emergentes.controlador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LogOut", urlPatterns = {"/LogOut"})
public class LogOut extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
         switch (action) {
                case "out":
                    
                    ses.invalidate();
                    response.sendRedirect("Login.jsp");
                    break;
                case "view":
                    
                    ses.invalidate();
                    response.sendRedirect("Login.jsp");
                    break;
            }
    }
}