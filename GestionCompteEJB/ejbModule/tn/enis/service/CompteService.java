package tn.enis.service;

import java.util.List;

import javax.ejb.EJB;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;

import tn.enis.dao.CompteDao;
import tn.enis.entities.Compte;

/**
 * Session Bean implementation class CompteService
 */
@Stateless
@LocalBean
public class CompteService {
	
	@EJB
	CompteDao dao;
    /**
     * Default constructor. 
     */
    public void save(Compte compte) {
    	dao.save(compte);
    }
    public void delete(Long rib) {
    	Compte compte=getById(rib);
    	dao.delete(compte);
    }
    public Compte getById(Long rib) {
    	return dao.getById(rib);
    }
    public void update(Compte compte) {
    	dao.update(compte); 
    }
    public List<Compte> getAll(){
    	//EJB-QL= H-QL=JPA-QL SQOOP
    	return dao.getAll();
    	
    }

}
