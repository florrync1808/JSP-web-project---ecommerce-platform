
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

@Entity
@Table(name = "ORDER_STATUSES")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "OrderStatuses.findAll", query = "SELECT o FROM OrderStatuses o"),
    @NamedQuery(name = "OrderStatuses.findByStatusId", query = "SELECT o FROM OrderStatuses o WHERE o.statusId = :statusId"),
    @NamedQuery(name = "OrderStatuses.findByDescription", query = "SELECT o FROM OrderStatuses o WHERE o.description = :description"),
    @NamedQuery(name = "OrderStatuses.findByCreatedAt", query = "SELECT o FROM OrderStatuses o WHERE o.createdAt = :createdAt")})
public class OrderStatuses implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "STATUS_ID")
    private String statusId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "DESCRIPTION")
    private String description;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @JoinColumn(name = "ORDER_ID", referencedColumnName = "ORDER_ID")
    @ManyToOne(optional = false)
    private Orders orderId;

    public OrderStatuses() {
    }

    public OrderStatuses(String statusId) {
        this.statusId = statusId;
    }

    public OrderStatuses(String statusId, String description, Date createdAt) {
        this.statusId = statusId;
        this.description = description;
        this.createdAt = createdAt;
    }

    public String getStatusId() {
        return statusId;
    }

    public void setStatusId(String statusId) {
        this.statusId = statusId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Orders getOrderId() {
        return orderId;
    }

    public void setOrderId(Orders orderId) {
        this.orderId = orderId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (statusId != null ? statusId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof OrderStatuses)) {
            return false;
        }
        OrderStatuses other = (OrderStatuses) object;
        if ((this.statusId == null && other.statusId != null) || (this.statusId != null && !this.statusId.equals(other.statusId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.OrderStatuses[ statusId=" + statusId + " ]";
    }
    
}
