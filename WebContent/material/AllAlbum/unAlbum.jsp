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
		<link rel="stylesheet" href="../material/AllAlbum/assets/css/main.css" />
		<noscript><link rel="stylesheet" href="../material/AllAlbum/assets/css/noscript.css" /></noscript>
		<link href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round" rel="stylesheet">
		<link rel="stylesheet" href="../material/AllAlbum/LogReg/assets/bootstrap/css/bootstrap.min.css">
		<script src="../material/AllAlbum/LogReg/assets/jquery/jquery.min.js"></script>
		<script src="../material/AllAlbum/LogReg/assets/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="../material/AllAlbum/LogReg/assets/css/log1Css.css">
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
                                  <a href="#detailsAlbum" class="edit" data-toggle="modal">
						              <h1>Album: <c:out value="${ AffAlbum.nom }"/><br />
						          </a>
							</header>
							<section class="tiles">
							<c:forEach items="${ listAffImage }" var="imag">
							<c:set var="idImg" scope="page" value="${ imag.id }"/>
								<article class="style1">
									<span class="image">
                                       <a href="#unPhoto<c:out value="${ idImg }"/>" class="edit" data-toggle="modal">
										    <img src="../images/<c:out value="${ imag.image }"/>" width="200px" height="200px"/>
                                        </a>
									</span>
                                     <span>
                                         <a href="#detailsPhoto<c:out value="${ idImg }"/>" class="edit" data-toggle="modal">
                                            <h4><c:out value="${ imag.title }"/></h4>
                                         </a>
									</span>
								</article>
								
								<div id="unPhoto<c:out value="${ idImg }"/>" class="modal fade">
		                            <div class="modal-dialog modal-login">
			                            <div class="modal-content">
                                           <span>
                                             <img src="../images/<c:out value="${ imag.image }"/>" alt="Responisve image" width="500px"/>
                                           </span>
			                            </div>
		                            </div>
	                           </div>

      <div id="detailsPhoto<c:out value="${ idImg }"/>" class="modal fade">
			<div class="modal-dialog modal-login">
				<div class="modal-content">
            <span>
                <b>Titre:         </b><c:out value="${ imag.title }"/><br>
                <b>Description:   </b><c:out value="${ imag.description }"/><br>
                <b>Hauteur:       </b><c:out value="${ imag.hauteur }"/><br>
                <b>Largeur:       </b><c:out value="${ imag.largeur }"/><br>
                <b>mots-cles:     </b><c:out value="${ imag.mots_cles }"/><br>
                <b>Date creation: </b><c:out value="${ imag.date_creation }"/><br>
                <b>Date MAJ:      </b><c:out value="${ imag.date_maj }"/><br>
            </span>
				</div>
			</div>
		</div>
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
			<script src="../material/AllAlbum/assets/js/jquery.min.js"></script>
			<script src="../material/AllAlbum/assets/js/browser.min.js"></script>
			<script src="../material/AllAlbum/assets/js/breakpoints.min.js"></script>
			<script src="../material/AllAlbum/assets/js/util.js"></script>
			<script src="../material/AllAlbum/assets/js/main.js"></script>
			<!-- Modal HTML -->

      

      <div id="detailsAlbum" class="modal fade">
	     <div class="modal-dialog modal-login">
			<div class="modal-content">
               <span>
                <b>Nom: </b> <c:out value="${ AffAlbum.nom }"/> <br>
                <b>Description: </b> <c:out value="${ AffAlbum.description }"/> <br>
                <b>Type: </b> <c:out value="${ AffAlbum.type }"/> <br>
               </span>
			</div>
		</div>
	   </div>



	</body>
</html>
