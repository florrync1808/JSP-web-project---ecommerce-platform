/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author New User
 */
@Entity
@Table(name = "CARD_PROFILES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CardProfiles.findAll", query = "SELECT c FROM CardProfiles c"),
    @NamedQuery(name = "CardProfiles.findByCardNo", query = "SELECT c FROM CardProfiles c WHERE c.cardNo = :cardNo"),
    @NamedQuery(name = "CardProfiles.findByCcvNo", query = "SELECT c FROM CardProfiles c WHERE c.ccvNo = :ccvNo"),
    @NamedQuery(name = "CardProfiles.findByExpiryMonth", query = "SELECT c FROM CardProfiles c WHERE c.expiryMonth = :expiryMonth"),
    @NamedQuery(name = "CardProfiles.findByExpiryYear", query = "SELECT c FROM CardProfiles c WHERE c.expiryYear = :expiryYear")})
public class CardProfiles implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 16)
    @Column(name = "CARD_NO")
    private String cardNo;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "CCV_NO")
    private String ccvNo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "EXPIRY_MONTH")
    private int expiryMonth;
    @Basic(optional = false)
    @NotNull
    @Column(name = "EXPIRY_YEAR")
    private int expiryYear;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "cardNo")
    private Payments payments;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @OneToOne(optional = false)
    private Customers customerId;

    public CardProfiles() {
    }

    public CardProfiles(String cardNo) {
        this.cardNo = cardNo;
    }

    public CardProfiles(String cardNo, String ccvNo, int expiryMonth, int expiryYear) {
        this.cardNo = cardNo;
        this.ccvNo = ccvNo;
        this.expiryMonth = expiryMonth;
        this.expiryYear = expiryYear;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCcvNo() {
        return ccvNo;
    }

    public void setCcvNo(String ccvNo) {
        this.ccvNo = ccvNo;
    }

    public int getExpiryMonth() {
        return expiryMonth;
    }

    public void setExpiryMonth(int expiryMonth) {
        this.expiryMonth = expiryMonth;
    }

    public int getExpiryYear() {
        return expiryYear;
    }

    public void setExpiryYear(int expiryYear) {
        this.expiryYear = expiryYear;
    }

    public Payments getPayments() {
        return payments;
    }

    public void setPayments(Payments payments) {
        this.payments = payments;
    }

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cardNo != null ? cardNo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CardProfiles)) {
            return false;
        }
        CardProfiles other = (CardProfiles) object;
        if ((this.cardNo == null && other.cardNo != null) || (this.cardNo != null && !this.cardNo.equals(other.cardNo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CardProfiles[ cardNo=" + cardNo + " ]";
    }
    
}
