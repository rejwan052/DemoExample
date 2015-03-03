<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title><spring:message code="label.form.title"></spring:message></title>
<script type="text/javascript"
	src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
	
</script>
<!-- CSS -->
<link href="<c:url value="/resources/icomoon/style.css"/>"
	rel="stylesheet">
<link href="<c:url value="/resources/css/mainB.css" />" rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="dashboard-wrapper">
			<div class="left-sidebar" style="margin-top: 3%;margin-left: 23%;">

				<div class="row-fluid">
					<div class="span12">
						<div class="widget" style="float: left;width: 75%;">
							<div class="widget-header">
								<div class="title">
									<spring:message
											code="label.form.title"></spring:message>
								</div>
								<span class="tools"> <a class="fs1" aria-hidden="true"
									data-icon="&#xe090;"></a>
								</span>
							</div>
							<div class="widget-body">
								<form:form id="registrationForm"
									class="form-horizontal no-margin" modelAttribute="user"
									method="POST" enctype="utf8">
									<div class="control-group">
										<label class="control-label span3" for="name"><spring:message
												code="label.user.firstName"></spring:message></label>
										<div class="controls controls-row span5">
											<form:input path="firstName" value=""
												placeholder="First Name" />
										</div>
										<div class="controls controls-row span4">
											<form:errors path="firstName" cssClass="alert alert-danger" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label span3" for="lastName"><spring:message
												code="label.user.lastName"></spring:message></label>
										<div class="controls controls-row span5">
											<form:input path="lastName" value="" placeholder="Last Name" />
										</div>
										<div class="controls controls-row span4">
											<form:errors path="lastName" cssClass="alert alert-danger" />
										</div>
									</div>


									<div class="control-group">
										<label class="control-label span3" for="email"><spring:message
												code="label.user.email"></spring:message></label>
										<div class="controls controls-row span5">
											<form:input path="email" value="" placeholder="Email" />
										</div>
										<div class="controls controls-row span4">
											<form:errors path="email" cssClass="alert alert-danger" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label span3" for="password"><spring:message
												code="label.user.password"></spring:message></label>
										<div class="controls controls-row span5">
											<form:input path="password" value="" type="password"
												class="form-control" />
										</div>
										<div class="controls controls-row span4">
											<form:errors path="password" cssClass="alert alert-danger" />
										</div>
									</div>

									<div class="control-group">
										<label class="control-label span3" for="matchingPassword"><spring:message
												code="label.user.confirmPass"></spring:message></label>
										<div class="controls controls-row span5">
											<form:input path="matchingPassword" value="" type="password"
												class="form-control" />
										</div>
										<div class="controls controls-row span4">
											<form:errors path="matchingPassword"
												cssClass="alert alert-danger" />
										</div>
									</div>


									<div class="form-actions no-margin">
										<button class="btn btn-info pull-middle" type="submit">
											<spring:message code="label.form.submit"></spring:message>
										</button>
										<a href="<c:url value="login.html" />" class="btn btn-primary"><spring:message
												code="label.form.loginLink"></spring:message></a>
										<div class="clearfix"></div>
									</div>
								</form:form>
							</div>


							<%-- <div class="panel panel-default">
				<div class="panel-heading ui-draggable-handle">
					<h3 class="panel-title"><spring:message code="label.form.title"></spring:message></h3>
			   </div>
			   	
			<div class="panel-body">  
					
					
						<div class="form-group">
							<label><spring:message code="label.user.firstName"></spring:message></label>
							<label for="firstName" class="col-sm-3 control-label"><spring:message code="label.user.firstName"></spring:message></label>
							<div class="col-md-3 col-sm-5">
								<form:input path="firstName"  value="" class="form-control" style="height: 30px; width: 200px;"/>	
							</div>
							<form:errors path="firstName" cssClass="alert alert-danger"/>
							
						</div>
					
					
						<div class="form-group">
							<label><spring:message code="label.user.lastName"></spring:message></label>
							<label for="lastName" class="col-sm-3 control-label"><spring:message code="label.user.lastName"></spring:message></label>
							<div class="col-md-3 col-sm-6">
								<form:input path="lastName" value="" class="form-control" style="height: 30px; width: 200px;" />
								
							</div>
							<form:errors path="lastName" cssClass="alert alert-danger" />
						</div>
						
						<div class="form-group">
							<label><spring:message code="label.user.email"></spring:message></label>
							<label for="email" class="col-sm-3 control-label"><spring:message code="label.user.email"></spring:message></label>
							<div class="col-md-3 col-sm-6">
								<form:input path="email" value="" class="form-control" style="height: 30px; width: 200px;" />
								
							</div>
							<form:errors path="email"  cssClass="alert alert-danger"/>
						</div>
						
						<div class="form-group">
							<label><spring:message code="label.user.password"></spring:message></label>
							<label for="password" class="col-sm-3 control-label"><spring:message code="label.user.password"></spring:message></label>
							<div class="col-md-3 col-sm-6">
								<form:input path="password" value="" type="password" class="form-control" style="height: 30px; width: 200px;" />
								<form:errors path="password" cssClass="alert alert-danger"/>
							</div>
						</div>
						
						<div class="form-group">
							<label><spring:message	code="label.user.confirmPass"></spring:message></label>
							<label for="matchingPassword" class="col-sm-3 control-label"><spring:message code="label.user.confirmPass"></spring:message></label>
							<div class="col-md-3 col-sm-6">
								<form:input path="matchingPassword" value="" type="password" class="form-control" style="height: 30px; width: 200px;" />
								
							</div>
							<form:errors cssClass="alert alert-danger"/>
						</div>

					
					
		</div>
		
				<div class="panel-footer" align="center">
					<button type="submit" class="btn btn-primary"><spring:message code="label.form.submit"></spring:message></button>
					<a href="<c:url value="login.html" />" class="btn btn-primary"><spring:message	code="label.form.loginLink"></spring:message></a>
			    </div>

	  </div> --%>




						</div>
					</div>
				</div>


			</div>
		</div>
	</div>


</body>

</html>