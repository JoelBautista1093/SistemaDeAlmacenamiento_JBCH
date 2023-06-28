
package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.modelo.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ClienteControlador", urlPatterns = {"/ClienteControlador"})
public class ClienteControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
              
        try {
            Cliente cli = new Cliente();
            int id;
            ClienteDAO dao = new ClienteDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            
            switch (action) {
                case "add":
                    request.setAttribute("cliente", cli);
                    request.getRequestDispatcher("frmclientes.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    cli = dao.getById(id);
                    request.setAttribute("cliente", cli);
                    request.getRequestDispatcher("frmclientes.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ClienteControlador");
                    break;
                case "view":
                   //obtener la lista de registros
                    List<Cliente> lista = dao.getAll();
                    request.setAttribute("clientes", lista);
                    request.getRequestDispatcher("clientes.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error"+ ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String celular = request.getParameter("celular");
        String ci = request.getParameter("ci");
        
        Cliente cli = new Cliente();
        
        cli.setId(id);
        cli.setNombre(nombre);
        cli.setCorreo(correo);
        cli.setCelular(celular);
        cli.setApellido(apellido);
        cli.setCi(ci);
        
        ClienteDAO dao = new ClienteDAOimpl();
        
        if(id==0){
            try {
                //nuevoREgistro
                dao.insert(cli);
            } catch (Exception ex) {
                System.out.println("Error nuevo Registro :" + ex.getMessage());
            }
        }else{
            try {
                //editer R
                dao.update(cli);
            } catch (Exception ex) {
                System.out.println("Error edicion Registro: "+ ex.getMessage());
            }
        }
        response.sendRedirect("ClienteControlador"); 
    }

}
