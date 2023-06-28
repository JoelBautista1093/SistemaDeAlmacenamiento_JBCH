package com.emergentes.controlador;

import com.emergentes.dao.ClienteDAO;
import com.emergentes.dao.ClienteDAOimpl;
import com.emergentes.dao.ProductoDAO;
import com.emergentes.dao.ProductoDAOimpl;
import com.emergentes.dao.VentaDAO;
import com.emergentes.dao.VentaDAOimpl;
import com.emergentes.modelo.Cliente;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.Venta;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "VentaControlador", urlPatterns = {"/VentaControlador"})
public class VentaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id;
            VentaDAO dao = new VentaDAOimpl();
            ProductoDAO daoProducto = new ProductoDAOimpl();
            ClienteDAO daoCliente = new ClienteDAOimpl();

            List<Producto> lista_productos = null;
            List<Cliente> lista_clientes = null;
            Venta venta = new Venta();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    //nuevo
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("ventas", venta);
                    request.getRequestDispatcher("frmventas.jsp").forward(request, response);
                    break;
                case "edit":
                    //editar
                    id = Integer.parseInt(request.getParameter("id"));
                    venta = dao.getById(id);
                    lista_productos = daoProducto.getAll();
                    lista_clientes = daoCliente.getAll();
                    request.setAttribute("lista_productos", lista_productos);
                    request.setAttribute("lista_clientes", lista_clientes);
                    request.setAttribute("ventas", venta);
                    request.getRequestDispatcher("frmventas.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("VentaControlador");
                    break;
                case "view":
                    List<Venta> lista = dao.getAll();
                    request.setAttribute("ventas", lista);
                    request.getRequestDispatcher("ventas.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("Error" + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            int id_venta = Integer.parseInt(request.getParameter("id"));
            int id_cliente = Integer.parseInt(request.getParameter("cliente_id"));
            int id_producto = Integer.parseInt(request.getParameter("producto_id"));
            String cliente = request.getParameter("");
            String producto = request.getParameter("");
            int cantidad = Integer.parseInt(request.getParameter(""));
            float precio = Float.parseFloat(request.getParameter("")); 
            String fecha = request.getParameter("fecha");

            Venta venta = new Venta();

            venta.setId_venta(id_venta);
            venta.setId_cliente(id_cliente);
            venta.setId_producto(id_producto);
            venta.setCliente("");
            venta.setProducto("");
            venta.setCantidad(cantidad);
            venta.setPrecio(precio);
            venta.setPrecio_total(cantidad*(int)precio);
            venta.setFecha(convierte_fecha(fecha));

            if (id_venta == 0) {
                //nuevo
                VentaDAO dao = new VentaDAOimpl();
                try {
                    dao.insert(venta);
                    response.sendRedirect("VentaControlador");
                } catch (Exception ex) {
                    Logger.getLogger(VentaControlador.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                //editar
                VentaDAO dao = new VentaDAOimpl();
                try {
                    dao.update(venta);
                    response.sendRedirect("VentaControlador");
                } catch (Exception ex) {
                    Logger.getLogger(VentaControlador.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

    
    public Date convierte_fecha(String fecha) {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            Logger.getLogger(VentaControlador.class.getName()).log(Level.SEVERE, null, ex);
        }
        return fechaBD;
    }
}
