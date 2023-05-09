package model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;
import java.util.*;

public class ReportService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public ReportService(EntityManager mgr) {
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

    public List<OrderLists> findOrderListAll() {
        List itemList = mgr.createNamedQuery("OrderLists.findAll").getResultList();
        return itemList;
    }

    public TreeMap<String, Integer> calculateQtyofProduct() {

        TreeMap<String, Integer> productSalesCount = new TreeMap();
        List<Products> products = this.findAll();
        List<OrderLists> prod = this.findOrderListAll();

        for(Products product : products){
        System.out.println(product.getProductId());
            productSalesCount.put(product.getProductId(), 0);
        }


        for (OrderLists p : prod) {

            System.out.println(p.getProductId().getProductId());

            String productId = p.getProductId().getProductId();
            if (productSalesCount.containsKey(productId)) {
                productSalesCount.put(productId, productSalesCount.get(productId) + 1);
            }
        }
        
        
        return productSalesCount;
    }

    
 
            
            
            }
