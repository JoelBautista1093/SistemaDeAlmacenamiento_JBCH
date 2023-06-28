package com.emergentes.dao;

import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.SubCategoria;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAOimpl extends ConexionDB implements ProductoDAO {

    @Override
    public void insert(Producto producto) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO productos (nombre,descripcion,categoria,subCategoria,marca,precio,ubicacion,stock,cantidad) values (?,?,?,?,?,?,?,?,?)");
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setInt(3, producto.getCategoria());
            ps.setInt(4, producto.getSubCategoria());
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
            String sql = "UPDATE productos SET nombre=?,descripcion=?,categoria=?,subCategoria=?,marca=?,precio=?,ubicacion=?,stock=?,cantidad=? WHERE id=? ;";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, producto.getNombre());
            ps.setString(2, producto.getDescripcion());
            ps.setInt(3, producto.getSubCategoria());
            ps.setInt(4, producto.getSubCategoria());
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
            String sql = "DELETE FROM productos WHERE id=? ;";
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
        System.out.println("11111111111getbyid-----0----"+id);
        try {
            System.out.println("11111111111getbyid----0.1-----"+id);
            this.conectar();
            System.out.println("11111111111getbyid-----1----"+id); //aqui llego
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM productos WHERE id = ?");
            System.out.println("11111111111getbyid-----2----"+id);
            ps.setInt(1, id);
            System.out.println("22222222222222");
            ResultSet rs = ps.executeQuery();
            System.out.println("ANTES DEL IF");
            if (rs.next()) {
                pro.setId(rs.getInt("id"));
                pro.setNombre(rs.getString("nombre"));
                pro.setDescripcion(rs.getString("descripcion"));
                pro.setCategoria(rs.getInt("categoria"));
                pro.setSubCategoria(rs.getInt("subCategoria"));
                pro.setMarca(rs.getString("marca"));
                pro.setPrecio(rs.getFloat("precio"));
                pro.setUbicacion(rs.getString("ubicacion"));
                pro.setStock(rs.getString("stock"));
                pro.setCantidad(rs.getInt("cantidad"));
            }
        } catch (Exception e) {
            System.out.println("ERROR EN GETBY ID  ");
            throw e;
        } finally {
            System.out.println("SE DESCONECTO DE GETBYID");
            this.desconectar();
        }
        return pro;
    }

    @Override
    public List<Producto> getAll() throws Exception {
        List<Producto> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM productos";
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            lista = new ArrayList<Producto>();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getInt("id"));
                p.setNombre(rs.getString("nombre"));
                p.setDescripcion(rs.getString("descripcion"));
                p.setCategoria(rs.getInt("categoria"));
                p.setSubCategoria(rs.getInt("subCategoria"));
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

    @Override
    public List<Categoria> getAllcat() throws Exception {
        List<Categoria> lista = null;
        try {
            this.conectar();
            String sql = "select * from categoria";
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Categoria>();
            while (rs.next()) {
                Categoria c = new Categoria();
                c.setId_cat(rs.getInt("id_cat"));
                c.setDescripcion(rs.getString("descripcion"));

                lista.add(c);
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

    @Override
    public List<SubCategoria> getAllByIdCat() throws Exception {
        List<SubCategoria> lista = null;
        try {
            this.conectar();
            String sql = "SELECT * FROM subcategoria";
            PreparedStatement ps = this.conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<SubCategoria>();
            while (rs.next()) {
                SubCategoria c = new SubCategoria();
                c.setId(rs.getInt("id"));
                c.setId_cat(rs.getInt("id_cat"));
                c.setDescripcion(rs.getString("descripcion"));

                lista.add(c);
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
