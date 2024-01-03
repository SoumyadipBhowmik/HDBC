package frontend_Controller;

import java.util.List;

import backend_DTO.CustomerData;
import middleware_DAO.CustomerDao;


public class Counter{
	
	String customerCount(){
		int countCustomer = 0;
		
		CustomerDao customerLogics = new CustomerDao();
		List<CustomerData> customers = customerLogics.checkRows();
		
		for(CustomerData customer: customers) {
			if(!String.valueOf(customer.getCustomerID()).equals(null))
				countCustomer++;				
		}
		return String.valueOf(countCustomer);
	}
	String maleCount() {
		int countMale = 0;
		CustomerDao customerLogics = new CustomerDao();
		List<CustomerData> customers = customerLogics.checkRows();
		
		for(CustomerData customer: customers) {
			if(customer.getGender().equals("male")) {
				countMale++;
			}
		}
		return String.valueOf(countMale);
	}
	String femaleCount() {
		int countFemale = 0;
		CustomerDao customerLogics = new CustomerDao();
		List<CustomerData> customers = customerLogics.checkRows();
		
		for(CustomerData customer: customers) {
			if(!customer.getGender().equals("male")) {
				countFemale++;
			}
		}
		return String.valueOf(countFemale);
		
	}
	
}
