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
import tn.enis.service.CompteService;

/**
 * Servlet implementation class CompteServlet
 */
@WebServlet("/CompteServlet")
public class CompteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@EJB
	private CompteService service;
    @EJB
    private ClientService clientService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompteServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("add")!=null) {
			int id=Integer.parseInt(request.getParameter("id"));
			float solde=Float.parseFloat(request.getParameter("solde"));
			Client client=clientService.getById(id);
			Compte compte=new Compte(client,solde);////////////////
			service.save(compte);
		}
		else if(request.getParameter("delete")!=null) {
			Long rib=Long.valueOf(request.getParameter("rib"));
			service.delete(rib);
			return;
		}
		else if( request.getParameter("edit")!=null) {
			Long rib=Long.valueOf(request.getParameter("rib"));
			Compte compte=service.getById(rib);
			request.setAttribute("compte", compte);
			RequestDispatcher rd=request.getRequestDispatcher("edit-compte.jsp");
			rd.forward(request, response);
			return;
		}
		else if(request.getParameter("update")!=null) {
			Long rib=Long.valueOf(request.getParameter("rib"));
			float solde=Float.parseFloat(request.getParameter("solde"));
			int id=Integer.parseInt(request.getParameter("id"));
			Client client=clientService.getById(id);
			Compte compte=new Compte(rib,client,solde);//  //
			service.update(compte);
		}
		
        HttpSession session = request.getSession();

		List<Client> clients=clientService.getAll();
		session.setAttribute("clients", clients);
		List<Compte> comptes=service.getAll();
		session.setAttribute("comptes", comptes);

		response.sendRedirect(request.getContextPath() + "/comptes.jsp");


		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
