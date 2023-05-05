/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;
import java.util.logging.Level;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.validation.ConstraintViolationException;
import org.apache.commons.logging.Log;

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

    public boolean addItem(Payments item) {
        try {

            mgr.persist(item);
        } catch (ConstraintViolationException e) {
            e.getConstraintViolations().forEach(err -> System.out.println(err.toString()));
        } catch (Exception e) {
            System.out.println(e);
        }
        return true;
    }

    public Products findItemByCode(String code) {
        Products item = mgr.find(Products.class, code);
        return item;
    }
    
    public CardProfiles findCardByCode(String code) {
        CardProfiles item = mgr.find(CardProfiles.class, code);
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

    public List<CardProfiles> findAllCardProfile() {
        List cardList = mgr.createNamedQuery("CardProfiles.findAll").getResultList();
        return cardList;
    }

    public List<Customers> findAllCustomer() {
        List cardList = mgr.createNamedQuery("Customers.findAll").getResultList();
        return cardList;
    }
    
    public Customers findCustomerByCode(String custid){
        Customers c = mgr.find(Customers.class, custid);
        return c;
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

    public double getSubtotal(List<Products> productList) {
        double subtotal = 0;
        for (Products p : productList) {
            //incorrect expression
            subtotal += p.getProductPrice() * 3;
        }
        return subtotal;
    }

    public double getShippingFee(double subtotal) {
        if (subtotal > 200) {
            return 0.00;
        } else {
            return 25.00;
        }
    }

    public double getTotal(double shippingFee, double subtotal) {
        return shippingFee + subtotal;
    }

}
