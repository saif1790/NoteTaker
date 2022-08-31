<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<br>
          <h1 class="text-center">Edit Note</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("noteId").trim());
		Session session2 = FactoryProvider.getFactory().openSession();
		Note note = (Note) session2.get(Note.class, noteId);
		System.out.print(note.getContent());
		%>
		<div class="container">
		<div class="col col-md-4 offset-md-4">
			<form action="UpdateNote?noteId=<%=noteId%>" method="post">
				<div class="form-group">
					<label for="exampleInputEmail1">Note Title</label> <input
						type="text" class="form-control" id="title" name="title"
						aria-describedby="emailHelp" placeholder="Enter Title"
						required="required" value="<%=note.getTitle()%>" />
				</div>
				<div class="form-group">
					<label for="content">Note Content</label>
					<textarea class="form-control" id="content" name="titleContent"
						placeholder="Enter Content" style="height: 300px;"
						required="required"><%=note.getContent()%></textarea>
				</div>
				<div class="container text-center">
					<a href="a.jsp" class="btn btn-success text-center"><span><img
							src="img/back.png" style="max-width: 25px;"></span> Back</a>
					<button type="submit" class="btn btn-success text-center">
						<span><img src="img/save1.png" style="max-width: 25px;"></span>
						Save Changes
					</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
</html>