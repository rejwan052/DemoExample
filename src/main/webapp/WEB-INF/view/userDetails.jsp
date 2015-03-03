<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%-- <!-- Page-Controller -->
	<script src="<c:url value="resources/jquery/MediatorController.js"/>" type="text/javascript"></script> --%>
<style>
.animated {
		-webkit-animation-duration: 1s;
		animation-duration: 1s;
		-webkit-animation-fill-mode: both;
		animation-fill-mode: both;
	}
	
	@-webkit-keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    transform: translateY(0);
  }
}

@keyframes fadeInUp {
  0% {
    opacity: 0;
    -webkit-transform: translateY(20px);
    -ms-transform: translateY(20px);
    transform: translateY(20px);
  }

  100% {
    opacity: 1;
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
}

.fadeInUp {
  -webkit-animation-name: fadeInUp;
  animation-name: fadeInUp;
}
</style>
<script>
/* $(function(){
	$( "#userDetailsSubmitForm").submit(function( event ) {
	
	   event.preventDefault();
	   //alert("Called");
       var form=$("#userDetailsSubmitForm").serialize();
       $.ajax({
       	async:false,
			type: 'POST',
			data:form,	
		    url: "user/saveUserDetails",
			success: function(data){						
				$("#mainDiv").html(data);
				//alert("Success");
			}
			
		  });
	});
}); */

$(document).ready(function() {
	   
	  $('#userDetailsSubmitForm').submit(function(event) {
		//var form=$("#userDetailsSubmitForm").serialize();
		//var prefix = '/DemoExample';
		 var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var gender = $('input:radio[name=gender]:checked').val();
        var country = $('#country').val();
        var address = $('#address').val(); 
        var occupation= $('input:radio[name=occupation]:checked').val();
        
        var json = {"firstName" : firstName, "lastName" : lastName, "gender": gender,"country" : country, "address" : address, "occupation": occupation};
	    $.ajax({
	        url: $("#userDetailsSubmitForm").attr("action"),
	        data: JSON.stringify(json),
	        type: "POST",
	        async: false,    //Cross-domain requests and dataType: "jsonp" requests do not support synchronous operation
            cache: false,
	        beforeSend: function(xhr) {
	            xhr.setRequestHeader("Accept", "application/json");
	            xhr.setRequestHeader("Content-Type", "application/json");
	        },
	        success: function(userDetails) {
	        	//alert(url);
	            var respContent = "";
	            $("#message").attr("class", "alert alert-success animated fadeInUp");
	            $('#message').css('display','block');
	            respContent += "<span class='success'>User Details Saved</span>";
	             
	            $("#message").html(respContent);        
	        },
			complete : function(userDetails) {
				/* $(".dashboard-wrapper").html(result); 
				userDetailsPage();*/
			}
	    });
	      
	    event.preventDefault();
	  });
	    
	});

</script>
<!-- <script>
 $(document).ready(function(){
	 
    $( "#dataTables-example" ).on( "click",".edit_userDetails_row", function() {
    	
		var row_val = $( this ).attr('row_val');
		var arr = row_val.split('_');
		
		$('#id').val(arr[0]);
		
		$('#firstName').val(arr[1]);
		
		$('#lastName').val(arr[2]);
		
		if(arr[3].trim()=='M'){
			$("#gender1").prop('checked', true);
			
			}
			
			if(arr[3].trim()=='F'){
			$("#gender2").prop('checked', true);
			
			}

		$('#country').val(arr[4].trim());	
		$('#address').val(arr[5]);
		
		if(arr[6].trim()=='P'){
			$("#occupation1").prop('checked', true);
			
		}
			
		if(arr[6].trim()=='E'){
			$("#occupation2").prop('checked', true);
			
		}
			
		if(arr[6].trim()=='D'){
			$("#occupation3").prop('checked', true);
				
		}
				
		if(arr[6].trim()=='O'){
			$("#occupation4").prop('checked', true);
				
		}

		/* $('#saveBtn').val('Update'); */
		$('#saveBtn').text("Update");

	});
 });
 </script> -->
<div class="container-fluid">
	
		<div class="left-sidebar">
			<div align="center" id="message" style="float: left; width: auto; margin-left:35%; display: none;position: absolute;"></div>
			<div class="span12">

				<div class="widget no-margin">
					<div class="widget-header">
						<div class="title">Enter Employee Details</div>
						<span class="tools"> <a class="fs1" data-icon=""
							aria-hidden="true" data-original-title=""></a>
						</span>
					</div>
					<div class="widget-body">
						<div class="container-fluid">
							<div class="row-fluid">
								<div class="span12">
									<form:form id="userDetailsSubmitForm"
										modelAttribute="userDetails"
										action="${pageContext.request.contextPath}/user/saveUserDetails.json"
										method="POST" class="form-horizontal">
										
										<div class="control-group">
											<div class="span10">

												<div class="span6">
													<form:hidden path="user_id" id="id" value="0" />
													
														<label class="control-label"><spring:message
																code="label.usrDetails.firstName"></spring:message></label>
														<div class="controls controls-row span4">
															<form:input path="firstName"  required="required"/>
														</div>
												</div>

												<div class="span6">
													
														<label class="control-label"><spring:message
																code="label.usrDetails.lastName"></spring:message></label>
														<div class="controls controls-row span4">
															<form:input path="lastName"  required="required"/>
														</div>

													
												</div>
											</div>
										</div> 

										<div class="control-group">
											<div class="span10">

												<div class="span6">
													
														<label class="control-label"><spring:message
																code="label.usrDetails.gender"></spring:message></label>
														<div class="controls controls-row span4">
															<form:radiobutton path="gender" value="M"
																required="required" />
															Male
															<form:radiobutton path="gender" value="F"
																required="required" />
															Female
														</div>

													
												</div>

												<div class="span6">
													<div class="form-group">
														<label class="control-label"><spring:message
																code="label.usrDetails.country"></spring:message></label>
														<div class="controls controls-row span4">
															<form:select path="country" id="country"
																required="required">
																<form:option value="" label="[Select One]" />
																<form:options items="${countryList}"
																	itemValue="countryId" itemLabel="countryName" />
															</form:select>
														</div>

													</div>
												</div>
											</div>
										</div>

										<div class="control-group">
											<div class="span10">

												<div class="span6">
													
														<label class="control-label"><spring:message
																code="label.usrDetails.address"></spring:message></label>
														<div class="controls controls-row span4">
															<form:textarea path="address" rows="5" cols="30"
																required="required" />
														</div>

													
												</div>

												<div class="span6">
													
														<label class="control-label"><spring:message
																code="label.usrDetails.occupation"></spring:message></label>
														<div class="controls controls-row span6">
															<form:radiobutton path="occupation" value="P"
																required="required" />
															Programmer
															<form:radiobutton path="occupation" value="E"
																required="required" />
															Engineer
															<form:radiobutton path="occupation" value="D"
																required="required" />
															Doctor<br>
															<form:radiobutton path="occupation" value="O"
																required="required" />
															Other
														</div>

													
												</div>

											</div>
										</div>


										<div class="form-actions">
											<button id="saveBtn" class="btn btn-primary" type="submit">
												<spring:message code="label.form.submit"></spring:message>
											</button>
											<a class="btn btn-primary"><spring:message
													code="label.form.cancel"></spring:message></a>
										</div>

									</form:form>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		
	</div>
</div>