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
  <link href="../Admin/css/mdb.min.css" rel="stylesheet">
  <!-- Your custom styles (optional) -->
  <link href="../Admin/css/style.min.css" rel="stylesheet">
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
  <link rel="stylesheet" href="../Admin/assets/css/gestUtil.css">
  <script src="../Admin/assets/jquery/jquery.min.js"></script>
  <script src="../Admin/assets/bootstrap/js/bootstrap.min.js"></script>

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
              <a href="<c:url value='/logout'/>" class="nav-link border border-light rounded waves-effect"
                target="_blank">
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
        <a href="../Admin/monProfil.jsp" class="list-group-item list-group-item-action waves-effect">
          <i class="fas fa-chart-pie mr-3"></i>Mon Profile
        </a>
        
        <c:choose>
        <c:when test="${utilisateur.getStatus() == \"USER\"}">
			<a href="../Admin/gestionUtilisateur.jsp" class="list-group-item list-group-item-action waves-effect" hidden>
          <i class="fas fa-user mr-3"></i>Gestion Utilisateur</a> 
		</c:when>
		<c:otherwise>
            	<a href="../Admin/gestionUtilisateur.jsp" class="list-group-item list-group-item-action waves-effect" >
                <i class="fas fa-user mr-3"></i>Gestion Utilisateur</a>
          </c:otherwise>
          </c:choose>
          
          
        <a href="../Admin/mesAlbums.jsp" class="list-group-item list-group-item-action active waves-effect">
          <i class="fas fa-table mr-3"></i>Mes Albums</a>
      </div>

    </div>
    <!-- Sidebar -->

  </header>
  <main class="pt-5 mx-lg-5">
        <div class="col-sm-12 table-wrapper">
           
            
     
          <div class="modal-dialog">
            <div class="modal-content">
              <form method="post" action="addPhoto">
                <div class="modal-header">
                  <h4 class="modal-title">Add Photo</h4>
                  
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <label>Titre</label>
                    <input type="text" class="form-control" name="titre" required>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea class="form-control" name="descriptionphoto" required></textarea>
                  </div>
                  <div class="form-group row">
                    <label for="example-number-input" class="col-2 col-form-label">Hauteur</label>
                    <div class="col-10">
                      <input class="form-control" type="number" name="hauteur" value="0" id="example-number-input">
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="example-number-input" class="col-2 col-form-label">Largeur</label>
                    <div class="col-10">
                      <input class="form-control" type="number" name="largeur" value="0" id="example-number-input">
                    </div>
                  </div>
                  <div class="form-group">
                    <label>Mots-cles</label>
                    <textarea class="form-control" name="motcles" required></textarea>
                  </div>
                  <div class="file-field">
                    <div class="btn btn-primary btn-sm float-left">
                      <span>Choose files</span>
                      <input type="file" name="imageFile">
                    </div>
                    <div class="file-path-wrapper">
                    </div>
                  </div>
                  <div class="form-group col-md-4">
                    <select id="inputState" class="form-control" name="albumName">
                 
                      <option select><c:out value="${ thisAlbum.nom }"/></option>
                      
                    </select>
                  </div>
                </div>
                <div class="modal-footer">
                  
                  <input type="submit" class="btn btn-success" value="Add">
                </div>
              </form>
            </div>
          </div>
        
        

  <!-- Edit Modal HTML -->
  

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
