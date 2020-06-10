<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="tn.enis.entities.Compte"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit compte</title>
<link rel="stylesheet" href="css/bootstrap.min.css"> 

</head>
<body>
<% Compte compte= (Compte) request.getAttribute("compte");
%>
 <div class="container">
 	<nav class="nav bg-primary justify-content-center m-2 rounded">
	 	 	<a class="nav-link text-light" href="CompteServlet">Home</a>
	 		<a class="nav-link text-light" href="CompteServlet">Comptes</a>
	 		<a class="nav-link text-light" href="ClientServlet">Clients</a>	
	 </nav>
	 <div class="row justify-content-center">
	 	<div class="card col-lg-7">
	 		<div class="card-body">
	 			 <h1 class="card-title">Edit d'un compte rib : <%= compte.getRib()%> </h1>
	 			
	 			<form action="CompteServlet" action="POST">
 
				<input type="hidden" name="rib" value="<%= compte.getRib()%>"/>
 				<input type="hidden" name="id" value="<%= compte.getClient().getId()%>"/>
 				
 				<div class="form-group">
 					<label>Solde:</label>
 					<input class="form-control" type="text" name="solde" value="<%= compte.getSolde()%>"/></td>
 				</div>
 				<button class="btn btn-block btn-success" type="submit" name="update">modifier</button></td>
	 			</form>
	 		</div>
	 	</div>
	 </div>
  	
 </div>
 <script src="js/jquery-3.5.1.min.js" ></script>
<script src="js/popper.min.js" ></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/comptes.js"></script>
<script src="js/sweetalert.min.js"></script>
</body>
</html>