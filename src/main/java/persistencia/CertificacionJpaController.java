/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.Certificacion;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author estiv
 */
public class CertificacionJpaController implements Serializable {

    public CertificacionJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    
    public CertificacionJpaController() {
        emf=Persistence.createEntityManagerFactory("sistema_verdigo");
    }
    
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Certificacion certificacion) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(certificacion);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Certificacion certificacion) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            certificacion = em.merge(certificacion);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = certificacion.getId();
                if (findCertificacion(id) == null) {
                    throw new NonexistentEntityException("The certificacion with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Certificacion certificacion;
            try {
                certificacion = em.getReference(Certificacion.class, id);
                certificacion.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The certificacion with id " + id + " no longer exists.", enfe);
            }
            em.remove(certificacion);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Certificacion> findCertificacionEntities() {
        return findCertificacionEntities(true, -1, -1);
    }

    public List<Certificacion> findCertificacionEntities(int maxResults, int firstResult) {
        return findCertificacionEntities(false, maxResults, firstResult);
    }

    private List<Certificacion> findCertificacionEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Certificacion.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Certificacion findCertificacion(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Certificacion.class, id);
        } finally {
            em.close();
        }
    }

    public int getCertificacionCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Certificacion> rt = cq.from(Certificacion.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
