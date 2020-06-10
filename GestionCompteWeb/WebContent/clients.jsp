<%@page import="tn.enis.entities.Client"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>gestion de client</title>
<link rel="stylesheet" href="css/bootstrap.min.css"> 
</head>
<body>
 <div class="container">
 	<nav class="nav bg-primary justify-content-center m-2 rounded">
 	 	<a class="nav-link text-light" href="CompteServlet">Home</a>
 		<a class="nav-link text-light" href="CompteServlet">Comptes</a>
 		<a class="nav-link text-light" href="ClientServlet">Clients</a>	
 	</nav>
  <div class="row justify-content-center">
  	<div class="card col-lg-7">
	 <div class="card-body">
	 	<h1 class="card-title text-center">Ajout d'un client</h1>
	 	<form action="ClientServlet" action="POST">
	 		<div class="form-group">
	 			<label>Nom:</label>
	 			<input type="text" name="nom" class="form-control"/>
	 		</div>
	 		<div class="form-group">
	 			<label>Prenom:</label>
	 			<input type="text" name="prenom" class="form-control"/></td>
	 		</div>
	 		<div class="form-group">
	 			<label>Adresse:</label>
	 			<input type="text" name="adresse" class="form-control"/></td>
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
            <th>Nom</th>
            <th>Prenom</th>
            <th>Adresse</th>
            <th>Supprimer</th>
            <th>modifier</th>
        </tr>
    </thead>
    <tbody>
 	<% List<Client> clients= (List<Client>) session.getAttribute("clients");
    	if(clients!=null && !clients.isEmpty()){
    		for(Client c:clients){
    			
    		    %>
    		        <tr id="<%=c.getId() %>">
    		            <td><%=c.getId()%></td>
    		            <td><%=c.getNom()%></td>
    		            <td><%=c.getPrenom()%></td>
    		            <td><%=c.getAdresse()%></td> 
    		            <td><a class="btn btn-danger" href="javascript:deleteClient(<%=c.getId()%>);">supprimer</a></td>
    		            <td><form action="ClientServlet" method="POST">
    		            	<input type="hidden" name="id" value="<%=c.getId() %>">
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
</body>
</html>