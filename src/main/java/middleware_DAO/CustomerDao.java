package middleware_DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import backend_DTO.CustomerData;

public class CustomerDao {

	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dev");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();
	
	public void save(CustomerData customerData) {
		entityTransaction.begin();
		entityManager.persist(customerData);
		entityTransaction.commit();
	}
	public void update(CustomerData customerData) {
		entityTransaction.begin();
		entityManager.merge(customerData);
		entityTransaction.commit();
	}
	public List<CustomerData> checkingEmail(String email) {
		return entityManager.createQuery("select a from CustomerData a where customerEmail = ?1", CustomerData.class).setParameter(1, email).getResultList();
	}
	public List<CustomerData> checkingPhoneNumber(long phoneNumber){
		return entityManager.createQuery("select a from CustomerData a where customerNumber = ?1", CustomerData.class).setParameter(1, phoneNumber).getResultList();
	}
	public List<CustomerData> checkRows() {
		return entityManager.createQuery("select a from CustomerData a", CustomerData.class).getResultList();
	}
}
