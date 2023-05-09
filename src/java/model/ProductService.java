package model;


import java.util.ArrayList;
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

    public boolean deleteProduct(Products product) {
        Products tempItem = findProductByID(product.getProductId());
        if (tempItem != null) {
            tempItem.setProductName(product.getProductName());
            tempItem.setProductPrice(product.getProductPrice());
            tempItem.setProductDesc(product.getProductDesc());
            tempItem.setProductPhoto(product.getProductPhoto());
            tempItem.setCreatedAt(product.getCreatedAt());
            tempItem.setDeletedAt(product.getDeletedAt());
            return true;
        }
        return false;
    }

    public List<Products> findAll() {
        List itemList = mgr.createNamedQuery("Products.findAll").getResultList();
        return itemList;
    }
    
    public List<Products> findMatchingForSearch(String userInput) {
        List<Products> allProd = mgr.createNamedQuery("Products.findAll").getResultList();
        List<Products> matchingProd = new ArrayList<Products>();
        for (Products prod: allProd) {
            
            if (prod.getProductId().equalsIgnoreCase("FREEGIFT")){}
            else if (prod.getProductName().contains(userInput) || prod.getProductId().contains(userInput) ){
            matchingProd.add(prod);
            }
        }
        return matchingProd;
    }
    
    
    public boolean updateProduct(Products product) {
        Products tempItem = findProductByID(product.getProductId());
        if (tempItem != null) {
            tempItem.setProductName(product.getProductName());
            tempItem.setProductPrice(product.getProductPrice());
            tempItem.setProductDesc(product.getProductDesc());
            tempItem.setProductPhoto(product.getProductPhoto());
            tempItem.setCreatedAt(product.getCreatedAt());
            return true;
        }
        return false;
    }
}
