package model;

import java.util.List;
import java.util.Set;
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

    public Staffs findStaffById(String staffId) {
        Staffs staff = mgr.find(Staffs.class, staffId);
        return staff;
    }

    public boolean deleteStaff(String staffId) {
        Staffs staff = findStaffById(staffId);
        if (staff != null) {
            mgr.remove(staff);
            return true;
        }
        return false;
    }

    public List<Staffs> findAll() {
        List staffList = mgr.createNamedQuery("Staffs.findAll").getResultList();
        return staffList;
    }

    public boolean updateItem(Staffs staff) {
        Staffs tempStaff = findStaffById(staff.getStaffId());
        if (tempStaff != null) {
            tempStaff.setName(staff.getName());
            tempStaff.setBirthdate(staff.getBirthdate());
            tempStaff.setContactNo(staff.getContactNo());
            tempStaff.setEmail(staff.getEmail());
            tempStaff.setEmploymentStatus(staff.getEmploymentStatus());
            tempStaff.setPassword(staff.getPassword());
            return true;
        }
        return false;
    }
}
