package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class CartListService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public CartListService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(CartLists item) {
        mgr.persist(item);
        return true;
    }

    public CartLists findItemByCode(String code) {
        CartLists item = mgr.find(CartLists.class, code);
        return item;
    }

    public boolean deleteItem(String code) {
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

    public boolean updateItem(Customers item) {
        CartLists tempItem = findItemByCode(item.getCustomerId());
        if (tempItem != null) {
//            tempItem.setDescription(item.getDescription());
//            tempItem.setPrice(item.getPrice());
            return true;
        }
        return false;
    }
}
