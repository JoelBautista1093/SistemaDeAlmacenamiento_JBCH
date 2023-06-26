package com.emergentes.dao;

import com.emergentes.modelo.Cliente;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ClienteDAOimpl extends ConexionDB implements ClienteDAO {

    @Override
    public void insert(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("INSERT INTO clientes (nombre,apellido,ci,correo,celular) values (?,?,?,?,?)");
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setString(3, cliente.getCi());
            ps.setString(4, cliente.getCorreo());
            ps.setString(5, cliente.getCelular());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Error en insertar :(" + e.getMessage());
        } finally {
            this.desconectar();
        }

    }

    @Override
    public void update(Cliente cliente) throws Exception {
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("UPDATE clientes  SET nombre = ? , apellido = ? , ci = ? , correo = ? , celular = ? where id = ?");
            ps.setString(1, cliente.getNombre());
            ps.setString(2, cliente.getApellido());
            ps.setString(3, cliente.getCi());
            ps.setString(4, cliente.getCorreo());
            ps.setString(5, cliente.getCelular());
            ps.setInt(4, cliente.getId());
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
            PreparedStatement ps = this.conn.prepareStatement("DELETE FROM clientes WHERE id = ?");
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.desconectar();
        }
    }

    @Override
    public Cliente getById(int id) throws Exception {
        Cliente cli = new Cliente();
        try {
            this.conectar();
            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM clientes WHERE id = ?");
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cli.setId(rs.getInt("id"));
                cli.setNombre(rs.getString("nombre"));
                cli.setCorreo(rs.getString("apellido"));
                cli.setCelular(rs.getString("ci"));
                cli.setCelular(rs.getString("correo"));
                cli.setCelular(rs.getString("celular"));
            }
        } catch (Exception e) {
            System.out.println("Error en el getByID :( "+ e.getMessage());
        } finally {
            this.desconectar();
        }
        return cli;
    }

    @Override
    public List<Cliente> getAll() throws Exception {
        List<Cliente> lista = null;
        try {
            this.conectar();

            PreparedStatement ps = this.conn.prepareStatement("SELECT * FROM clientes");
            ResultSet rs = ps.executeQuery();

            lista = new ArrayList<Cliente>();

            while (rs.next()) {
                Cliente cli = new Cliente();

                cli.setId(rs.getInt("id"));
                cli.setNombre(rs.getString("nombre"));
                cli.setApellido(rs.getString("apellido"));
                cli.setCi(rs.getString("ci"));
                cli.setCorreo(rs.getString("correo"));
                cli.setCelular(rs.getString("celular"));

                lista.add(cli);
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
