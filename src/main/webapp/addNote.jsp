<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-center">Please fill your note details</h1>
		<!--adding note form  -->
		<div class="col col-md-4 offset-md-4">
		<%
		if(session.getAttribute("msg")!=null)
		{
		%>
			<div class="alert alert-success" role="alert">
				<%=session.getAttribute("msg")%>
			</div>
		<%
		}
		%>
			<%
			session.removeAttribute("msg");
			%>
			<form action="AddNote" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">Note Title</label> <input
						type="text" class="form-control" id="title" name="title"
						aria-describedby="emailHelp" placeholder="Enter Title"
						required="required">
				</div>
				<div class="form-group">
					<label for="content">Note Content</label>
					<textarea class="form-control" id="content" name="titleContent"
						placeholder="Enter Content" style="height: 300px;"
						required="required"></textarea>
				</div>
				<div class="container text-center">
					<button type="submit" class="btn btn-primary text-center"><span><img src="img/addNote.png" style="max-width: 25px;"></span> Add
						Note</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>