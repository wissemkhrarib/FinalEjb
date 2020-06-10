package tn.enis.dao;

import java.util.List;

import javax.ejb.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import tn.enis.entities.Client;
import tn.enis.entities.Compte;

@Singleton
@LocalBean
public class ClientDao {
	
	@PersistenceContext
	private EntityManager em;
	
	public ClientDao() {
		
	}
	public void save(Client client) {
		em.persist(client);
	}
	public Client getById(int id) {
		return em.find(Client.class,id);
	}
	public void delete(Client client) {
		em.remove(client);
	}
	public void update(Client client) {
		em.merge(client);
	}
	public List<Client> getAll(){
    	//EJB-QL= H-QL=JPA-QL SQOOP
    	return em.createQuery("SELECT cl FROM Client cl",Client.class).getResultList();
    	
    }
}
