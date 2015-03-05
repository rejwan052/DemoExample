
function adminPage() {
	var ajaxURL = "admin.html";
	
	$("#myTab li a").removeClass("selected");
	$('#myTab li a').eq(2).addClass('selected');
	
	$.ajax({
		beforeSend : function() {
			$('.dashboard-wrapper').html('<div class="loading">&nbsp;</div>');
		},
		url : ajaxURL,
		success : function(result) {
			$('#subnavId ul').hide();
			$('#subnavId ul').eq(2).show();
			$(this).addClass('selected');
			$(".dashboard-wrapper").html(result);
		}

	});
}

function homePage() {
	var ajaxURL = "homepage.html";
	
	$.ajax({
		beforeSend : function() {
			$('.dashboard-wrapper').html('<div class="loading">&nbsp;</div>');
		},
		url : ajaxURL,
		success : function(result) {
			window.location.reload();
		}

	});
}
  
function userDetailsAddPage() {

	var ajaxURL="user/saveUserDetails";
	
	$("#myTab li a").removeClass("selected");
	$('#myTab li a').eq(1).addClass('selected');
	
	
	$.ajax({
		beforeSend : function() {
			$('.dashboard-wrapper').html('<div class="loading">&nbsp;</div>');
		},
		url : ajaxURL,
		success : function(result) {
			$('#subnavId ul').hide();
			$('#subnavId ul').eq(1).show();
			$(this).addClass('selected');
			$(".dashboard-wrapper").html(result);
		}

	});
};
/*
function ancorClicked(){
	$('ul li a').click(function() {
	    $('ul li a.selected').removeClass('selected');
	    $(this).closest('li a').addClass('selected');
	});
}*/

function viewUserDetailsPage(){
	
/*	alert("Called");*/
	$("#loader_cont").hide();
	var ajaxURL="user/viewUserDetails";
	$('#userdetailsTab li a').removeClass('selected');
	$(this).find('a').addClass('selected');
	$.ajax({
		beforeSend : function() {
    		/*alert("beforeSend");*/
    		$("#loader_cont").show();
    		/*$("#loader_cont").fadeIn("slow");*/
		},
		url : ajaxURL,
		success : function(result) {
			
			$('#subnavId ul').eq(1).show();
			$(".dashboard-wrapper").html(result);
			$("#loader_cont").hide();
		},complete: function() {
			$("#loader_cont").hide();
        	/*alert("Complete");*/
        	/*$("#loader_cont").fadeOut();*/
        	
        }

	});
}

/*function deleteUserDetailsById(id){
	//alert(id);
	var ajaxUrl='user/deleteUserDetails/';
	
	$.ajax({
		url: ajaxUrl+id,
        type: "DELETE",
        dataType: 'json',
        async: true,
        beforeSend: function(xhr) {
            xhr.setRequestHeader("Accept", "application/json");
            xhr.setRequestHeader("Content-Type", "application/json");
        },
		success : function(userDetails) {
			//$("#mainDiv").html(result);
			var respContent = "";
			var rowToDelete = url.closest("tr");
			respContent += "<span class='success'>User Details was deleted: [";
            respContent += userDetails.firstName + " : ";
            respContent += userDetails.lastName + "]</span>";
            alert(respContent);
            $("#message").html(respContent);   
		},
		complete: function() {
			//userDetailsPage(); 
	    }
	});
}*/


/*$(document).ready(function() {
	
	var deleteLink = $("a:contains('Delete')");
  
	$(deleteLink).click(function(event) {
	  
		$.ajax({
			url: $(event.target).attr("href"),
		  	type: "DELETE",
		  	beforeSend: function(xhr) {
		  		xhr.setRequestHeader("Accept", "application/json");
		  		xhr.setRequestHeader("Content-Type", "application/json");
		  	},		  	
		  	success: function(userDetails) {
		  		$("#message").attr("class", "alert alert-danger");
		  		$('#message').css('display','block');
		  		var respContent = "";
		  		var rowToDelete = $(event.target).closest("tr");
		  		
		  		rowToDelete.remove();
		  		
		  		respContent += "<span class='success'>User Details was deleted: [";
	            respContent += userDetails.firstName + " ";
	            respContent += userDetails.lastName + "]</span>";
	            alert(respContent);
	            $("#message").html(respContent);   		
		  	}
		});

		event.preventDefault();
	});
   
}); */ 

