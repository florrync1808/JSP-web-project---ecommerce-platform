
package model;

public class ProductOfOrderList {
    private String orderId;
    private String createdAt;
    private String productPhoto;
    private String productId;
    private String productName;
    private String productPrice;
    private String orderQty;
    private String paymentAmt;
    private String description;

    public ProductOfOrderList() {
    }

    public ProductOfOrderList(String orderId, String createdAt, String productPhoto, String productId, String productName, String productPrice, String orderQty, String paymentAmt, String description) {
        this.orderId = orderId;
        this.createdAt = createdAt;
        this.productPhoto = productPhoto;
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.orderQty = orderQty;
        this.paymentAmt = paymentAmt;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
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
