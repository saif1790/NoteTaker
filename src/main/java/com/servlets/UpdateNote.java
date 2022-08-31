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

/**
 * Servlet implementation class UpdateNote
 */
public class UpdateNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
        int noteId = Integer.parseInt(request.getParameter("noteId"));
		String title = request.getParameter("title");
		String titleContent = request.getParameter("titleContent");
 

		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		Note note = session.get(Note.class, noteId);
		note.setTitle(title);
		note.setContent(titleContent);
		note.setAddedDate(new Date());
		session.save(note);

		tx.commit();
		
		session.close();
		HttpSession session1 = request.getSession();
		session1.setAttribute("msg", "Note has been updated successfully!!! ");
		out.print("<h1 style='text-align:center;'><a href='a.jsp'>View All Notes</a></h1>");
		response.sendRedirect("allNotes.jsp");
	}

}
