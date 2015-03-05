<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setBundle basename="messages" />
<%@ page session="true"%>
<fmt:message key="message.password" var="noPass" />
<fmt:message key="message.username" var="noUser" />

<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    <!-- Core CSS - Include with every page -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.css"/>" rel="stylesheet">

    <!-- SB Admin CSS - Include with every page -->
    <link href="<c:url value="/resources/css/sb-admin.css"/>"" rel="stylesheet">
    
    <!-- Login css -->
    <link href="<c:url value="/resources/css/styleB.css"/>"" rel="stylesheet">
    <link href="<c:url value="/resources/css/mainB.css"/>"" rel="stylesheet">
    
	<script src="<c:url value="/resources/js/jquery-1.10.2.js"/>" type="text/javascript"></script>
	
	<title><spring:message code="label.pages.home.title"></spring:message></title>
	<script type="text/javascript">
		function validate() {
			if (document.f.j_username.value == ""
					&& document.f.j_password.value == "") {
				alert("${noUser} & ${noPass}");
				document.f.j_username.focus();
				return false;
			}
			if (document.f.j_username.value == "") {
				alert("${noUser}");
				document.f.j_username.focus();
				return false;
			}
			if (document.f.j_password.value == "") {
				alert("${noPass}");
				document.f.j_password.focus();
				return false;
			}
		}
	</script>


<script language="javascript">
    document.onmousedown=disableclick;
    
    function disableclick(event)
    {
      if(event.button==2)
       {
         
         return false;    
       }
    }
 </script>


<style type="text/css">
	div.alert {
		overflow: hidden;
	}
	

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

<body oncontextmenu="return false">
<!-- <div id="loader_cont" style="display:none;"><img src="resources/image/page_loader.gif"></div> --> 
	<div class="container">
		<div>
		<div style="float:left;margin: 2% 26%; width: 30%;position: absolute;" align="center">
			<c:if test="${param.error != null}">
				<c:choose>
					<c:when
						test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User is disabled'}">
						<div class="alert alert-danger animated fadeInUp">
							<spring:message code="auth.message.disabled"></spring:message>
						</div>
					</c:when>
					<c:when
						test="${SPRING_SECURITY_LAST_EXCEPTION.message == 'User account has expired'}">
						<div class="alert alert-danger animated fadeInUp">
							<spring:message code="auth.message.expired"></spring:message>
						</div>
					</c:when>
					<c:otherwise>
						<div class="alert alert-danger animated fadeInUp">
						<!-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> -->
    							<spring:message code="message.badCredentials"></spring:message>
						</div>
					</c:otherwise>
				</c:choose>
			</c:if>
			<c:if test="${param.logSucc == true}">
				<div id="success" class="alert alert-success animated fadeInUp">
					<spring:message code="message.logoutSucc"></spring:message>
				</div>
			</c:if>
		</div>
		
		<%-- <div class="span12" style="margin: 10% 10%">
			<h1>
				<spring:message code="label.form.loginTitle"></spring:message>
			</h1>
			<a href="?lang=en"><spring:message code="label.form.loginEnglish"></spring:message></a>
			| <a href="?lang=es_ES"><spring:message
					code="label.form.loginSpanish"></spring:message></a>
			<form class="form-horizontal" name='f' action="j_spring_security_check" method='POST' onsubmit="return validate();" >
				
					<div class="form-group">
						<label><spring:message	code="label.form.loginEmail"></spring:message></label>
						<label for="j_username" class="col-sm-2 control-label">Email*</label>
						<div class="col-sm-4">
							<input type='text' name='j_username' value='' class="form-control" style="height: 30px; width: 200px;">
						</div>
					 </div>
					<div class="form-group">
						<label><spring:message	code="label.form.loginPass"></spring:message></label>
						<label for="j_password" class="col-sm-2 control-label">Password*</label>
						<div class="col-sm-4">
							<input type='password' name='j_password' class="form-control" style="height: 30px; width: 200px;"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<input name="submit" type="submit" class="btn btn-primary"	value=<spring:message code="label.form.submit"></spring:message> />
						</div>
					</div>
					
					
				

			</form>
			<br> Current Locale : ${pageContext.response.locale} <br> <a
				href="<c:url value="/user/registration" />"><spring:message
					code="label.form.loginSignUp"></spring:message></a>
		</div> --%>
		
		
                <%-- <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Please Sign In</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form" name='f' action="j_spring_security_check" method='POST' onsubmit="return validate();">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control"  placeholder="E-mail" name="j_username" type="text" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control"  placeholder="Password" name="j_password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <input type="submit" name="submit" value=<spring:message code="label.form.login"></spring:message>  class="btn btn-lg btn-primary btn-block" />
                            </fieldset>
                        </form>
                        
                        <br> Current Locale : ${pageContext.response.locale} <br> <a
				href="<c:url value="/user/registration" />"><spring:message
					code="label.form.loginSignUp"></spring:message></a>
                    </div>
                </div> --%>
                <div class="span3"></div>
                
                <div class="span5">
                      <div class="sign-in-container">
                         <form role="form" id="loginForm" name='f' class="login-wrapper" action="j_spring_security_check" method='POST' onsubmit="return validate();">
                          <div class="header">
                            <div class="row-fluid">
                              <div class="span12">
                                <h3>Login<img src="resources/image/logo1.png" alt="Logo" class="pull-right"></h3>
                                <p>Fill out the form below to login.</p>
                              </div>
                            </div>
                           
                          </div>
                          <div class="content">
                            <div class="row-fluid">
                              <div class="span12">
                                <input class="input span12 email" name="j_username"   type="text" placeholder="E-mail"  required="required" autofocus>
                              </div>
                            </div>
                            <div class="row-fluid">
                              <div class="span12">
                                <input class="input span12 password"  name="j_password"   placeholder="Password" required="required" type="password">
                              </div>
                            </div>
                          </div>
                          <div class="actions">
                            <input class="btn btn-danger" name="submit" type="submit" value=<spring:message code="label.form.login"></spring:message> />
                            <a class="link" href="#">Forgot Password?</a>
                            <div class="clearfix"></div>
                            <a	href="<c:url value="/user/registration" />"><spring:message	code="label.form.loginSignUp"></spring:message></a>
                          </div>
                        </form>
                      </div>
                    </div>
                    
                    
            
		
		
		
		</div>
	</div>
</body>

</html>