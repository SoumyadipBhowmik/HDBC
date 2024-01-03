package middleware_DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import backend_DTO.BankAccount;

public class BankDao {

	EntityManagerFactory entityManagerFactory = Persistence.createEntityManagerFactory("dev");
	EntityManager entityManager = entityManagerFactory.createEntityManager();
	EntityTransaction entityTransaction = entityManager.getTransaction();
	
	public void save(BankAccount bankAccounts) {
		entityTransaction.begin();
		entityManager.persist(bankAccounts);
		entityTransaction.commit();
	}
	public void update(BankAccount account) {
		entityTransaction.begin();
		entityManager.merge(account);
		entityTransaction.commit();
	}
	public List<BankAccount> fetchBank() {
		return entityManager.createQuery("select a from BankAccount a", BankAccount.class).getResultList();
	}
	public BankAccount refNumber(long reference) {
		return entityManager.createQuery("select a from BankAccount a where accountNumber = ?1", BankAccount.class).setParameter(1, reference).getSingleResult();
	}
}
