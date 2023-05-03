
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;


public class ProductService {
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ProductService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Products item) {
        mgr.persist(item);
        return true;
    }

    public Products findItemByCode(String code) {
        Products item = mgr.find(Products.class, code);
        return item;
    }

    public boolean deleteItem(String code) {
        Products item = findItemByCode(code);
        if (item != null) {
            mgr.remove(item);
            return true;
        }
        return false;
    }

    public List<Products> findAll() {
        List itemList = mgr.createNamedQuery("Products.findAll").getResultList();
        return itemList;
    }

    public boolean updateItem(Products item) {
        Products tempItem = findItemByCode(item.getProductId());
        if (tempItem != null) {
            tempItem.setProductDesc(item.getProductDesc());
            tempItem.setProductPrice(item.getProductPrice());
            return true;
        }
        return false;
    }
}
