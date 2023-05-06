package model;

import java.util.List;
import javax.annotation.Resource;
import javax.persistence.*;

public class StaffsService {

    @PersistenceContext
    EntityManager mgr;
    @Resource
    Query query;

    public StaffsService(EntityManager mgr) {
        this.mgr = mgr;
    }

    public boolean addStaff(Staffs staff) {
        mgr.persist(staff);
        return true;
    }

    public Staffs findStaffByStaffIndex(String sIndex) {
        Staffs staff = mgr.find(Staffs.class, sIndex);
        return staff;
    }

    public Staffs findStaffByStaffId(String staffId) {
        try {
            //query that early difined in Products class
            Query q = mgr.createNamedQuery("Staffs.findByStaffId");

            //set the name into the query
            q.setParameter("staffId", staffId);

            //retrieve result
            Staffs staff = (Staffs) q.getSingleResult();
            return staff;
        } catch (NoResultException ex) {
            // if no result, then return null
            Staffs staff = null;
            return staff;
        }
    }

    public boolean deleteItem(String staffId) {
        Staffs staff = findStaffByStaffId(staffId);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public List<Staffs> findAll() {
        List staffsList = mgr.createNamedQuery("Staffs.findAll").getResultList();
        return staffsList;
    }

    public boolean updateItem(Staffs staff) {
        Staffs tempItem = findStaffByStaffId(staff.getStaffId());
        if (tempItem != null) {
            tempItem.setName(staff.getName());
            tempItem.setBirthdate(staff.getBirthdate());
            tempItem.setContactNo(staff.getContactNo());
            tempItem.setEmploymentStatus(staff.getEmploymentStatus());
            tempItem.setPassword(staff.getPassword());
            tempItem.setCreatedAt(staff.getCreatedAt());
            return true;
        }
        return false;
    }
}
