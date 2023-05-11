package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CustomerService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CustomerService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addCustomer(Customers customer) {
        mgr.persist(customer);
        return true;
    }

    public Customers findCustomerByCode(String id) {
        Customers customer = mgr.find(Customers.class, id);
        return customer;
    }

    public boolean deleteCustomer(String id) {
        Customers customer = findCustomerByCode(id);
        if (customer != null) {
            mgr.remove(customer);
            return true;
        }
        return false;
    }

    public List<Customers> findAll() {
        List custList = mgr.createNamedQuery("Customers.findAll").getResultList();
        return custList;
    }

    //get count of cust in DB
    public int getDBcustomerCount(){
        List<Customers> custList = this.findAll();
        
        int count = custList.size()+1;
        return count; 
    }
    
    //generate customerID
    public String GenerateCustId(int count){
        String newCustId;
        newCustId = String.format("%s%06d", "CU",count);
        return newCustId;
    }
    
    public boolean updateCustomer(Customers customer) {
        Customers tempItem = findCustomerByCode(customer.getCustomerId());
        if (tempItem != null) {
            tempItem.setName(customer.getName());
            tempItem.setBirthdate(customer.getBirthdate());
            tempItem.setContactNo(customer.getContactNo());
            tempItem.setEmail(customer.getEmail());
            tempItem.setPassword(customer.getPassword());
            tempItem.setLine1(customer.getLine1());
            tempItem.setLine2(customer.getLine2());
            tempItem.setState(customer.getState());
            tempItem.setCity(customer.getCity());
            tempItem.setPostcode(customer.getPostcode());
            return true;
        }
        return false;
    }
    
   
}
