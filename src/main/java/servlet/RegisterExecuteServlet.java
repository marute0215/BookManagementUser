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
 * Servlet implementation class RegisterExecuteServlet
 */
@WebServlet("/RegisterExecuteServlet")
public class RegisterExecuteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterExecuteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mail = request.getParameter("email");
		String surname = request.getParameter("surname");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		
		String pw = request.getParameter("pw");
		
		User user_account = new User(-1, mail, surname, name, address, null, pw, null);
		
		// セッションスコープのインスタンス取得
		HttpSession session = request.getSession();
		
		// セッションスコープに値の保存
		// 第1引数：キー
		// 第2引数：保存する値
		session.setAttribute("input_data", user_account);
		
		// セッションスコープのインスタンス取得
		HttpSession session1 = request.getSession();

		// 入力データの取得
		User account1 = (User)session1.getAttribute("input_data");
		
		// 登録処理
		int result = UserDAO.registerAccount(account1);
		
		String path = "";
		if(result == 1) {
			// 登録に成功したので、sessionのデータを削除
			session1.removeAttribute("input_data");
			
			path = "WEB-INF/view/user_menu.jsp";
		} else {
			// 失敗した場合はパラメータ付きで登録画面に戻す
			path = "WEB-INF/view/user_register-form.jsp?error=1";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
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
