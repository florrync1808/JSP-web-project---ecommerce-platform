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

    public boolean addProduct(Products product) {
        mgr.persist(product);
        return true;
    }

    public Products findProductByID(String id) {
        try {
            Products product = mgr.find(Products.class, id);
            return product;
        } catch (NoResultException ex) {
            // if no result, then return null
            Products product = null;
            return product;
        }
    }

    public Products findProductByName(String name) {

        try {
            //query that early difined in Products class
            Query q = mgr.createNamedQuery("Products.findByProductName");

            //set the name into the query
            q.setParameter("productName", name);

            //retrieve result
            Products product = (Products) q.getSingleResult();
            return product;

        } catch (NoResultException ex) {
            // if no result, then return null
            Products product = null;
            return product;
        }

    }

    public boolean deleteProduct(String id) {
        Products product = findProductByID(id);
        if (product != null) {
            mgr.remove(product);
            return true;
        }
        return false;
    }

    public List<Products> findAll() {
        List itemList = mgr.createNamedQuery("Products.findAll").getResultList();
        return itemList;
    }

    public boolean updateProduct(Products product) {
        Products tempItem = findProductByID(product.getProductId());
        if (tempItem != null) {
            tempItem.setProductDesc(product.getProductDesc());
            tempItem.setProductPrice(product.getProductPrice());
            return true;
        }
        return false;
    }

}
