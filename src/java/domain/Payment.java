package domain;

import java.io.Serializable;

public class Payment implements Serializable {
    
    private String paymentId;
    private String cardNo;
    private String paymentAmount;
    private String paymentMethod;
    private String createdAt;
    
    public Payment() {
    }

    public Payment(String paymentId, String cardNo, String paymentAmount, String paymentMethod, String createdAt) {
        this.paymentId = paymentId;
        this.cardNo = cardNo;
        this.paymentAmount = paymentAmount;
        this.paymentMethod = paymentMethod;
        this.createdAt = createdAt;
    }

    public String getPaymentId() {
        return paymentId;
    }

    public String getCardNo() {
        return cardNo;
    }

    public String getPaymentAmount() {
        return paymentAmount;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    
    public void setPaymentId(String paymentId) {
        this.paymentId = paymentId;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public void setPaymentAmount(String paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

   
  
    
}
