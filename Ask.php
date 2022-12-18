<html>
<head>
<title>Javascript Form Submit Example</title>
<!-- Include JS File Here -->
<script src="assets/js/form.js"></script>
</head>
<body>
<div class="container">
<div class="main">
<form action="submit" method="post" name="ask" id="ask" class="ask" >
<h2>Javascript Form Submit Example</h2>
<label>Name :</label>
<input type="text" name="name" id="name" placeholder="Name" />
<label>Email :</label>
<input type="text" name="email" id="email" placeholder="Valid Email" />
<input type="button" name="submit_id" id="btn_id" value="Submit by Id" onclick="submit_by_id()"/>

</form>
</div>
</div>
</body>
</html>
