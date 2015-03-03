<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page   import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- <style>
.img-circle{
	content:url(resources/image/images.jpg);
}
</style> -->
<%@ page session="true"%>

      <a href="#" class="logo">
        <img src="resources/image/logo.png" alt="logo" />
      </a>
      <div class="btn-group">
        <button class="btn btn-primary">
         <%=SecurityContextHolder.getContext().getAuthentication().getName()%>
        </button>
        <button data-toggle="dropdown" class="btn btn-primary dropdown-toggle">
          <span class="caret">
          </span>
        </button>
        <ul class="dropdown-menu pull-right">
          <li>
            <a href="#" onclick="viewUserDetailsPage();">
              Edit Profile
            </a>
          </li>
          <li>
            <a href="#">
              Account Settings
            </a>
          </li>
          <li>
            <a href="<c:url value="/j_spring_security_logout" />"><i class="fa fa-sign-out fa-fw"></i><spring:message
					code="label.pages.logout"></spring:message></a>
          </li>
        </ul>
      </div>
      <ul class="mini-nav">
       <!--  <li>
          <a href="#">
            <div class="fs1" aria-hidden="true" data-icon="&#xe040;"></div>
            <span class="info-label badge badge-warning">
              3
            </span>
          </a>
        </li>
        <li>
          <a href="#">
            <div class="fs1" aria-hidden="true" data-icon="&#xe04c;"></div>
            <span class="info-label badge badge-info">
              5
            </span>
          </a>
        </li>
        <li>
          <a href="#">
            <div class="fs1" aria-hidden="true" data-icon="&#xe037;"></div>
            <span class="info-label badge badge-success">
              9
            </span>
          </a>
        </li> -->
        <c:set var="now" value="<%=new java.util.Date()%>" />
		<img class="img-circle" width="44"  alt="User Image" src="imageServlet?userId+${now}" onerror="this.src='resources/image/images.jpg'">
       

</ul>
      
