package dao;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dto.BookLendingList;
import dto.ToshoExam;
import dto.User;
import dto.UserMouth;
import util.GenerateHashedPw;
import util.GenerateSalt;

public class UserDAO {

	private static Connection getConnection() throws URISyntaxException, SQLException {
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	    URI dbUri = new URI(System.getenv("DATABASE_URL"));

	    String username = dbUri.getUserInfo().split(":")[0];
	    String password = dbUri.getUserInfo().split(":")[1];
	    String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath();

	    return DriverManager.getConnection(dbUrl, username, password);
	}
	
	public static int registerAccount(User user_account) {
		String sql = "INSERT INTO user_management VALUES(default, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		
		// ランダムなソルトの取得(今回は32桁で実装)
		String salt = GenerateSalt.getSalt(32);
		
		// 取得したソルトを使って平文PWをハッシュ
		String hashedPw = GenerateHashedPw.getSafetyPassword(user_account.getPassword(), salt);
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			
			pstmt.setString(1, user_account.getMail());
			pstmt.setString(2, user_account.getSurname());
			pstmt.setString(3, user_account.getName());
			pstmt.setString(4, user_account.getAddress());
			pstmt.setString(5, salt);
			pstmt.setString(6, hashedPw);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
	// メールアドレスを元にソルトを取得
	public static String getSalt(String mail) {
		String sql = "SELECT salt FROM user_management WHERE mail = ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mail);

			try (ResultSet rs = pstmt.executeQuery()){
				
				if(rs.next()) {
					String salt = rs.getString("salt");
					return salt;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ログイン処理
	public static User login(String mail, String hashedPw) {
		String sql = "SELECT * FROM user_management WHERE mail = ? AND password = ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mail);
			pstmt.setString(2, hashedPw);

			try (ResultSet rs = pstmt.executeQuery()){
				
				if(rs.next()) {
					int id = rs.getInt("user_id");
					String surname = rs.getString("surname");
					String name = rs.getString("name");
					String address = rs.getString("address");
					String salt = rs.getString("salt");
					
					
					return new User(id, mail, surname, name, address, salt, null, null);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static List<ToshoExam> selectAlllibrary() {
		
		// 返却用変数
		List<ToshoExam> result = new ArrayList<>();

		String sql = "SELECT * FROM book";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					
					int id = rs.getInt("id");
					String name = rs.getString("name");
					String publisher = rs.getString("publisher");
					String isbn = rs.getString("isbn");
					String author = rs.getString("author");
					String new_old = rs.getString("new_old");
					String house = rs.getString("house");
					//int account_id = rs.getInt("account_id");
					//String salt = rs.getString("salt");
					//String password = rs.getString("password");
					
					ToshoExam Ac = new ToshoExam(id, name, publisher, isbn, author, new_old, house);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
	}
	
	public static List<ToshoExam> selectAllBook(String name) {
		
		// 返却用変数
		List<ToshoExam> result = new ArrayList<>();

		String sql = "SELECT * FROM book WHERE name like ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, "%"+name+"%");
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					int id = rs.getInt("id");
					String book_name = rs.getString("name");
					String publisher = rs.getString("publisher");
					String isbn = rs.getString("isbn");
					String author = rs.getString("author");
					String new_old = rs.getString("new_old");
					String house = rs.getString("house");
					//int account_id = rs.getInt("account_id");
					//String salt = rs.getString("salt");
					//String password = rs.getString("password");
					
					ToshoExam Ac = new ToshoExam(id, book_name, publisher, isbn, author, new_old, house);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
	
	public static int updateBook(String new_old, String isbn) {

		// 発行するSQL
		// ? はプレースホルダといいます。
		// 後の処理で ? に値を埋め込みます。(SQLインジェクション対策)
		String sql = "UPDATE book SET new_old=? WHERE isbn=?";
		
		// 更新件数を格納する変数
		int result = 0;

		try (
				Connection con = getConnection();	// DB接続
				PreparedStatement pstmt = con.prepareStatement(sql);			// 構文解析
				){
			
			// プレースホルダに値を設定(型によってメソッドが違います。)
			// 第1引数：何番目の ? に設定するか(1から数える)
			// 第2引数：設定する値
			
			pstmt.setString(1,new_old);
			pstmt.setString(2,isbn);
			
			// SQLの実行(戻り値は更新件数)
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
	public static List<BookLendingList> SelectAllBookHistory(String mail) {
		// 返却用変数
		List<BookLendingList> result = new ArrayList<>();

		String sql = "select book.name as book_name, book.isbn,\r\n"
				+ "user_management.surname, user_management.name, user_management.mail,\r\n"
				+ "TO_CHAR(book_lending.borrow_date, 'YYYY/MM/DD HH24:MI') as borrow_date, \r\n"
				+ "TO_CHAR(book_lending.return_date, 'YYYY/MM/DD HH24:MI') as return_date, \r\n"
				+ "book_lending.due_date, book_lending.user_id, book_lending.book_id \r\n"
				+ "from ( book_lending inner join user_management on book_lending.user_id = user_management.user_id )\r\n"
				+ "inner join book on book_lending.book_id = book.id where mail = ? order by due_date desc;";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setString(1, mail);
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					String book_name = rs.getString("book_name");
					String isbn = rs.getString("isbn");
					String suruser = rs.getString("surname");
					String name = rs.getString("name");
					String borrow_date = rs.getString("borrow_date");
					String due_date = rs.getString("due_date");
					int user_id = rs.getInt("user_id");
					int book_id = rs.getInt("book_id");
					String return_date = rs.getString("return_date");
					
					BookLendingList Ac = new BookLendingList(book_name, isbn, suruser, name, mail, borrow_date, due_date, user_id, book_id, return_date);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
	
	public static int BookMouthRegister(int book_id, int user_id, String comment, int assessment) {
		String sql = "INSERT INTO book_mouth VALUES(default, ?, ?, ?, ?, current_timestamp)";
		int result = 0;
				
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){

				pstmt.setInt(1, book_id);
			    pstmt.setInt(2, user_id);
				pstmt.setString(3, comment);
				pstmt.setInt(4, assessment);
				
				result = pstmt.executeUpdate();
	
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} finally {
			System.out.println(result + "件更新しました。");
		}
		return result;
	}
	
    public static List<UserMouth> SelectLimitMouth() {
		
		// 返却用変数
		List<UserMouth> result = new ArrayList<>();

		String sql = "select book.name as book_name, user_management.surname,\r\n"
				+ "book_mouth.word_mouth, book_mouth.assessment,\r\n"
				+ "TO_CHAR(book_mouth.created_at, 'YYYY/MM/DD HH24:MI') as created_at\r\n"
				+ "from ( book_mouth inner join book on book_mouth.book_id = book.id )\r\n"
				+ "inner join user_management on book_mouth.user_id = user_management.user_id where assessment > 2 order by created_at desc limit 10";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			try (ResultSet rs = pstmt.executeQuery()){
				while(rs.next()) {
					
					
					String book_name = rs.getString("book_name");
					String surname = rs.getString("surname");
					String word_mouth = rs.getString("word_mouth");
					int assessment = rs.getInt("assessment");
					String created_at = rs.getString("created_at");
					
					UserMouth Ac = new UserMouth(book_name, surname, word_mouth, assessment, created_at);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
	}
    
    public static List<UserMouth> SelectBookMouth(int id) {
		// 返却用変数
		List<UserMouth> result = new ArrayList<>();

		String sql = "select book.name as book_name, user_management.surname,\r\n"
				+ "book_mouth.word_mouth, book_mouth.assessment,\r\n"
				+ "TO_CHAR(book_mouth.created_at, 'YYYY/MM/DD HH24:MI') as created_at\r\n"
				+ "from ( book_mouth inner join book on book_mouth.book_id = book.id )\r\n"
				+ "inner join user_management on book_mouth.user_id = user_management.user_id where book_mouth.book_id = ?";
		
		try (
				Connection con = getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql);
				){
			pstmt.setInt(1, id);
			try (ResultSet rs = pstmt.executeQuery()){
				
				while(rs.next()) {
					String book_name = rs.getString("book_name");
					String surname = rs.getString("surname");
					String word_mouth = rs.getString("word_mouth");
					int assessment = rs.getInt("assessment");
					String created_at = rs.getString("created_at");
					
					UserMouth Ac = new UserMouth(book_name, surname, word_mouth, assessment, created_at);
					
					result.add(Ac);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (URISyntaxException e) {
			e.printStackTrace();
		}

		// Listを返却する。0件の場合は空のListが返却される。
		return result;
   }
}