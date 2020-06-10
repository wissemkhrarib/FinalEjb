package tn.enis.dao;

import java.util.List;
import tn.enis.entities.*;

import javax.ejb.LocalBean;
import javax.ejb.Singleton;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import tn.enis.entities.Compte;

/**
 * Session Bean implementation class CompteDao
 */
@Singleton
@LocalBean
public class CompteDao {
	
	 @PersistenceContext
	private EntityManager em;
    /**
     * Default constructor. 
     */
    public CompteDao() {
        // TODO Auto-generated constructor stub
    }
    public void save(Compte compte) {
    	em.persist(compte);
    }
    public void delete(Compte compte) {
    	em.remove(compte);
    }
    public Compte getById(Long rib) {
    	return em.find(Compte.class, rib);
    }
    public void update(Compte compte) {
    	em.merge(compte);
    }
    public List<Compte> getAll(){
    	//EJB-QL= H-QL=JPA-QL SQOOP
    	return em.createQuery("SELECT cp FROM Compte cp",Compte.class).getResultList();
    	
    }
    public List<Compte> getComptesByClient(Client client){
    	TypedQuery<Compte> query= em.createQuery("SELECT cp FROM Compte cp WHERE cp.client = :clt",Compte.class);
    	query.setParameter("clt", client);
    	return query.getResultList();
    }

}
