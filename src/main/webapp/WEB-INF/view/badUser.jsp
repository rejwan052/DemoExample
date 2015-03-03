<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<html>
<head>
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	<title><spring:message
code="label.badUser.title"></spring:message></title>
</head>
<body>
<h1>
<div class="alert-danger">
				 ${param.message}</div>
</h1>
<br>
<a href="<c:url value="/user/registration" />"><spring:message
code="label.form.loginSignUp"></spring:message></a>

</body>
</html>
