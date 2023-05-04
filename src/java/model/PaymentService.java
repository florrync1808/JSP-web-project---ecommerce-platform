/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author End User
 */
public class PaymentService {
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public PaymentService(EntityManager mgr) {
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
    
    public Customers findCustomerDetails(String code) {
        Customers c = mgr.find(Customers.class, code);
        return c;
    }
    
    public CardProfiles findCard(String custId){
        CardProfiles card = mgr.find(CardProfiles.class, custId);
        return card;
    }
    
    
}
