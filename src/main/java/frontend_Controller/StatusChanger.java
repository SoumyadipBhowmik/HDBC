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

@SuppressWarnings("serial")
@WebServlet("/statusChange")
public class StatusChanger extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String AccountNumber = req.getParameter("param");
		long accountNumber = Long.parseLong(AccountNumber);
		
		BankDao bankDao = new BankDao();
		BankAccount bankAccount = bankDao.refNumber(accountNumber);
		
		System.out.println("It was: " + bankAccount.isStatus());
		if(bankAccount.isStatus()) {
			bankAccount.setStatus(false);
		}
		else {
			bankAccount.setStatus(true);
		}
		bankDao.update(bankAccount);
		System.out.println("It is now: " + bankAccount.isStatus());
		
		List<BankAccount> accountList = bankDao.fetchBank();
		session.setAttribute("accountList", accountList);
		
		req.getRequestDispatcher("adminhome.jsp").include(req, resp);
	}
}
