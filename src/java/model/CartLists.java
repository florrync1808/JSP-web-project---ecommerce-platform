/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author End User
 */
@Entity
@Table(name = "CART_LISTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CartLists.findAll", query = "SELECT c FROM CartLists c"),
    @NamedQuery(name = "CartLists.findByCartListId", query = "SELECT c FROM CartLists c WHERE c.cartListId = :cartListId"),
    @NamedQuery(name = "CartLists.findByItemQty", query = "SELECT c FROM CartLists c WHERE c.itemQty = :itemQty")})
public class CartLists implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "CART_LIST_ID")
    private String cartListId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ITEM_QTY")
    private int itemQty;
    @JoinColumn(name = "CART_ID", referencedColumnName = "CART_ID")
    @ManyToOne(optional = false)
    private Carts cartId;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products productId;

    public CartLists() {
    }

    public CartLists(String cartListId) {
        this.cartListId = cartListId;
    }

    public CartLists(String cartListId, int itemQty) {
        this.cartListId = cartListId;
        this.itemQty = itemQty;
    }

    public String getCartListId() {
        return cartListId;
    }

    public void setCartListId(String cartListId) {
        this.cartListId = cartListId;
    }

    public int getItemQty() {
        return itemQty;
    }

    public void setItemQty(int itemQty) {
        this.itemQty = itemQty;
    }

    public Carts getCartId() {
        return cartId;
    }

    public void setCartId(Carts cartId) {
        this.cartId = cartId;
    }

    public Products getProductId() {
        return productId;
    }

    public void setProductId(Products productId) {
        this.productId = productId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cartListId != null ? cartListId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CartLists)) {
            return false;
        }
        CartLists other = (CartLists) object;
        if ((this.cartListId == null && other.cartListId != null) || (this.cartListId != null && !this.cartListId.equals(other.cartListId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CartLists[ cartListId=" + cartListId + " ]";
    }
    
}
