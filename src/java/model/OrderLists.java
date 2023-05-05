
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

@Entity
@Table(name = "ORDER_LISTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderLists.findAll", query = "SELECT o FROM OrderLists o"),
    @NamedQuery(name = "OrderLists.findByOrderListId", query = "SELECT o FROM OrderLists o WHERE o.orderListId = :orderListId"),
    @NamedQuery(name = "OrderLists.findByOrderQty", query = "SELECT o FROM OrderLists o WHERE o.orderQty = :orderQty")})
public class OrderLists implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "ORDER_LIST_ID")
    private String orderListId;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ORDER_QTY")
    private int orderQty;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID")
    @ManyToOne(optional = false)
    private Orders orderId;
    @JoinColumn(name = "PRODUCT_ID", referencedColumnName = "PRODUCT_ID")
    @ManyToOne(optional = false)
    private Products productId;

    public OrderLists() {
    }

    public OrderLists(String orderListId) {
        this.orderListId = orderListId;
    }

    public OrderLists(String orderListId, int orderQty) {
        this.orderListId = orderListId;
        this.orderQty = orderQty;
    }

    public String getOrderListId() {
        return orderListId;
    }

    public void setOrderListId(String orderListId) {
        this.orderListId = orderListId;
    }

    public int getOrderQty() {
        return orderQty;
    }

    public void setOrderQty(int orderQty) {
        this.orderQty = orderQty;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
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
        hash += (orderListId != null ? orderListId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderLists)) {
            return false;
        }
        OrderLists other = (OrderLists) object;
        if ((this.orderListId == null && other.orderListId != null) || (this.orderListId != null && !this.orderListId.equals(other.orderListId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OrderLists[ orderListId=" + orderListId + " ]";
    }
    
}
