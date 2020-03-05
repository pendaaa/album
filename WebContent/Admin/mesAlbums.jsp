<%@page import="org.apache.maven.session.scope.internal.SessionScope"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>Material Design Bootstrap</title>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
  <!-- Bootstrap core CSS -->
  <link href="../Admin/css/bootstrap.min.css" rel="stylesheet">
  <!-- Material Design Bootstrap -->
  <link href="css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="css/style.min.css" rel="stylesheet">
  <style>
    .map-container{
overflow:hidden;
padding-bottom:56.25%;
position:relative;
height:0;
}
.map-container iframe{
left:0;
top:0;
height:100%;
width:100%;
position:absolute;
}
  </style>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="assets/css/gestUtil.css">
  <script src="assets/jquery/jquery.min.js"></script>
  <script src="assets/bootstrap/js/bootstrap.min.js"></script>

</head>


<body class="grey lighten-3">
  <!--Main Navigation-->
  <header>
    <!-- Navbar -->
    <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar">
      <div class="container-fluid">
        <!-- Brand -->
         <strong class="blue-text">${utilisateur.getFirstName()}</strong>
        <!-- Links -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <!-- Left  target="_blank" pour ouvrir sur nouvelle onglet la page home-->
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
              <a class="nav-link waves-effect" href="/album"
                >Home</a>
            </li>
          </ul>
          <!-- Right -->
          <ul class="navbar-nav nav-flex-icons">
            <li class="nav-item">
              <a href="<c:url value='/logout'/>" class="nav-link border border-light rounded waves-effect">
                <i class="fab fa-github mr-2"></i>LogOut
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Navbar -->

    <!-- Sidebar -->
    <div class="sidebar-fixed position-fixed">

      <a class="logo-wrapper waves-effect">
        <img src="https://mdbootstrap.com/img/logo/mdb-email.png" class="img-fluid" alt="">
      </a>

      <div class="list-group list-group-flush">
        <a href="monProfil.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Mon Profile
        </a>
        
        <c:choose>
        <c:when test="${utilisateur.getStatus() == \"USER\"}">
			<a href="gestionUtilisateur.jsp" class="list-group-item list-group-item-action waves-effect" hidden>
          <i class="fas fa-user mr-3"></i>Gestion Utilisateur</a> 
		</c:when>
		<c:otherwise>
            	<a href="gestionUtilisateur.jsp" class="list-group-item list-group-item-action waves-effect" >
                <i class="fas fa-user mr-3"></i>Gestion Utilisateur</a>
          </c:otherwise>
          </c:choose>
          
          
        <a href="mesAlbums.jsp" class="list-group-item list-group-item-action active waves-effect">
          <i class="fas fa-table mr-3"></i>Mes Albums</a>
      </div>

    </div>
    <!-- Sidebar -->

  </header>
  <main class="pt-5 mx-lg-5">
        <div class="col-sm-12 table-wrapper">
            <div class="table-title">
                <div class="row">
                   <div class="col-sm-6">
                      <a href="<c:url value='/album/addAlbum'/>"><input class="btn btn-success" value="Create new Album"></a>
                   </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                          <span class="custom-checkbox">
                          </span>
                        </th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Type</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${ listAlbum }" var="album">
                    <tr>
                        <td>
                          <span class="custom-checkbox">
                          </span>
                        </td>
                        <td><c:out value="${ album.nom }"/></td>
                        <td><c:out value="${ album.description }"/></td>
                        <td><c:out value="${ album.type }"/></td>
                        <td>
                            <a href="<c:url value='/album/editAlbum'/>?idAlbum=<c:out value="${ album.id }"/>" class="edit"><i class="material-icons" title="Edit">&#xE254;</i></a>
                            <a href="#deleteAlbum<c:out value="${ album.id }"/>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    
                    
                    <div id="deleteAlbum<c:out value="${ album.id }"/>" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <form method="post" action="../album/deleteAlbum">
          <div class="modal-header">
            <h4 class="modal-title">Delete Album</h4>
            <input type="text" name="idAlbumDel" class="form-control" value="<c:out value="${ album.id }"/>" hidden>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">
            <p>Are you sure you want to delete these Records?</p>
            <p class="text-warning"><small>This action cannot be undone.</small></p>
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
            <button type="submit" class="btn btn-danger" value="Delete">delete</button>
          </div>
        </form>
      </div>
    </div>
  </div>
                    
                    
                    </c:forEach>
                </tbody>
            </table>
        </div>

  <!-- Add photo HTML -->


  <!-- Delete Modal HTML -->

  </main>
  <footer class="page-footer text-center font-small primary-color-dark darken-2 mt-4 wow fadeIn">

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="js/mdb.min.js"></script>
  <!-- Initializations -->

</body>

</html>
