<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ page   import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="true"%>

<!DOCTYPE html>
<!--[if lt IE 7]>

<html class="lt-ie9 lt-ie8 lt-ie7" lang="en">

<![endif]-->
<!--[if IE 7]>

<html class="lt-ie9 lt-ie8" lang="en">

<![endif]-->
<!--[if IE 8]>

<html class="lt-ie9" lang="en">

<![endif]-->
<!--[if gt IE 8]>
<!-->

<html lang="en">
  
  <!--
<![endif]-->

<head>
    <meta charset="utf-8">
    <title>
     Demo Example
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- bootstrap css -->
    <script type="text/javascript" src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
    </script>
    <link href="<c:url value="resources/icomoon/style.css" />" rel="stylesheet">
    <!--[if lte IE 7]>
    <script src="css/icomoon-font/lte-ie7.js">
    </script>
    <![endif]-->
  <link href="<c:url value="resources/css/wysiwyg/bootstrap-wysihtml5.css" />" rel="stylesheet">
  <link href="<c:url value="resources/css/wysiwyg/wysiwyg-color.css" />" rel="stylesheet">
  <link href="<c:url value="resources/css/main.css" />" rel="stylesheet"> <!-- Important. For Theming change primary-color variable in main.css  -->
  <link href="<c:url value="resources/css/charts-graphs.css" />" rel="stylesheet">
  <link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/themes/start/jquery-ui.css"
type="text/css" media="all"/>
  </head>
  
	<body>
	
    <header>
      <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
    </header>

    
    <div class="container-fluid">
      <div class="dashboard-container">
      
        <div id="topnavId" class="top-nav">
         <ul  id="myTab">
					<li><a class="selected" href="homepage.html">
							<div class="fs1" aria-hidden="true" data-icon="&#xe0a0;"></div>
							Dashboard
					</a></li>

					<li><a href="#" onclick="userDetailsAddPage();">
							<div class="fs1" aria-hidden="true" data-icon="&#xe0b8;"></div>
							Employee
					</a></li>
		</ul>
         <div class="clearfix"></div>
        </div>

			<div id="subnavId" class="sub-nav">

				<ul class="dbTab">
					<li><a href="#" class="heading">Dashboard</a></li>
					<li><a href="#mailbox"> Mailbox </a></li>
					<li><a href="#todo"> ToDos </a></li>
					<li><a href="#chats"> Chats </a></li>
					<li><a href="#notifications"> Notifications </a></li>

				</ul>

				<ul id="userdetailsTab" style="float: left; display: none;">
					<li><a href="#" class="heading">Employee</a></li>
					<!-- <li><a href="#" onclick="userDetailsPage();">
							Employee Details </a></li> -->
					<li><a class="selected" href="#" onclick="userDetailsAddPage();"> Add Employee Details </a></li>

					<li><a href="#" onclick="viewUserDetailsPage();"> Employee	Details </a></li>
					<li><a href="#" onclick="adminPage();"> Admin Details </a></li>

				</ul>

				<div class="btn-group pull-right">
					<jsp:include page="/WEB-INF/view/common/dropdown.jsp"></jsp:include>
				</div>
			</div>
			<div class="dashboard-wrapper">
			
			</div>
		</div>
      <!--/.fluid-container-->
    </div>
    <footer>
      <p>
        &copy; Demo 2015
      </p>
    </footer>
    
    <script src="<c:url value="resources/js/wysiwyg/wysihtml5-0.3.0.js" />" type="text/javascript">
    </script>
    <script src="<c:url value="resources/js/jquery.min.js" />" type="text/javascript">
    </script>
    <script src="<c:url value="resources/js/bootstrap.js" />" type="text/javascript">
    </script>
      
	
    <script src="<c:url value ="resources/js/wysiwyg/bootstrap-wysihtml5.js" />" type="text/javascript">
    </script>
    <script src="<c:url value="resources/js/jquery.scrollUp.js" />" type="text/javascript">
    </script>
    
    
    <!-- 
    <script type="text/javascript" src="https://www.google.com/jsapi">
    </script> -->
    
    <!-- Easy Pie Chart JS -->
    <script src="<c:url value="resources/js/jquery.easy-pie-chart.js" />" type="text/javascript">
    </script>
    
    <!-- Sparkline JS -->
    <script src="<c:url value="resources/js/jquery.sparkline.js" />" type="text/javascript">
    </script>
    
    <!-- Tiny Scrollbar JS -->
    <script src="<c:url value="resources/js/tiny-scrollbar.js" />" type="text/javascript">
    </script>
    
    <!-- Page-Controller -->
	<script src="<c:url value="resources/jquery/MediatorController.js"/>" type="text/javascript"></script>
    
     <script src="<c:url value="resources/js/jquery.dataTables.js" />" type="text/javascript">
     </script>
     
      <!-- File-Upload -->
     
     <script src="<c:url value="resources/bootstrap/bootstrap-fileupload/bootstrap-fileupload.js" />" type="text/javascript">
     </script>
     
    <script type="text/javascript">
      //ScrollUp
      $(function () {
        $.scrollUp({
          scrollName: 'scrollUp', // Element ID
          topDistance: '300', // Distance from top before showing element (px)
          topSpeed: 300, // Speed back to top (ms)
          animation: 'fade', // Fade, slide, none
          animationInSpeed: 400, // Animation in speed (ms)
          animationOutSpeed: 400, // Animation out speed (ms)
          scrollText: 'Scroll to top', // Text for element
          activeOverlay: false, // Set CSS color to display scrollUp active point, e.g '#00FFFF'
        });
      });

      //Tooltip
      $('a').tooltip('hide');
      $('i').tooltip('hide');


      //Tiny Scrollbar
      $('#scrollbar').tinyscrollbar();
      $('#scrollbar-one').tinyscrollbar();
      $('#scrollbar-two').tinyscrollbar();
      $('#scrollbar-three').tinyscrollbar();

     
     /*  $(document).ready(function(){ 
          $("#myTab a").click(function(e){
            e.preventDefault();
          	$(this).tab('show');
          });
      }); */
      

     /*  //Tabs
      $('#myTab a').click(function (e) {
        e.preventDefault();
        $(this).tab('show');
      })
 */
      
    </script>
    
    
  </body>



</html>