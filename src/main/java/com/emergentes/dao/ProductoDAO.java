
package com.emergentes.dao;

import com.emergentes.modelo.Categoria;
import com.emergentes.modelo.Producto;
import com.emergentes.modelo.SubCategoria;
import java.util.List;

public interface ProductoDAO {
    public void insert(Producto producto) throws Exception;
    public void update(Producto producto) throws Exception;
    public void delete(int id) throws Exception;
    public Producto getById(int id) throws Exception;
    public List<Producto> getAll() throws Exception;
    public List<Categoria> getAllcat() throws Exception;
    public List<SubCategoria> getAllByIdCat() throws Exception;
}
