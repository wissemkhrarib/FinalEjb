package tn.enis.controller;

import java.io.IOException;
import java.util.List;

import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tn.enis.entities.Client;
import tn.enis.entities.Compte;
import tn.enis.service.ClientService;

/**
 * Servlet implementation class ClientServlet
 */
@WebServlet("/ClientServlet")
public class ClientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @EJB
    private ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session= request.getSession();
		if(request.getParameter("add")!=null) {
			String nom=request.getParameter("nom");
			String prenom=request.getParameter("prenom");
			String adr=request.getParameter("adresse");
			Client client=new Client(nom,prenom,adr);////////////////
			clientService.save(client);
		}
		else if(request.getParameter("delete")!=null) {
			int id=Integer.parseInt((request.getParameter("id")));
			clientService.delete(id);
			return;
		}
		else if( request.getParameter("edit")!=null) {
			int id=Integer.parseInt((request.getParameter("id")));
			Client client=clientService.getById(id);
			request.setAttribute("client", client);
			List<Compte> comptes=clientService.getComptesById(id);
			request.setAttribute("comptesClient", comptes);

			RequestDispatcher rd=request.getRequestDispatcher("edit-client.jsp");
			rd.forward(request, response);
			return;
		}
		else if(request.getParameter("update")!=null) {
			int id=Integer.parseInt((request.getParameter("id")));
			String adr=request.getParameter("adresse");
			Client client=clientService.getById(id);
			client.setAdresse(adr);
			clientService.update(client);
		}
		List<Client> clients=clientService.getAll();
		session.setAttribute("clients", clients);
		response.sendRedirect(request.getContextPath() + "/clients.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
