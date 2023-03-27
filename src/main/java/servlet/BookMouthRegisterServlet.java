package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.User;

/**
 * Servlet implementation class BookMouthRegisterServlet
 */
@WebServlet("/BookMouthRegisterServlet")
public class BookMouthRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookMouthRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		User ac = (User)session.getAttribute("user");
		String book_name = (String)session.getAttribute("book_name");
		int book_id = (int)session.getAttribute("book_id");
		int user_id = ac.getUser_id();
		
		String comment = request.getParameter("comment");
		
		String assessment = request.getParameter("assessment");
		int assessment2 = Integer.parseInt(assessment);
		
		UserDAO.BookMouthRegister(book_id, user_id, comment, assessment2);
		
		String view = "WEB-INF/view/BookMouthRegister-success.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
