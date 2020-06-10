<%@page import="tn.enis.entities.Client"%>
<%@page import="tn.enis.entities.Compte"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="tn.enis.dao.CompteDao" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>gestion de compte</title>
<link rel="stylesheet" href="css/bootstrap.min.css"> 
<link
 rel="stylesheet"
 href="http://code.jquery.com/ui/1.9.0/themes/smoothness/jquery-ui.css" />
</head>
<body>
 <%
 List<Client> clients= (List<Client>) session.getAttribute("clients");%>

 <div class="container">
	 <nav class="nav bg-primary justify-content-center m-2 rounded">
	 	 	<a class="nav-link text-light" href="#">Home</a>
	 		<a class="nav-link text-light" href="CompteServlet">Comptes</a>
	 		<a class="nav-link text-light" href="ClientServlet">Clients</a>	
	 </nav>
	<div class="row justify-content-center">
		<div class="card col-lg-7">
			<div class="card-body">
				 <h1 class="card-title text-center">Ajout d'un compte</h1>
				 <form action="CompteServlet" action="POST">
				 	<div class="form-group">
				 		<label>Solde:</label>
				 		<input type="text" name="solde" class="form-control"/>
				 	</div>
				 					 	<div class="form-group">
				 		<label>Client:</label>
				 		<input id="clientInput" type="text" class="form-control"/>
				 		<input id="clientInputHidden" type="hidden" name="id"/>
	
				 	</div>
				 	<input class="btn btn-block btn-primary" type="submit" name="add" value="ajouter" />
				</form>
			</div>
		</div>
	</div>
 	
 	<br/>
 	<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>rib</th>
            <th>client</th>
            <th>solde</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>
 	<% List<Compte> comptes= (List<Compte>) session.getAttribute("comptes");
    	if(comptes!=null && !comptes.isEmpty()){
    		int index=0;
    		for(Compte c:comptes){
    			index++;
    			
    		    %>
    		        <tr id="<%=c.getRib() %>">
    		        	<td><%=index %></td>
    		            <td><%=c.getRib()%></td>
    		            <td><%=c.getClient().getNom()%> <%=c.getClient().getPrenom()%></td>
    		            <td><%=c.getSolde()%></td> 
    		            <td><a class="btn btn-danger" href="javascript:deleteCompte(<%=c.getRib()%>);">supprimer</a></td>
    		            <td><form action="CompteServlet" method="POST">
    		            	<input type="hidden" name="rib" value="<%=c.getRib() %>">
    		            	<button class="btn btn-success" name="edit">modifier</button>
    		            </form></td>
    		        </tr>
    		        <%} }%>
   	</tbody>
   	</table>
 </div>
 <script src="js/jquery-3.5.1.min.js" ></script>
<script src="js/popper.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/deletefunction.js"></script>
<script src="js/sweetalert.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
var availableTags = [
	 <%  if(clients!=null && !clients.isEmpty()){
  		for(Client client:clients){
  		    %>
		      {"label":"<%=client.getNom()%> <%=client.getPrenom()%>", "id": <%=client.getId()%>},
				    		        <%} }%>
  ];
  console.log(5);
  $( "#clientInput" ).autocomplete({
    source: availableTags,
    select: function (event, ui) { $("#clientInput").val(ui.item.label);
    $("#clientInputHidden").val(ui.item.id);
    }
  });
    
} );
</script>
</body>
</html>