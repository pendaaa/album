
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

		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="material/AllAlbum/LogReg/assets/bootstrap/css/bootstrap.min.css">
		<script src="material/AllAlbum/LogReg/assets/jquery/jquery.min.js"></script>
		<script src="material/AllAlbum/LogReg/assets/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="material/AllAlbum/LogReg/assets/css/log1Css.css">
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
						<li><a href="#">Home</a></li>
						<c:choose>
		                   <c:when test="${empty sessionScope.utilisateur }">
		                      
			                  <li><a href="<c:url value='/login'/>">Login</a></li>
			                  <li><a href="<c:url value='/register'/>">Register</a></li>
		                   </c:when>
		                   <c:otherwise>
			                  <li><a href="<c:url value='/album/dashboard'/>">Dashboard</a></li>
		                   </c:otherwise>
	                    </c:choose>
						</ul>

					</nav>
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<header>
								<h1>Welcome<br />
							</header>
							<section class="tiles">
							<c:forEach items="${ lesAlbums }" var="Unalbum">
								<article class="style1">
									<span class="image">
										<img src="material/AllAlbum/images/pic01.jpg" alt="" />
									</span>
									<a href="<c:url value='/album/affichAlbum'/>?idAffAlbum=<c:out value="${ Unalbum.id }"/>">
										<h2><c:out value="${ Unalbum.nom }"/>: </h2><p><c:out value="${ Unalbum.type }"/>
									</a>
								</article>
								 </c:forEach>
								
							</section>
						</div>
					</div>

				<!-- Footer -->
					<footer id="footer">
						<div class="inner">
						</div>
					</footer>

			</div>

		<!-- Scripts -->
			<script src="material/AllAlbum/assets/js/jquery.min.js"></script>
			<script src="material/AllAlbum/assets/js/browser.min.js"></script>
			<script src="material/AllAlbum/assets/js/breakpoints.min.js"></script>
			<script src="material/AllAlbum/assets/js/util.js"></script>
			<script src="material/AllAlbum/assets/js/main.js"></script>


			<!-- Modal HTML -->
			<div id="myModal" class="modal fade">
				<div class="modal-dialog modal-login">
					<div class="modal-content">
						<form action="/examples/actions/confirmation.php" method="post">
							<div class="modal-header">
								<h4 class="modal-title">Login</h4>
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label>Username</label>
									<input type="text" class="form-control" required="required">
								</div>
								<div class="form-group">
									<div class="clearfix">
										<label>Password</label>
										<a href="#" class="pull-right text-muted"><small>Forgot?</small></a>
									</div>

									<input type="password" class="form-control" required="required">
								</div>
							</div>
							<div class="modal-footer">
								<label class="checkbox-inline pull-left"><input type="checkbox"> Remember me</label>
								<input type="submit" class="btn btn-primary pull-right" value="Login">
							</div>
						</form>
					</div>
				</div>
			</div>

	</body>
</html>
