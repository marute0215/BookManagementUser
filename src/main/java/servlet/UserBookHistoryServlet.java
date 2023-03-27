package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import dto.BookLendingList;
import dto.User;

/**
 * Servlet implementation class UserBookHistoryServlet
 */
@WebServlet("/UserBookHistoryServlet")
public class UserBookHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserBookHistoryServlet() {
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
		
		String mail = ac.getMail();
		
		List<BookLendingList> bookhistoryList = UserDAO.SelectAllBookHistory(mail);
		
		int result = 0;
		
		// 取得したリストをリクエストスコープに保管(JSPに渡すため)
		request.setAttribute("bookhistoryList",bookhistoryList);
		
		String view = "";
		if(result==0) {
			view = "WEB-INF/view/user-book_historyList.jsp";

		}else {
			view = "WEB-INF/view/search_fail.jsp";
		}
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
