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
            <div class="table-title">
                <div class="row">
                   <div class="col-sm-6">
                      <a href="<c:url value='/album/addPhoto'/>"><input class="btn btn-success" value="Add new Photo"></a>
                   </div>
                     <h2>Edit Album: <c:out value="${ thisAlbum.nom }"/></h2>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>
                          <span class="custom-checkbox">
                          </span>
                        </th>
                        <th>Image</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${ listImage }" var="img">
                    <tr>
                        <td>
                          <span class="custom-checkbox">
                          </span>
                        </td>
                        <td><img src="../images/<c:out value="${ img.image }"/>" class="img-fluid" alt="Responisve image" width="100px"></td>
                        <td><c:out value="${ img.title }"/></td>
                        <td><c:out value="${ img.description }"/></td>
                        <td>
                            <a href="<c:url value='../Admin/modifierAlbum.jsp'/>#editPhoto" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                            <a href="#deletePhoto<c:out value="${ img.id }"/>" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                        </td>
                    </tr>
                    
                    
  <div id="deletePhoto<c:out value="${ img.id }"/>" class="modal fade">
    <div class="modal-dialog">
      <div class="modal-content">
        <form method="post" action="../album/deletePhoto">
          <div class="modal-header">
            <h4 class="modal-title">Delete Photo</h4>
            <input type="text" name="idPhotoDel" class="form-control" value="<c:out value="${ img.id }"/>" hidden>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">
            <p>Are you sure you want to delete these Records?</p>
            <p class="text-warning"><small>This action cannot be undone.</small></p>
          </div>
          <div class="modal-footer">
            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
            <button type="submit" class="btn btn-danger" >Delete</button>
          </div>
        </form>
      </div>
    </div>
  </div>
                    
                    </c:forEach>
              
                </tbody>
            </table>
        </div>



        <div id="../Album/modifierAlbum.jsp/editPhoto" class="modal fade">
          <div class="modal-dialog">
            <div class="modal-content">
              <form>
                <div class="modal-header">
                  <h4 class="modal-title">Edit Photo</h4>
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                  <div class="form-group">
                    <img src="img/sample.jpg" class="img-fluid" alt="Responisve image" width="100px">
                  </div>
                  <div class="form-group">
                    <label>Name</label>
                    <input type="text" class="form-control" required>
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea class="form-control" required></textarea>
                  </div>
                  <div class="form-group col-md-4">
                    <select id="inputState" class="form-control">
                      <option select>Album...</option>
                      <<option>...</option>
                    </select>
                  </div>
                </div>
                <div class="modal-footer">
                  <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                  <button type="submit" class="btn btn-success" value="Add">
                </div>
              </form>
            </div>
          </div>
        </div>


        






  <!-- Add photo HTML -->


  <!-- Delete Modal HTML -->

  </main>
  <footer class="page-footer text-center font-small primary-color-dark darken-2 mt-4 wow fadeIn">

  </footer>
  <!--/.Footer-->

  <!-- SCRIPTS -->
  <!-- JQuery -->
  <script type="text/javascript" src="../Admin/js/jquery-3.4.1.min.js"></script>
  <!-- Bootstrap tooltips -->
  <script type="text/javascript" src="../Admin/js/popper.min.js"></script>
  <!-- Bootstrap core JavaScript -->
  <script type="text/javascript" src="../Admin/js/bootstrap.min.js"></script>
  <!-- MDB core JavaScript -->
  <script type="text/javascript" src="../Admin/js/mdb.min.js"></script>
  <!-- Initializations -->

</body>

</html>
