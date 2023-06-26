package com.emergentes.dao;

import com.emergentes.modelo.Venta;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class VentaDAOimpl extends ConexionDB implements VentaDAO {

    @Override
    public void insert(Venta venta) throws Exception {

        try {
            this.conectar();
            String sql = "INSERT INTO ventas (id_cliente,id_producto,cantidad,fecha) VALUES (?,?,?,?)";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, venta.getId_cliente());
            ps.setInt(2, venta.getId_producto());
            ps.setInt(3, venta.getCantidad());
            ps.setDate(4, venta.getFecha());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en la insersion Venta :( " + e.getMessage());
        } finally {
            this.desconectar();
        }

    }

    @Override
    public void update(Venta venta) throws Exception {
        try {
            this.conectar();
            String sql = "UPDATE ventas SET id_cliente=?,id_producto=?,cantidad=?,fecha=? WHERE venta_id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, venta.getId_cliente());
            ps.setInt(2, venta.getId_producto());
            ps.setInt(3, venta.getCantidad());
            ps.setDate(4, venta.getFecha());
            ps.setInt(4, venta.getId_venta());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en la actualizacion Venta :( " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql = "DELETE FROM ventasWHERE venta_id=?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en la eliminacion venta :( " + e.getMessage());
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Venta getById(int id) throws Exception {
        Venta v = new Venta();
        try {
            this.conectar();
            String sql = "SELECT * FROM ventas WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
               v.setId_venta(rs.getInt("id_venta"));
               v.setId_producto(rs.getInt("id_producto"));
               v.setId_cliente(rs.getInt("id_cliente"));
               v.setFecha(rs.getDate("fecha"));
               v.setCantidad(rs.getInt("cantidad"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return v;
    }

    @Override
    public List<Venta> getAll() throws Exception {
        List<Venta> lista = null;
        try {
            this.conectar();
            String sql = "SELECT v.*,p.nombre as producto, c.nombre as cliente, ";
            sql += "p.precio as Precio,ROUND((p.precio * v.cantidad)) as 'PrecioTotalCompra' ";
            sql += "FROM ventas v "; 
            sql += "LEFT JOIN productos p ON v.id_producto = p.id "; 
            sql += "LEFT JOIN clientes c ON v.id_cliente = c.id ";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Venta>();
            while (rs.next()) {
               Venta v = new Venta();
               v.setId_venta(rs.getInt("id_venta"));
               v.setId_producto(rs.getInt("id_producto"));
               v.setId_cliente(rs.getInt("id_cliente"));
               v.setFecha(rs.getDate("fecha"));
               v.setCantidad(rs.getInt("cantidad"));
               v.setProducto(rs.getString("producto"));
               v.setCliente(rs.getString("cliente"));
               v.setPrecio(rs.getFloat("precio"));
               v.setPrecio_total(rs.getInt("PrecioTotalCompra"));
               lista.add(v);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return lista;
    }

}
