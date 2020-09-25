package service;

import domain.Job;
import domain.Staff;
import domain.User;

import java.util.List;

public interface StaffService {
    /**
     * 查询所有职工信息
     *
     * @return
     */
    public List<Staff> findAll();

    /**
     * 职工login 方法
     *
     * @param staff
     * @return
     */
    Staff login(Staff staff);

    /**
     * 保存Staff
     *
     * @param staff
     */
    void addStaff(Staff staff);


    /**
     * 根据id删除User
     *
     * @param id
     */
    void deleteStaff(String id);


    /**
     * 根据修改Staff信息
     *
     * @param saff
     */
    void updateStaff(Staff saff);



    /**
     * 获取到员工列表的信息，包括部门列表和元工列表
     *
     *
     *
     */

    public List<Staff> get_StaffList();


}
