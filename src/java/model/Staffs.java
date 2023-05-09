/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
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

/**
 *
 * @author End User
 */
@Entity
@Table(name = "STAFFS")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Staffs.findAll", query = "SELECT s FROM Staffs s"),
    @NamedQuery(name = "Staffs.findByStaffIndex", query = "SELECT s FROM Staffs s WHERE s.staffIndex = :staffIndex"),
    @NamedQuery(name = "Staffs.findByStaffId", query = "SELECT s FROM Staffs s WHERE s.staffId = :staffId"),
    @NamedQuery(name = "Staffs.findByName", query = "SELECT s FROM Staffs s WHERE s.name = :name"),
    @NamedQuery(name = "Staffs.findByBirthdate", query = "SELECT s FROM Staffs s WHERE s.birthdate = :birthdate"),
    @NamedQuery(name = "Staffs.findByContactNo", query = "SELECT s FROM Staffs s WHERE s.contactNo = :contactNo"),
    @NamedQuery(name = "Staffs.findByEmail", query = "SELECT s FROM Staffs s WHERE s.email = :email"),
    @NamedQuery(name = "Staffs.findByEmploymentStatus", query = "SELECT s FROM Staffs s WHERE s.employmentStatus = :employmentStatus"),
    @NamedQuery(name = "Staffs.findByPassword", query = "SELECT s FROM Staffs s WHERE s.password = :password"),
    @NamedQuery(name = "Staffs.findByCreatedAt", query = "SELECT s FROM Staffs s WHERE s.createdAt = :createdAt")})
public class Staffs implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "STAFF_INDEX")
    private Integer staffIndex;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 8)
    @Column(name = "STAFF_ID")
    private String staffId;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "NAME")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Column(name = "BIRTHDATE")
    @Temporal(TemporalType.DATE)
    private Date birthdate;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 11)
    @Column(name = "CONTACT_NO")
    private String contactNo;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "EMAIL")
    private String email;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "EMPLOYMENT_STATUS")
    private String employmentStatus;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "PASSWORD")
    private String password;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CREATED_AT")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;
    @OneToMany(mappedBy = "staffIndex")
    private List<Orders> ordersList;

    public Staffs() {
    }

    public Staffs(Integer staffIndex) {
        this.staffIndex = staffIndex;
    }

    public Staffs(Integer staffIndex, String staffId, String name, Date birthdate, String contactNo, String email, String employmentStatus, String password, Date createdAt) {
        this.staffIndex = staffIndex;
        this.staffId = staffId;
        this.name = name;
        this.birthdate = birthdate;
        this.contactNo = contactNo;
        this.email = email;
        this.employmentStatus = employmentStatus;
        this.password = password;
        this.createdAt = createdAt;
    }
        
    public Staffs(String staffId, String name, Date birthdate, String contactNo, String email, String employmentStatus, String password, Date createdAt) {
        this.staffId = staffId;
        this.name = name;
        this.birthdate = birthdate;
        this.contactNo = contactNo;
        this.email = email;
        this.employmentStatus = employmentStatus;
        this.password = password;
        this.createdAt = createdAt;
    }

    public Integer getStaffIndex() {
        return staffIndex;
    }

    public void setStaffIndex(Integer staffIndex) {
        this.staffIndex = staffIndex;
    }

    public String getStaffId() {
        return staffId;
    }

    public void setStaffId(String staffId) {
        this.staffId = staffId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthdate() {
        return birthdate;
    }

    public void setBirthdate(Date birthdate) {
        this.birthdate = birthdate;
    }

    public String getContactNo() {
        return contactNo;
    }

    public void setContactNo(String contactNo) {
        this.contactNo = contactNo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmploymentStatus() {
        return employmentStatus;
    }

    public void setEmploymentStatus(String employmentStatus) {
        this.employmentStatus = employmentStatus;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    @XmlTransient
    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (staffIndex != null ? staffIndex.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Staffs)) {
            return false;
        }
        Staffs other = (Staffs) object;
        if ((this.staffIndex == null && other.staffIndex != null) || (this.staffIndex != null && !this.staffIndex.equals(other.staffIndex))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.Staffs[ staffIndex=" + staffIndex + " ]";
    }
    
}
