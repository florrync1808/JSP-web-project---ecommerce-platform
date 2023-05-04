package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class StaffsService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public StaffsService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addItem(Staffs item) {
        mgr.persist(item);
        return true;
    }

    public Staffs findItemByCode(String code) {
        Staffs item = mgr.find(Staffs.class, code);
        return item;
    }

    public boolean deleteItem(String code) {
        Staffs item = findItemByCode(code);
        if (item != null) {
            mgr.remove(item);
            return true;
        }
        return false;
    }

    public List<Staffs> findAll() {
        List itemList = mgr.createNamedQuery("Staffs.findAll").getResultList();
        return itemList;
    }

    public boolean updateItem(Staffs item) {
        Staffs tempItem = findItemByCode(item.getStaffId());
        if (tempItem != null) {
            tempItem.setName(item.getName());
            tempItem.setBirthdate(item.getBirthdate());
            return true;
        }
        return false;
    }
}
