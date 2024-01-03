package frontend_Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backend_DTO.BankAccount;
import middleware_DAO.BankDao;


class AdminCredentials{
	private String AdminID = "admin";
	private String AdminPass = "admin@123";
	
	public String getAdminID() {
		return AdminID;
	}
	public String getAdminPass() {
		return AdminPass;
	}		
}

@SuppressWarnings("serial")
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession = req.getSession();
		BankDao bankDao = new BankDao();
		
		String adminID = req.getParameter("adminID");
		String adminPassword = req.getParameter("adminPassword");
		Counter customerCount = new Counter();
		
		AdminCredentials admin = new AdminCredentials();
		if(!admin.getAdminID().equals(adminID)) {
			httpSession.setAttribute("messageID", "Incorrect Admin ID.");
			resp.sendRedirect("homePage.jsp");
		}
		else if(!admin.getAdminPass().equals(adminPassword)) {
			httpSession.setAttribute("messagePass", "Incorrect Admin Password.");
			req.getRequestDispatcher("homePage.jsp").include(req, resp);
		}
		else if(!admin.getAdminID().equals(adminID) && !admin.getAdminPass().equals(adminPassword)) {
			httpSession.setAttribute("messageID", "Incorrect Admin ID.");
			httpSession.setAttribute("messagePass", "Incorrect Admin Password.");
			req.getRequestDispatcher("homePage.jsp").include(req, resp);
		}
		else {
			List<BankAccount> accounts = bankDao.fetchBank();
			httpSession.setAttribute("accounts", accounts);
			httpSession.setAttribute("userName", customerCount.femaleCount());
			httpSession.setAttribute("message", customerCount.maleCount());
			httpSession.setAttribute("count", customerCount.customerCount());
			req.getRequestDispatcher("adminhome.jsp").include(req, resp);
		}
	}
}
