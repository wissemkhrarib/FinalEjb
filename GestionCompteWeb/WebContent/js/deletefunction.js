function deleteCompte(rib){
	swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this compte!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			  $.ajax({
					url : "CompteServlet",
					type : "POST",
					data : {
					'rib' : rib, 'delete' : 'delete'
					},
					success : function() {
					$( "#"+rib ).remove();
					swal("Poof! Your Compte has been deleted!", {
					icon: "success",
					});
					}
					});
		  } else {
		    swal("Your compte is safe!");
		  }
		});
	
}

function deleteClient(id){
	swal({
		  title: "Are you sure?",
		  text: "Once deleted, you will not be able to recover this client!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
				$.ajax({
					url : "ClientServlet",
					type : "POST",
					data : {
					'id' : id, 'delete' : 'delete'
					},
					success : function() {
					$( "#"+id ).remove();
					swal("Poof! Your Client has been deleted!", {
					icon: "success",
					});
					}
					});
		  } else {
		    swal("Your client is safe!");
		  }
		});
}