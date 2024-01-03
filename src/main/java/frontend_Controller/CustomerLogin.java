package frontend_Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backend_DTO.CustomerData;
import middleware_DAO.CustomerDao;

@SuppressWarnings("serial")
@WebServlet("/CustomerLogin")
public class CustomerLogin extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//Get the parameters from Login Form
		String email = req.getParameter("customerEmail");
		String password = req.getParameter("customerPassword");
		
		//Session Tracking
		HttpSession session = req.getSession();
		
		//Creating customer Table Object
		CustomerDao customerDao = new CustomerDao();
		List<CustomerData> customers = customerDao.checkRows();
		//Login logic
		for(CustomerData customer: customers) {
			
			if(customer.getCustomerEmail().equals(email)) {
				if(customer.getCustomerPassword().equals(password)) {
					/*Sessions required to redirect data to a different webPage*/
					session.setAttribute("customer", customer);
					session.setAttribute("userName", customer.getCustomerName());
					resp.sendRedirect("userHome2.jsp");
				}
				else {
					session.setAttribute("message", "Incorrect Password");
					req.getRequestDispatcher("homePage.jsp").include(req, resp);
				}
			}
			else {
				session.setAttribute("messageUsername", "Incorrect email ID");
				req.getRequestDispatcher("homePage.jsp").include(req, resp);
			}
		}
	}
}