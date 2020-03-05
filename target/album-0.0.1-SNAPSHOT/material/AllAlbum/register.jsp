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
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

    <link rel="stylesheet" href="LogReg/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="LogReg/assets/bootstrap/css/bootstrap-theme.min.css">
    <script src="LogReg/assets/jquery/jquery.min.js"></script>
    <script src="LogReg/assets/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="LogReg/assets/css/registerCss.css">
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
							<li><a href="index.html">Home</a></li>
							<li><a href="register.html">Register</a></li>
							<li><a href="login.html">Login</a></li>
						</ul>

					</nav>
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>


			<!-- Modal HTML -->

      <div class="signup-form">
          <form action="/examples/actions/confirmation.php" method="post">
      		<h2>Register</h2>
              <div class="form-group">
      			<div class="row">
      				<div class="col-xs-6"><input type="text" class="form-control" name="first_name" placeholder="First Name" required="required"></div>
      				<div class="col-xs-6"><input type="text" class="form-control" name="last_name" placeholder="Last Name" required="required"></div>
      			</div>
              </div>
              <div class="form-group">
              	<input type="email" class="form-control" name="username" placeholder="Username" required="required">
              </div>
      		<div class="form-group">
                  <input type="password" class="form-control" name="password" placeholder="Password" required="required">
              </div>
      		<div class="form-group">
                  <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required="required">
              </div>
      		<div class="form-group">
                  <button type="submit" class="btn btn-success btn-lg btn-block">Register Now</button>
              </div>
          </form>
      	<div class="text-center">Already have an account? <a href="login.html">Sign in</a></div>
      </div>


	</body>
</html>
