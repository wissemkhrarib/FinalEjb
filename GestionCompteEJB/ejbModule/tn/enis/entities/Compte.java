package tn.enis.entities;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="T_COMPTE")
public class Compte implements Serializable {
	
	private static final long serialVersionUID = 1L;
	public Compte(Client client, float solde) {
		super();
		this.rib = rib;
		this.client = client;
		this.solde = solde;
	}
	public Compte(Long rib,Client client, float solde) {
		super();
		this.rib = rib;
		this.client = client;
		this.solde = solde;
	}
	
	 public Compte() {
			super();
		}
		
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long rib;
	
	//BY DEFAULT fetch EAGER
	@ManyToOne
	private Client client;
	private float solde;
	public Long getRib() {
		return rib;
	}
	public void setRib(Long rib) {
		this.rib = rib;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public float getSolde() {
		return solde;
	}
	public void setSolde(float solde) {
		this.solde = solde;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((rib == null) ? 0 : rib.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}
		if (obj == null) {
			return false;
		}
		if (getClass() != obj.getClass()) {
			return false;
		}
		Compte other = (Compte) obj;
		if (rib == null) {
			if (other.rib != null) {
				return false;
			}
		} else if (!rib.equals(other.rib)) {
			return false;
		}
		return true;
	}
	
}
