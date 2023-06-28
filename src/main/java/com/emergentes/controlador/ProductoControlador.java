package com.emergentes.controlador;

import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.SubCategoria;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoControlador", urlPatterns = {"/ProductoControlador"})
public class ProductoControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            

            Producto pro = new Producto();
            int id;
            ProductoDAO dao = new ProductoDAOimpl();

            List<Categoria> lista_categorias = null;
            List<SubCategoria> lista_subcategorias = null;

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    lista_categorias = dao.getAllcat();
                    //lista_subcategorias=dao.getAllByIdCat();
                    request.setAttribute("lista_categorias", lista_categorias);
                    request.setAttribute("lista_subcategorias", lista_subcategorias);
                    request.setAttribute("producto", pro);
                    request.getRequestDispatcher("frmproductos.jsp").forward(request, response);
                    break;
                case "edit":
                    //lista_categorias = dao.getAllcat();

                    //lista_subcategorias=dao.getAllByIdCat();
                    id = Integer.parseInt(request.getParameter("id"));

                    pro = dao.getById(id);
                    request.setAttribute("producto", pro);
                    //request.setAttribute("lista_categorias", lista_categorias);
                    //request.setAttribute("lista_subcategorias", lista_subcategorias);
                    request.getRequestDispatcher("frmproductos.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "mostrar":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ProductoControlador");
                    break;
                case "view":
                    //obtener la lista de registros
                    List<Producto> lista = dao.getAll();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("productos.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
