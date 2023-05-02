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

    public boolean addItem(Customers item) {
        mgr.persist(item);
        return true;
    }

    public Customers findItemByCode(String code) {
        Customers item = mgr.find(Customers.class, code);
        return item;
    }

    public boolean deleteItem(String code) {
        Customers item = findItemByCode(code);
        if (item != null) {
            mgr.remove(item);
            return true;
        }
        return false;
    }

    public List<Customers> findAll() {
        List itemList = mgr.createNamedQuery("Customers.findAll").getResultList();
        return itemList;
    }

//    public boolean updateItem(Item item) {
//        Countryflags tempItem = findItemByCode(item.getCode());
//        if (tempItem != null) {
//            tempItem.setDescription(item.getDescription());
//            tempItem.setPrice(item.getPrice());
//            return true;
//        }
//        return false;
//    }
    
   
}