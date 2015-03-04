<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
 <link href="<c:url value="resources/bootstrap/bootstrap-fileupload/bootstrap-fileupload.css" />" rel="stylesheet">
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

 $(function(){
	$("#userDetailsSubmitForm").submit(function(event){
		event.preventDefault();
		
		var formData = new FormData($('#userDetailsSubmitForm')[0]);
	    
	    $.ajax({
	        url: $('#userDetailsSubmitForm').attr("action"),
	        type: 'POST',
	        enctype: 'multipart/form-data',
	        data: formData,
	        async: false,
	        success: function (result) {
	        	
	        	$(".dashboard-wrapper").html(result);
	        	
	        	
	        },complete: function() {
	        	
	        	$("#message").text("User Details Saved Successfully!");
	        	$("#message").show();
	        	
	        },
	        cache: false,
	        contentType: false,
	        processData: false
	    });
	    return false;
	});
});  


       
        
</script>
<div class="container-fluid">
	
		<div class="left-sidebar">
			<div class="alert alert-success animated fadeInUp" align="center" id="message" style="float: left; width: auto; margin-left:35%; display: none;position: absolute;"></div>
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
								<form:form id="userDetailsSubmitForm" modelAttribute="userDetails"   action="${pageContext.request.contextPath}/user/saveUserDetails" method="POST" enctype="multipart/form-data" class="form-horizontal">
								<div class="span10">
										
																			
											<h5> Personal Information </h5>
											<hr>
											<div class="control-group">
											<div class="span10">
											
												<div class="span6">
												<form:hidden path="user_id" id="id"/>
													<label class="control-label"><spring:message code="label.usrDetails.firstName"></spring:message></label>
													<div class="controls controls-row span4">
													<form:input path="firstName"  placeholder="First Name" />
													</div>
												</div>
												<div class="span6">
													<label class="control-label"><spring:message code="label.usrDetails.lastName"></spring:message></label>
													<div class="controls controls-row span4">
													<form:input path="lastName"  placeholder="Last Name" />
													</div>
												</div>
											</div>
											</div>
											
											
											<div class="control-group">
											<div class="span10">
												<div class="span6">
													<label class="control-label"><spring:message code="label.usrDetails.gender"></spring:message></label>
													<div class="controls controls-row span4">
														 <form:radiobutton path="gender" value="M"	required="required" />Male
														 <form:radiobutton path="gender" value="F"	required="required" />Female
													</div>
												</div>
												<div class="span6">
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
											
											
											
											<div class="control-group">
											<div class="span10">
												<div class="span6">
													<label class="control-label"><spring:message code="label.usrDetails.address"></spring:message></label>
													<div class="controls controls-row span4">
													
													<form:textarea path="address" rows="5" cols="30" />
													</div>
												</div>
												<div class="span6">
														<label class="control-label"><spring:message
																code="label.usrDetails.occupation"></spring:message></label>
														<div class="controls controls-row span5">

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
										<form:button id="saveBtn" class="btn btn-primary" type="submit">
											<spring:message code="label.form.submit"></spring:message>
										</form:button>
										<a class="btn btn-primary"><spring:message	code="label.form.cancel"></spring:message></a>
									</div>
											
										
									</div>
										<div class="span2">
											<div class="fileupload fileupload-new" data-provides="fileupload">
                                                  <div class="fileupload-new thumbnail" style="width: 150px; height: 150px;">
                                                      <img src="http://www.placehold.it/150x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" />
                                                  </div>
                                                  <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;"></div>
                                                  <div>
                                                   <span class="btn btn-white btn-file">
                                                   <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select image</span>
                                                   <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                                   <form:input type="file" class="default" path="image" id="image" />
                                                   </span>
                                                      <a href="#" class="btn btn-danger fileupload-exists" data-dismiss="fileupload"><i class="fa fa-trash"></i> Remove</a>
                                                  </div>
                                              </div>
										
										
									</div>
								</form:form>	
							</div>
						</div>
					</div>


				</div>
			</div>
		
	</div>
</div>