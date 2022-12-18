<?php

require 'config/config.php';
require'includes/form_handlers/register_handler.php';
require'includes/form_handlers/login_handler.php';

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;


include('Db.php');
include('sendEmail.php');
?>

<html>
<head>
	<title>Welcome to CyberSafe!</title>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="assets/js/register.js"></script>
</head>
<body>

<?php
if(isset($_POST['register_button'])){
	echo'
	<script>
	$(document).ready(function(){
		$("#first").hide();
		$("#second").show();
	});

	</script> 
	';
}
?>
<div class="wrapper">
	<div class="login_box">
		<div class="login_header">
		<h1> CyberSafe</h1>
		Log in or register below!
		</div>
		<div id="first">
			<form action="register.php" method="POST">
				<input type="email" name="log_email" placeholder="Email Address" value=""required>
				<br>
				<input type="password" name="log_password" placeholder="Password">
				<br>
				<?php if(in_array("Email or password is incorrect<br>", $error_array)) echo"Email or password is incorrect<br>";?>
				<input type="submit" name="login_button" value="Login">
				<br>
			
				<a href="#"id="signup" class="signup">Need an account? Register here!</a>
			</form>
		</div>
		<div id="second">
			<form action="register.php" method="POST">
					<input type="text" name="reg_fname" placeholder="First Name" value=""required>
					<br>
					<?php if(in_array("Your first name must be between 2 and 25 characters<br>",$error_array)) echo"Your first name must be between 2 and 25 characters";?>
					<input type="text" name="reg_lname" placeholder="Last Name" value=""required>

					<br>
					<?php if(in_array("Your last name must be between 2 and 25 characters<br>",$error_array)) echo"Your last name must be between 2 and 25 characters";?>
					<input type="email" name="reg_email" placeholder="Email" value=""required>
					<br>
					<input type="email" name="reg_email2" placeholder="Confirm Email" value=""required>
					<br>
					<?php if(in_array("Email already in use<br>",$error_array)) echo"Email aready in use<br>";
					else if(in_array("Only users with a @ncirl.com account can register<br>",$error_array)) echo"Only users with a @ncirl.com account can register<br>";
					else if(in_array("Invalid email format<br>",$error_array)) echo"Invalid email format<br>";
					else if(in_array("Emails don't match<br>",$error_array)) echo"Emails don't match'<br>";?>

					<input type="password" name="reg_password" placeholder="Password" required>
					<br>
					<input type="password" name="reg_password2" placeholder="Confirm password" required>
					<br>

					<?php if(in_array("Passwords don't match<br>",$error_array)) echo"Passwords don't match<br>";
					else if(in_array("Your password can only contain english characters or numbers<br>",$error_array)) echo"Your password can only contain english characters or numbers<br>";
					else if(in_array(" Your password must have at least 8 characters<br>",$error_array)) echo" Your password must have at least 8 characters<br>";?>
	
					<input type="submit" name="register_button" value="Register">
					<br>
					
					<?php if(in_array("<span style='color:#14C800;'>You're all set! Go ahead and log in!</span><br>",$error_array)) echo"<span style='color:#14C800;'>You're all set! Go ahead and log in!</span><br>";?>
					<a href="#" id="signin" class="signin">Already have an account? Log in here!</a>

				</form>
		</div>
			
	</div>
</div>
</body>
</html>