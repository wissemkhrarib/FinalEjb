<%@page import="java.util.List"%>
<%@page import="tn.enis.entities.Compte"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="tn.enis.entities.Client"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit client</title>
<link rel="stylesheet" href="css/bootstrap.min.css"> 

</head>
<body>
<div class="container">
	<nav class="nav bg-primary justify-content-center m-2 rounded">
	 	 	<a class="nav-link text-light" href="CompteServlet">Home</a>
	 		<a class="nav-link text-light" href="CompteServlet">Comptes</a>
	 		<a class="nav-link text-light" href="ClientServlet">Clients</a>	
	 </nav>
	<div class="row justify-content-center m-3">
		<div class="card col-lg-7">
			<div class="card-body">
			<% Client client= (Client) request.getAttribute("client");%>
				<h1 class="card-title"><%= client.getNom()%> <%= client.getPrenom()%> </h1>	
				 <form action="ClientServlet" action="POST">
					<input type="hidden" name="id" value="<%= client.getId()%>"/>
				 	<div class="form-group">
				 		<label>adresse :</label>
				 		<input class="form-control" type="text" name="adresse" value="<%= client.getAdresse()%>"/>
				 	</div>		
				 	<input class="btn btn-block btn-success" type="submit" name="update" value="update" />
				 </form>
			</div>
		</div>
	</div>
 	<h2>Liste de compte de client <%= client.getNom()%> <%= client.getPrenom()%> </h2>
 	<table class="table">
    <thead>
        <tr>
            <th>ID</th>
            <th>rib</th>
            <th>solde</th>
            <th>Delete</th>
            <th>Edit</th>
        </tr>
    </thead>
    <tbody>
 	<% List<Compte> comptes=(List<Compte>)request.getAttribute("comptesClient");
    	if(comptes!=null && !comptes.isEmpty()){
    		int index=0;
    		for(Compte c:comptes){
    			index++;
    			
    		    %>
    		        <tr id="<%=c.getRib() %>">
    		        	<td><%=index %></td>
    		            <td><%=c.getRib()%></td>
    		            <td><%=c.getSolde()%></td> 
    		            <td><a class="btn btn-danger" href="javascript:deleteCompte(<%=c.getRib()%>);">Delete</a></td>
    		            <td><form action="ClientServlet" method="POST">
    		            	<input type="hidden" name="rib" value="<%=c.getRib() %>">
    		            	<button class="btn btn-success" name="edit">modifier</button>
    		            </form></td>
    		        </tr>
    		        <%} }%>
   	</tbody>
   	</table>
</form>
	
</div>
<script src="js/jquery-3.5.1.min.js" ></script>
<script src="js/popper.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/comptes.js"></script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>