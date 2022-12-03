<?php if(in_array("Email or password is incorrect<br>", $error_array)) echo"Email or password is incorrect<br>";?>



<?php
					if(isset($_SESSION['log_email'])){
					echo $_SESSION['log_email'];
				}
				?>


<?php 
					if(isset($_SESSION['reg_fname'])){
						echo $_SESSION['reg_fname'];
				}
				?>
				<?php
					if(isset($_SESSION['reg_lname'])){
						echo $_SESSION['reg_lname'];
				}
				?>

				<?php
					if(isset($_SESSION['reg_email'])){
						echo $_SESSION['reg_email'];
					}
				?>
				<?php
					if(isset($_SESSION['reg_email2'])){
						echo $_SESSION['reg_email2'];
					}
				?>