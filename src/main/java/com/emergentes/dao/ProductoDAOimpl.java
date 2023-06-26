
package com.emergentes.dao;

import com.emergentes.modelo.Producto;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOimpl extends ConexionDB implements ProductoDAO{

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO productos (nombre,descripcion,categoria,subCategoria,marca,precio,ubicacion,stock,cantidad) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getCategoria());
            ps.setString(4, producto.getSubCategoria());
            ps.setString(5, producto.getMarca());
            ps.setFloat(6, producto.getPrecio());
            ps.setString(7, producto.getUbicacion());
            ps.setString(8, producto.getStock());
            ps.setFloat(9, producto.getCantidad());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void update(Producto producto) throws Exception {
        try {
            this.conectar();
            String sql="UPDATE productos SET nombre=?,descripcion=?,categoria=?,subCategoria=?,marca=?,precio=?,ubicacion=?,stock=?,cantidad=? WHERE id=? ;";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setString(3, producto.getSubCategoria());
            ps.setString(4, producto.getMarca());
            ps.setFloat(5, producto.getPrecio());
            ps.setString(6, producto.getUbicacion());
            ps.setString(7, producto.getStock());
            ps.setInt(8, producto.getCantidad());
            ps.setInt(9, producto.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        try {
            this.conectar();
            String sql="DELETE FROM productos WHERE id=? ;";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Producto getById(int id) throws Exception {
        Producto pro = new Producto();
        try {
            this.conectar();
            String sql="SELECT * FROM productos WHERE id = ?";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setCategoria(rs.getString("categoria"));
                pro.setSubCategoria(rs.getString("subCategoria"));
                pro.setMarca(rs.getString("marca"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setUbicacion(rs.getString("ubicacion"));
                pro.setStock(rs.getString("stock"));
                pro.setCantidad(rs.getInt("cantidad"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
        return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista = null;
        try {
            this.conectar();
            String sql="SELECT * FROM productos";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            
            lista  = new ArrayList<Producto>();
            while(rs.next()){
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCategoria(rs.getString("categoria"));
                p.setSubCategoria(rs.getString("subCategoria"));
                p.setMarca(rs.getString("marca"));
                p.setPrecio(rs.getFloat("precio"));
                p.setUbicacion(rs.getString("ubicacion"));
                p.setStock(rs.getString("stock"));
                p.setCantidad(rs.getInt("cantidad"));
                lista.add(p);
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
