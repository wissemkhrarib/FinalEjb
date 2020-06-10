package tn.enis.service;

import java.util.List;

import javax.ejb.*;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

import tn.enis.dao.ClientDao;
import tn.enis.dao.CompteDao;
import tn.enis.entities.Client;
import tn.enis.entities.Compte;

@Stateless
@LocalBean
@Path("/clients/")
public class ClientService {

	@EJB
	private ClientDao dao;
	@EJB
	private CompteDao compteDao;
	
	@GET
	@Path("comptes-by-id/{id}")
	@Produces({"application/json"})
	public List<Compte> getComptesById(@PathParam("id")int id){
	Client client = dao.getById(id);
	return compteDao.getComptesByClient(client);
	}
	
	public void save(Client client) {
		dao.save(client);
	}
	public Client getById(int id) {
		return dao.getById(id);
	}
	public void delete(int id) {
		Client client=getById(id);
		dao.delete(client);
	}
	public void update(Client client) {
		dao.update(client);
	}
	public List<Client> getAll(){
		return dao.getAll();
	}
	
}
