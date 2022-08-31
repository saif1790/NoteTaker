<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- adding css and java script file -->
<%@include file="all_js_css.jsp"%>

<title>Note Taker</title>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<br>
		<div class="container text-center">
			<div class="card shadow bg-white py-5">
				<img alt="" class="img-fluid mx-auto " src="img/notes.png"
					style="max-width: 400px;">

				<h1 class="text-center text-primary text-uppercase mt-3">Start
					Taking your Notes</h1>
				<div class="container">
					<a href="addNote.jsp" class="btn btn-primary">Start Here</a>
				</div>
			</div>

		</div>

	</div>





</body>
</html>