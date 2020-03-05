<%@page import="org.apache.maven.session.scope.internal.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<!--
	Phantom by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>My Album</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="material/AllAlbum/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="material/AllAlbum/assets/css/noscript.css" /></noscript>

    <link rel="stylesheet" href="material/AllAlbum/LogReg/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="material/AllAlbum/LogReg/assets/bootstrap/css/bootstrap-theme.min.css">
    <script src="material/AllAlbum/LogReg/assets/jquery/jquery.min.js"></script>
    <script src="material/AllAlbum/LogReg/assets/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="material/AllAlbum/LogReg/assets/css/registerCss.css">
	</head>
	<body >
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Header -->
					<header id="header">
						<div class="inner">
							<!-- Logo -->
								<a href="index.html" class="logo">
									<span class="symbol"><img src="images/logo.svg" alt="" /></span><span class="title">DIC3 JEE ALBUM</span>
								</a>
							<!-- Nav -->
								<nav>
									<ul>
										<li><a href="#menu">Menu</a></li>
									</ul>
								</nav>
						</div>
					</header>

				<!-- Menu -->
					<nav id="menu">
						<h2>Menu</h2>
						<ul>
							<li><a href="/album">Home</a></li>
							<li><a href="<c:url value='/register'/>">Register</a></li>
							<li><a href="<c:url value='/login'/>">Login</a></li>
						</ul>

					</nav>
			</div>

		<!-- Scripts -->
			<script src="material/AllAlbum/assets/js/jquery.min.js"></script>
			<script src="material/AllAlbum/assets/js/browser.min.js"></script>
			<script src="material/AllAlbum/assets/js/breakpoints.min.js"></script>
			<script src="material/AllAlbum/assets/js/util.js"></script>
			<script src="material/AllAlbum/assets/js/main.js"></script>


			<!-- Modal HTML -->

      <div class="signup-form">
          <form action="register" method="post">
      		<h2>Register</h2>
              <div class="form-group">
      			<div class="row">
      				<div class="col-xs-6"><input type="text" class="form-control" name="firstName" placeholder="First Name" required="required"></div>
      				<div class="col-xs-6"><input type="text" class="form-control" name="lastName" placeholder="Last Name" required="required"></div>
      			</div>
              </div>
              <div class="form-group">
              	<input type="text" class="form-control" name="login" placeholder="Login" required="required">
              </div>
      		<div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password" required="required">
              </div>
      		<div class="form-group">
                  <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
              </div>
              <c:choose>
		                <c:when test="${empty sessionScope.utilisateur }">
		                   <div class="form-check">
                             <input type="radio" class="form-check-input" name="userType" id="USER" value="USER" checked>
                             <label for="public" class="form-check-label">User</label>
                           </div>
		                </c:when>
		                <c:otherwise>
		                <div class="form-check">
                          <input type="radio" class="form-check-input" name="userType" id="ADMIN" value="ADMIN">
                          <label for="prive" class="form-check-label">Admin</label>
                        </div>
                        <div class="form-check">
                             <input type="radio" class="form-check-input" name="userType" id="USER" value="USER" checked>
                             <label for="public" class="form-check-label">User</label>
                        </div>
		                </c:otherwise>
	          </c:choose>
               
            
      		<div class="form-group">
                  <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
              </div>
              <span style="color:red" class="${ empty messageErreurs ? 'succes' : 'erreur'}">${ statusMessage }</span>
          </form>
      	<div class="text-center">Already have an account? <a href="login.html">Sign in</a></div>
      </div>


	</body>
</html>
