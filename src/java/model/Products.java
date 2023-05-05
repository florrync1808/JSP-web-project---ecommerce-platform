
package model;

import java.io.Serializable;
//import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

@Entity
@Table(name = "PRODUCTS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Products.findAll", query = "SELECT p FROM Products p"),
    @NamedQuery(name = "Products.findByProductId", query = "SELECT p FROM Products p WHERE p.productId = :productId"),
    @NamedQuery(name = "Products.findByProductName", query = "SELECT p FROM Products p WHERE p.productName = :productName "),
    @NamedQuery(name = "Products.findByProductPrice", query = "SELECT p FROM Products p WHERE p.productPrice = :productPrice"),
    @NamedQuery(name = "Products.findByProductDesc", query = "SELECT p FROM Products p WHERE p.productDesc = :productDesc"),
    @NamedQuery(name = "Products.findByProductPhoto", query = "SELECT p FROM Products p WHERE p.productPhoto = :productPhoto"),
    @NamedQuery(name = "Products.findByCreatedAt", query = "SELECT p FROM Products p WHERE p.createdAt = :createdAt"),
    @NamedQuery(name = "Products.findByDeletedAt", query = "SELECT p FROM Products p WHERE p.deletedAt = :deletedAt")})
public class Products implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "PRODUCT_ID")
    private String productId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PRODUCT_NAME")
    private String productName;
    @Basic(optional = false)
    @NotNull
    @Column(name = "PRODUCT_PRICE")
    private double productPrice;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PRODUCT_DESC")
    private String productDesc;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 1000)
    @Column(name = "PRODUCT_PHOTO")
    private String productPhoto;
    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @Column(name = "DELETED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date deletedAt;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "productId")
    private List<CartLists> cartListsList;

//    Timestamp ts = new Timestamp(System.currentTimeMillis());
//    Date date = ts;
    public Products() {
    }

    public Products(String productId) {
        this.productId = productId;
    }

    public Products(String productId, String productName, double productPrice, String productDesc, String productPhoto, Date createdAt) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productDesc = productDesc;
        this.productPhoto = productPhoto;
        this.createdAt = createdAt;
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

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductPriceinString() {
        DecimalFormat df = new DecimalFormat("0.00");
        return df.format(this.getProductPrice());
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductPhoto() {
        return productPhoto;
    }

    public void setProductPhoto(String productPhoto) {
        this.productPhoto = productPhoto;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getDeletedAt() {
        return deletedAt;
    }

    public void setDeletedAt(Date deletedAt) {
        this.deletedAt = deletedAt;
    }

    @XmlTransient
    public List<CartLists> getCartListsList() {
        return cartListsList;
    }

    public void setCartListsList(List<CartLists> cartListsList) {
        this.cartListsList = cartListsList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (productId != null ? productId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Products)) {
            return false;
        }
        Products other = (Products) object;
        if ((this.productId == null && other.productId != null) || (this.productId != null && !this.productId.equals(other.productId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Products[ productId=" + productId + " ]";
    }

}
