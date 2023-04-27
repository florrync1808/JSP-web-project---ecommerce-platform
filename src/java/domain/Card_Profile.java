package domain;

import java.io.Serializable;

public class Card_Profile implements Serializable {
    private String cardNo;
    private String customerId;
    private String ccvNo;
    private String expiryMonth;
    private String expiryYear;
    
    public Card_Profile() {
    }

    public Card_Profile(String cardNo, String customerId, String ccvNo, String expiryMonth, String expiryYear) {
        this.cardNo = cardNo;
        this.customerId = customerId;
        this.ccvNo = ccvNo;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
    }

    public String getCardNo() {
        return cardNo;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getCcvNo() {
        return ccvNo;
    }

    public String getExpiryMonth() {
        return expiryMonth;
    }

    public String getExpiryYear() {
        return expiryYear;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setCcvNo(String ccvNo) {
        this.ccvNo = ccvNo;
    }

    public void setExpiryMonth(String expiryMonth) {
        this.expiryMonth = expiryMonth;
    }

    public void setExpiryYear(String expiryYear) {
        this.expiryYear = expiryYear;
    }

  
    
}
