<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>
	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase text-center">All Notes</h1>
		<div class="row">

			<div class="col-12">

				<%
				Session session1 = FactoryProvider.getFactory().openSession();
				Query query = session1.createQuery("from Note");
				List<Note> noteList = query.list();
				if (noteList.size() == 0) {
				%>

				<div class="container  text-center">
					<div class="card  mt-3">

						<div class="card-body px-5">
							<img alt="" class="img-fluid mx-auto " src="img/empty.png"
								style="max-width: 400px;">
							<h5 class="card-title">Note is not available.</h5>

						</div>
					</div>
				</div>

				<%
				}

				for (Note note : noteList) {
				%>
				<div class="container">
					<div class="card  mt-3">
						<img class="card-img-top m-3 text-center mx-auto"
							style="max-width: 50px;" src="img/notes.png" alt="Card image cap">
						<div class="card-body px-5">
							<h5 class="card-title"><%=note.getTitle()%></h5>
							<p class="card-text"><%=note.getContent()%></p>
							<p class="text-primary text-right">
								<b><%=note.getAddedDate()%></b>
							</p>
							<div class="container text-center">
								<a href="DeleteNote?noteId=<%=note.getId()%>"
									class="btn btn-danger"><span><img
										src="img/delete.png" style="max-width: 25px;"></span> Delete</a> <a
									href="editNote.jsp?noteId=<%=note.getId()%>"
									class="btn btn-primary"><span><img
										src="img/edit.png" style="max-width: 25px;"></span>Edit Note</a>
							</div>
						</div>
					</div>
				</div>
				<%
				}

				session1.close();
				%>
			</div>

		</div>



	</div>


</body>
</html>


<!-- <button onclick="document.getElementById('id01').style.display='block'">Open
	Modal</button>

<div id="id01" class="modal">
	<span onclick="document.getElementById('id01').style.display='none'"
		class="close" title="Close Modal">&times;</span>
	<form class="modal-content" action="/action_page.php">
		<div class="container">
			<h1>Delete Account</h1>
			<p>Are you sure you want to delete your account?</p>

			<div class="clearfix">
				<button type="button" class="cancelbtn">Cancel</button>
				<button type="button" class="deletebtn">Delete</button>
			</div>
		</div>
	</form>
</div> -->