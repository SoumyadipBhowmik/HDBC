package backend_DTO;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

@Entity
public class BankAccount{
	
	@Id
	@GeneratedValue(generator = "accountnum")
	@SequenceGenerator(allocationSize = 1, name = "accountnum", initialValue = 9088, sequenceName = "accountnum")
	private long accountNumber;
	
	private String accountType;
	
	private boolean status;
	
	private double accountLimit;
	
	private double balance;
	
	@ManyToOne
	private CustomerData customer;

	public long getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public double getAccountLimit() {
		return accountLimit;
	}

	public void setAccountLimit(double accountLimit) {
		this.accountLimit = accountLimit;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public CustomerData getCustomer() {
		return customer;
	}

	public void setCustomer(CustomerData customer) {
		this.customer = customer;
	}

}
