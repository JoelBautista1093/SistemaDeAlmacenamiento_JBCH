package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Usuario usu = new Usuario();
            int id;
            UsuarioDAO dao = new UsuarioDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    request.setAttribute("usuario", usu);
                    request.getRequestDispatcher("frmusuarios.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    usu = dao.getById(id);
                    request.setAttribute("usuario", usu);
                    request.getRequestDispatcher("frmusuarios.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("UsuarioControlador");
                    break;
                case "view":
                    //obtener la lista de registros
                    List<Usuario> lista = dao.getAll();
                    request.setAttribute("usuarios", lista);
                    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String ci = request.getParameter("ci");
        String celular = request.getParameter("celular");
        String correo = request.getParameter("correo");
        String password = request.getParameter("password");

        Usuario usu = new Usuario();

        usu.setId(id);
        usu.setNombre(nombre);
        usu.setApellido(apellido);
        usu.setCi(ci);
        usu.setCelular(celular);
        usu.setCorreo(correo);
        usu.setPassword(password);

        UsuarioDAO dao = new UsuarioDAOimpl();

        if (id == 0) {
            try {
                //nuevoREgistro
                dao.insert(usu);
            } catch (Exception ex) {
                System.out.println("Error nuevo Registro :" + ex.getMessage());
            }
        } else {
            try {
                //editer R
                dao.update(usu);
            } catch (Exception ex) {
                System.out.println("Error edicion Registro: " + ex.getMessage());
            }
        }
        response.sendRedirect("UsuarioControlador");
    }
}
