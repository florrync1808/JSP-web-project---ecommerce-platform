package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CartListService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CartListService() {
    }

    public CartListService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(CartLists item) {
        mgr.persist(item);
        return true;
    }

    public CartLists findItemByCode(int code) {
        CartLists item = mgr.find(CartLists.class, code);
        return item;
    }

    public boolean deleteItem(int code) {
        CartLists item = findItemByCode(code);
        if (item != null) {
            mgr.remove(item);
            return true;
        }
        return false;
    }

    public List<CartLists> findAll() {
        List itemList = mgr.createNamedQuery("CartLists.findAll").getResultList();
        return itemList;
    }

    public List<CartLists> findCartListbyCustId(String custId) {
        Query q = mgr.createNamedQuery("CartLists.findByCustId");
        q.setParameter(1, custId);
        List itemList = q.getResultList();
        return itemList;
    }

//    public boolean updateItem(Products item, CartLists cartItem, int quantity) {
//        CartLists tempItem = findItemByCode(item.getProductId());
//        if (tempItem != null) {
//            tempItem.setItemQty(quantity+ cartItem.getItemQty());
//            tempItem.setPrice(item.getPrice());
//            return true;
//        }
//        return false;
//    }
}
