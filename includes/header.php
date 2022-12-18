<?php

require 'config/config.php';

if(isset($_SESSION['username'])){
	$userLoggedIn=$_SESSION['username'];
	$user_details_query=mysqli_query($con, "SELECT * FROM users WHERE username ='$userLoggedIn'");
	$user=mysqli_fetch_array($user_details_query);
}
else {
	header("Location: register.php"); //if user is not logged in they cannot access any page of the website
}

?>

<html>
<head>
	<title>CyberSafe</title>

	<!--- CSS-->
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
	<link rel"stylesheet" type="text/css" href="assets/css/bootstrap.css">
	<link rel"stylesheet" type="text/css" href="assets/css/nav_style.css">
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">

	<!--- Javascript-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="assets/js/bootstrap.js"></script>

	
	
	

</head>
<body>
<div class="topbar">
	<div class="logo">
		<a href="index.php">CyberSafe</a>
		</a>
	<a href="about.php">
	<i class="fa fa-question-circle" aria-hidden="true"></i>
	</a>
	</div>
	
	<div class="icons_bar">
	<nav>

	<a href="<?php echo $userLoggedIn;?>">
	<?php echo $user['first_name'];?> 
	</a>

	<a href="index.php">
		<i class="fa fa-home fa-lg" aria-hidden="true"></i>
		</a>
	<a href="#">
			<i class="fa fa-envelope fa-lg"></i>
	</a>
	<a href="#">
	<i class="fa fa-bell fa-lg"></i>
	</a>
	<a href="#">
		<i class="fa fa-cog fa-lg" aria-hidden="true"></i>
	</a>

	<a href="projects.php">
	<i class="fa fa-group fa-lg" aria-hidden="true"></i>
	</a>


	<a href="includes/handlers/logout.php">
	<i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
	</a>

	</nav>
</div>
</div> 
</div>

<div class="wrapper_index">


