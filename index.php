
<?php
include("includes/header.php");
include("includes/classes/User.php");
include("includes/classes/Post.php");

if(isset($_POST['post'])){
	$post= new Post($con,$userLoggedIn);
	$post->submitPost($_POST['post_text'],'none');
	header("Location:index.php");
}
//require 'config/config.php';
//session_destroy(); //when you log out the session is destroyed

?>
	<div class="user_details column">
		<a href="<?php echo $userLoggedIn;?>"> <img src="<?php echo $user['profile_pic'];?>" width="100" height="100"> </a>
			<div class="user_details_left_right">
				<a href="<?php echo $userLoggedIn;?>">
					<?php echo $user['first_name'] ." ".$user['last_name']; ?>
				</a>
			<br>
			
			<?php echo "Posts:" .$user['num_posts']. "<br>"; 
			      echo "Likes:" . $user['num_bumps'];
			?>
			</div>
	</div>
	

	<div class="main_column column">

	<form class="post_form" action="index.php" method="POST"> 
		<textarea name="post_text" id="post_text" placeholder="Got something to say?"></textarea>
	<hr>
		<input type="submit" name="post" id="post_button" value="Post">
	<hr>

	</form>
	
	
	<div class="posts_area"></div>
	<img id='loading'src="assets/images/icons/loading.gif">
	

	<script>
	var userLoggedIn='<?php echo $userLoggedIn; ?>';
	
	$(document).ready(function(){
		$('#loading').show();


		//original ajax request for loading first posts
		$.ajax({
			url:"includes/handlers/ajax_load_posts.php",
			type:"POST",
			data:"page=1&userLoggedIn=" + userLoggedIn,
			cache: false,

			sucess:function(data){
				$('#loading').hide();
				$('.posts_area').html(data);
			}

		});

		$(window).scroll(function(){
			var height=$('.posts_area').height();//div contianing Post
			var scroll_top=$(this).scrollTop();
			var page=$('.posts_area').find('.nextPage').val();
			var noMorePosts=$('.posts_area').find('.noMorePosts').val();

			if((document.body.scrollHeight==document.body.scrollTop + window.innerHeight) && noMorePosts=='false'){
				$('#loading').show();

					//original ajax request for loading first posts
				var ajaxReq=$.ajax({
					url:"includes/handlers/ajax_load_posts.php",
					type:"POST"
					data:"page="+page + "&userLoggedIn=" + userLoggedIn,
					cache: false,

					sucess:function(response){
						$('.posts_area').find('.nextPage').remove();//removes current .nextpage
						$('.posts_area').find('.noMorePosts').remove();//removes current .nextpage

						$('#loading').hide();
						$('.posts_area').append(response);
			}

		});
		}//end if 
			return false;
		});// end window. scroll function
	});
	</script>
	</div>
</body>
</html>

