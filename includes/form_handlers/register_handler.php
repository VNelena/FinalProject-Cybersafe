<?php
//declaring variables to prevent errors
$fname="";//First Name
$lname="";//Last Name
$em="";//Email
$em2="";//Email 2
$password="";//password
$password2="";//password 2
$error_array=array();//Hold error messages

if(isset($_POST['register_button'])){

	//Registration form values
	//First Name
	$fname=strip_tags($_POST['reg_fname']);//remove HTML tags
	$fname=str_replace('', '', $fname); //remove spaces
	$fname=ucfirst(strtolower($fname)); //convert all to low case and only the 1st upper
	$_SESSION['reg_fname']=$fname; //Stores first name into session variable

	//Last Name
	$lname=strip_tags($_POST['reg_lname']);//remove HTML tags
	$lname=str_replace('', '', $lname); //remove spaces
	$lname=ucfirst(strtolower($lname)); //convert all to low case and only the 1st upper
	$_SESSION['reg_lname']=$lname; //Stores last name into session variable

	//Email
	$em=strip_tags($_POST['reg_email']);//remove HTML tags
	$em=str_replace('', '', $em); //remove spaces
	$em=ucfirst(strtolower($em)); //convert all to low case and only the 1st upper
	$_SESSION['reg_email']=$em; //Stores first email into session variable

	//Email2
	$em2=strip_tags($_POST['reg_email2']);//remove HTML tags
	$em2=str_replace('', '', $em2); //remove spaces
	$em2=ucfirst(strtolower($em2)); //convert all to low case and only the 1st upper
	$_SESSION['reg_email2']=$em2; //Stores 2nd email into session variable

	//Password
	$password=strip_tags($_POST['reg_password']);//remove HTML tags
	$_SESSION['reg_password']=$password; //Stores password into session variable
	//Password2
	$password2=strip_tags($_POST['reg_password2']);//remove HTML tags

	$date=date("Y-m-d"); //gets current date
	
	if($em==$em2){
	//check if email is in valid format
	if(!filter_var($em,FILTER_VALIDATE_EMAIL)){

			array_push($error_array,"Invalid email format<br>");
	}
	else{

	if(empty(preg_match("/ncirl.ie/", $em))) {
        array_push($error_array,"Only users with a @ncirl.ie account can register<br>");
    } 
		$em=(filter_var($em,FILTER_VALIDATE_EMAIL));
		

		//check if email already exists

		$e_check=mysqli_query($con,"SELECT email FROM users WHERE email='$em'");

		//count number of rows returned to check if email is registered already

		$num_rows=mysqli_num_rows($e_check);

		if($num_rows>0){
			array_push($error_array,"Email already in use<br>");
		}   
	}
		

	}	else{
				array_push($error_array,"Emails don't match<br>");
			}

	if((strlen($fname)>25)||(strlen($fname)<2)) {
		array_push($error_array," Your first name must be between 2 and 25 characters<br>");

	}
	if((strlen($lname)>25)||(strlen($lname)<2)) {
	array_push($error_array," Your last name must be between 2 and 25 characters<br>");
	}

	if($password!=$password2){
		array_push($error_array,"Passwords don't match<br>");
	}
	//check password only contains valid characters
	else{
		if(preg_match('/[^a-zA-Z0-9]/',$password)){
			array_push($error_array," Your password can only contain english characters or numbers<br>"); //checks if password only has letters or numbers
		}}


	if(strlen($password)<8){
		array_push($error_array," Your password must have at least 8 characters<br>");
	}

	if(empty($error_array)){
		$password=md5($password);//encrypting user password before sending to the database
		//generate username by concatenation of firt and last name
		$username=strtolower($fname . "" . $lname);
		$check_username_query=mysqli_query($con,"SELECT username FROM users WHERE username='$username'");
		$i=0;
		//if username exists add number to username
		while(mysqli_num_rows($check_username_query)!=0){
			$i++;//add one to i 
			$username=$username . "_" .$i;
			$check_username_query=mysqli_query($con,"SELECT username FROM users WHERE username='$username'");

		}
		//profile picture assigment
		$rand=rand(1,2);//create random number between 1 and 2

		if($rand==1)
		$profile_pic="assets/images/profile_pics/default/head_gray.jpg";
		else if($rand==2)
		$profile_pic="assets/images/profile_pics/default/head_black.png";

		$query=mysqli_query($con,"INSERT INTO users VALUES ('','$fname','$lname','$username','$em','$password','$date','$profile_pic','0','0','no',',')");

		array_push($error_array,"<span style='color:#14C800;'>Check your email for verification. Then go ahead and log in!</span><br>");
		 
				$to_email = $em;
				$subject = "Test email to send from XAMPP";
				$body = "Hi, This is test mail to check how to send mail from Localhost Using Gmail ";
				$headers = "From: sender email";

				if (mail($to_email, $subject, $body, $headers))

				{
					echo " <span style='font-family'Verification Email successfully sent to $to_email...>";
				}

				else

				{
					echo "Email sending failed!";
				}
			
	}
	
 }
 ?>
