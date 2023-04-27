package domain;

import java.io.Serializable;
import java.util.Objects;

public class Customer implements Serializable {
    private String customerId;
    private String fullName;
    private String birthDate;
    private String contactNo;
    private String email;
    private String password;
    private String createdAt;
    
    public Customer() {
    }

    public Customer(String customerId, String fullName, String birthDate, String contactNo, String email, String password, String createdAt) {
        this.customerId = customerId;
        this.fullName = fullName;
        this.birthDate = birthDate;
        this.contactNo = contactNo;
        this.email = email;
        this.password = password;
        this.createdAt = createdAt;
    }

    public String getCustomerId() {
        return customerId;
    }

    public String getFullName() {
        return fullName;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public String getContactNo() {
        return contactNo;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }
    
}
