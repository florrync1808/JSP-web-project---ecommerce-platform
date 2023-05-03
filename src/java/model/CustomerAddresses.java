/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author End User
 */
@Entity
@Table(name = "CUSTOMER_ADDRESSES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CustomerAddresses.findAll", query = "SELECT c FROM CustomerAddresses c"),
    @NamedQuery(name = "CustomerAddresses.findByAddressId", query = "SELECT c FROM CustomerAddresses c WHERE c.addressId = :addressId"),
    @NamedQuery(name = "CustomerAddresses.findByLine1", query = "SELECT c FROM CustomerAddresses c WHERE c.line1 = :line1"),
    @NamedQuery(name = "CustomerAddresses.findByLine2", query = "SELECT c FROM CustomerAddresses c WHERE c.line2 = :line2"),
    @NamedQuery(name = "CustomerAddresses.findByState", query = "SELECT c FROM CustomerAddresses c WHERE c.state = :state"),
    @NamedQuery(name = "CustomerAddresses.findByCity", query = "SELECT c FROM CustomerAddresses c WHERE c.city = :city"),
    @NamedQuery(name = "CustomerAddresses.findByPostcode", query = "SELECT c FROM CustomerAddresses c WHERE c.postcode = :postcode"),
    @NamedQuery(name = "CustomerAddresses.findByIsPrimary", query = "SELECT c FROM CustomerAddresses c WHERE c.isPrimary = :isPrimary"),
    @NamedQuery(name = "CustomerAddresses.findByCreatedAt", query = "SELECT c FROM CustomerAddresses c WHERE c.createdAt = :createdAt")})
public class CustomerAddresses implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "ADDRESS_ID")
    private String addressId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 225)
    @Column(name = "LINE1")
    private String line1;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 225)
    @Column(name = "LINE2")
    private String line2;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 225)
    @Column(name = "STATE")
    private String state;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 225)
    @Column(name = "CITY")
    private String city;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 225)
    @Column(name = "POSTCODE")
    private String postcode;
    @Basic(optional = false)
    @NotNull
    @Column(name = "IS_PRIMARY")
    private Boolean isPrimary;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    public CustomerAddresses() {
    }

    public CustomerAddresses(String addressId) {
        this.addressId = addressId;
    }

    public CustomerAddresses(String addressId, String line1, String line2, String state, String city, String postcode, Boolean isPrimary, Date createdAt) {
        this.addressId = addressId;
        this.line1 = line1;
        this.line2 = line2;
        this.state = state;
        this.city = city;
        this.postcode = postcode;
        this.isPrimary = isPrimary;
        this.createdAt = createdAt;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
    }

    public String getLine1() {
        return line1;
    }

    public void setLine1(String line1) {
        this.line1 = line1;
    }

    public String getLine2() {
        return line2;
    }

    public void setLine2(String line2) {
        this.line2 = line2;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public Boolean getIsPrimary() {
        return isPrimary;
    }

    public void setIsPrimary(Boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (addressId != null ? addressId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CustomerAddresses)) {
            return false;
        }
        CustomerAddresses other = (CustomerAddresses) object;
        if ((this.addressId == null && other.addressId != null) || (this.addressId != null && !this.addressId.equals(other.addressId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CustomerAddresses[ addressId=" + addressId + " ]";
    }
    
}
