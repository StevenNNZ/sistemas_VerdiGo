package pruebas;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class TestConexion {
    public static void main(String[] args) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("sistema_verdigo");
        EntityManager em = emf.createEntityManager();
        System.out.println("Conectado correctamente");
        em.close();
        emf.close();
    }
}
