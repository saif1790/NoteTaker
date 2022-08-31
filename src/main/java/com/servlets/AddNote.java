package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class AddNote extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddNote() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		String title = request.getParameter("title");
		String titleContent = request.getParameter("titleContent");

		Note note = new Note(title, titleContent, new Date());
		/*
		 * out.print(title); out.print(titleContent);
		 * System.out.println(note.getId()+" "+ note.getTitle() );
		 */

		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();

		session.save(note);

		tx.commit();
		
		session.close();
		HttpSession session1 = request.getSession();
		session1.setAttribute("msg", "Note has been successfully saved!!! ");
		response.sendRedirect("addNote.jsp");
	}

}
