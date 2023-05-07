/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author End User
 */
public class ProductOfOrderList {
    private String orderId;
    private String createdAt;
    private String productPhoto;
    private String productId;
    private String productName;
    private String productPrice;
    private String orderQty;
    private String paymentAmt;

    public ProductOfOrderList() {
    }
    
    

    public ProductOfOrderList(String orderId, String createdAt, String productPhoto, String productId, String productName, String productPrice, String orderQty, String paymentAmt) {
        this.orderId = orderId;
        this.createdAt = createdAt;
        this.productPhoto = productPhoto;
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.orderQty = orderQty;
        this.paymentAmt = paymentAmt;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(String orderQty) {
        this.orderQty = orderQty;
    }

    public String getPaymentAmt() {
        return paymentAmt;
    }

    public void setPaymentAmt(String paymentAmt) {
        this.paymentAmt = paymentAmt;
    }
    
    
}
