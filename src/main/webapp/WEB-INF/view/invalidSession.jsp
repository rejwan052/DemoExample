<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<link href="<c:url value="/resources/css/mainB.css"/>" rel="stylesheet">
<title><spring:message code="label.pages.home.title"></spring:message></title>
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
</head>
<body>
	<div class="container">
		<div class="span5" style="float: left;margin:2% 25%;text-align: center;">
			<h1 class="alert alert-danger animated fadeInUp">
				<spring:message code="message.sessionExpired"></spring:message>
			</h1>
			<a href="<c:url value="login.html" />"><spring:message
					code="label.form.loginLink"></spring:message></a>
		</div>
	</div>
</body>

</html>
