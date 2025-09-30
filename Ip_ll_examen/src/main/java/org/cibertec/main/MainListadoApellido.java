package org.cibertec.main;

import jakarta.persistence.*;
import org.cibertec.entidades.*;
import java.util.List;

public class MainListadoApellido {

    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("miUnidad");
        EntityManager em = emf.createEntityManager();

        try {
            System.out.println("=== LISTADO DE INVENTARIOS ===");
            List<Inventario> lista = em.createQuery("SELECT i FROM Inventario i", Inventario.class).getResultList();

            for (Inventario i : lista) {
                System.out.println("Nro: " + i.getNro_inventario() +
                                   " | Fecha: " + i.getFecha() +
                                   " | Producto: " + i.getProducto().getNom_prod() +
                                   " | Categoria: " + i.getProducto().getCategoria().getDescripcion() +
                                   " | Costo: " + i.getCosto_ingreso());
            }
        } finally {
            em.close();
            emf.close();
        }
    }
}
