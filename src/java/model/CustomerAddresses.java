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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
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
 * @author cbiev
 */
@Entity
@Table(name = "CUSTOMER_ADDRESSES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CustomerAddresses.findAll", query = "SELECT c FROM CustomerAddresses c"),
    @NamedQuery(name = "CustomerAddresses.findByAddressId", query = "SELECT c FROM CustomerAddresses c WHERE c.addressId = :addressId"),
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
    @Column(name = "IS_PRIMARY")
    private Boolean isPrimary;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @JoinColumn(name = "CUSTOMER_ID", referencedColumnName = "CUSTOMER_ID")
    @ManyToOne(optional = false)
    private Customers customerId;

    public CustomerAddresses() {
    }

    public CustomerAddresses(String addressId) {
        this.addressId = addressId;
    }

    public CustomerAddresses(String addressId, Boolean isPrimary, Date createdAt) {
        this.addressId = addressId;
        this.isPrimary = isPrimary;
        this.createdAt = createdAt;
    }

    public String getAddressId() {
        return addressId;
    }

    public void setAddressId(String addressId) {
        this.addressId = addressId;
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

    public Customers getCustomerId() {
        return customerId;
    }

    public void setCustomerId(Customers customerId) {
        this.customerId = customerId;
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
