package frontend_Controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import backend_DTO.CustomerData;
import middleware_DAO.CustomerDao;

@SuppressWarnings("serial")
@WebServlet("/createAccount")
public class CustomerSignUp extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//Getting the values from the Create Account Form
		String name = req.getParameter("createName");
		String number = req.getParameter("createPhoneNumber");
		String email = req.getParameter("createEmail");
		String password = req.getParameter("createPassword");
		String gender = req.getParameter("createGender");
		String dateOfBirth = req.getParameter("createDob");
		
		//Parsing phone number
		Long phoneNumber = Long.parseLong(number);
		
		//Getting date and getting age
		Date date = Date.valueOf(dateOfBirth);
		Period period = Period.between(date.toLocalDate(), LocalDate.now());
		int age = period.getYears();
		
		//Getting all the objects(DTO and DAO and HttpSession)
		CustomerData customerData = new CustomerData();
		CustomerDao customerDao = new CustomerDao();
		HttpSession httpSession = req.getSession();
		
		//Checking eligibility
		if(age < 18) {
			httpSession.setAttribute("message", "You are not eligible to open an account.");
			resp.sendRedirect("homePage.jsp");
		}
		else {
			if(!customerDao.checkingEmail(email).isEmpty() || !customerDao.checkingPhoneNumber(phoneNumber).isEmpty()) {
				httpSession.setAttribute("message", "Account already exists. Please login");
				resp.sendRedirect("homePage.jsp");
			}
			else {
				//setting all the data
				customerData.setCustomerName(name);
				customerData.setCustomerNumber(phoneNumber);
				customerData.setCustomerEmail(email);
				customerData.setCustomerPassword(password);
				customerData.setGender(gender);
				customerData.setDob(date);
				
				//Saving the table and showing success message
				customerDao.save(customerData);
				httpSession.setAttribute("message", "Account has been created successfully.");
				resp.sendRedirect("homePage.jsp");
			}
		}	
	}
}