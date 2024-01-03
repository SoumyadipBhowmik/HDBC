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
@WebServlet("/depositMoney")
public class DepositAmount extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		BankDao bankDao = new BankDao();
		
		//Getting the new deposited amount and then converting it into Number value
		String depositedAmountInString = req.getParameter("deposit");
		double depositedAmount = Double.parseDouble(depositedAmountInString);
		
		//Getting the current user details to add or remove data
		List<BankAccount> accounts = bankDao.fetchBank();
		BankAccount currentUser = (BankAccount) session.getAttribute("currentUser");
		double newBalance;
		for(BankAccount account: accounts) {
			if(account.getAccountNumber() == currentUser.getAccountNumber()) {
				System.out.println(account.getCustomer().getCustomerEmail());
				newBalance = account.getBalance() + depositedAmount;
				account.setBalance(newBalance);
				bankDao.update(account);
				session.setAttribute("currentUser", account);
			}
			req.getRequestDispatcher("userdashboard.jsp").forward(req, resp);
		}
	}
}
