
package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

public class OrderStatusesService {
    
    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public OrderStatusesService() {
    }

    public OrderStatusesService(EntityManager mgr, Query query) {
        this.mgr = mgr;
        this.query = query;
    }
    
    public OrderStatusesService(EntityManager mgr) {
        this.mgr = mgr;
    }
    
    public List<OrderStatuses> findAll() {
        List itemList = mgr.createNamedQuery("Order_Statuses.findAll").getResultList();
        return itemList;
    }
}
