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
import backend_DTO.CustomerData;
import middleware_DAO.BankDao;
import middleware_DAO.CustomerDao;

@SuppressWarnings("serial")
@WebServlet("/accountType")
public class BankCreation extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		/*Entering the user input bank type for creation*/
		String bankType = req.getParameter("param");
		
		HttpSession session = req.getSession();
		
		/*Creating important objects/variables of bank account,
		 *customer and bank data access APIs*/
		CustomerData customerInfo = (CustomerData) session.getAttribute("customer");
			
		BankDao bankdao = new BankDao();

		/*List of Bank accounts present inside the Customer Table*/
		List<BankAccount> accounts = customerInfo.getBankAccounts();
		
		/*Represents whether bank account type is already present*/
		boolean available = true;
		
		for(BankAccount account : accounts) {
			if(account.getAccountType().equals(bankType)) {
				available = false;
				break;
			}
		}
		if(available) {
			BankAccount newAccount = new BankAccount();
			/*If slot's available, then insert that particular user bank type when clicked*/
			
			newAccount.setAccountType(bankType);

			if(newAccount.getAccountType().equals("current"))
				newAccount.setAccountLimit(500000);
			else
				newAccount.setAccountLimit(100000);
			
			newAccount.setCustomer(customerInfo);
			bankdao.save(newAccount);
			
			/*Why*/
			List<BankAccount> accountTypes = accounts;
			accountTypes.add(newAccount);
			
			customerInfo.setBankAccounts(accountTypes);
			
			CustomerDao customerDao = new CustomerDao();
			customerDao.update(customerInfo);
			
			System.out.println("Account created");
			resp.sendRedirect("adminclearance.jsp");
		}
		else {
			List <BankAccount> createdAccounts = customerInfo.getBankAccounts();
			
			for(BankAccount createdAccount : createdAccounts) {
				if(createdAccount.getAccountType().equals(bankType)) {
					if(createdAccount.isStatus()) {
						session.setAttribute("currentUser", createdAccount);
						req.getRequestDispatcher("userdashboard.jsp").forward(req, resp);
					}
					else {						
						resp.sendRedirect("adminclearance.jsp");
					}
				}
			}
		}
	}
}
