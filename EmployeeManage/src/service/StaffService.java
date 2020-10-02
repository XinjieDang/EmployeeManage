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
     * 获取到员工列表的信息，包括部门列表的部门名称和职位名称
     */

    public List<Staff> get_StaffList();
    public Staff fin_StaffList(String id);

    /**
     * 删除职工
     *
     * @param sta_id
     */
    public void delStaff(String sta_id);
    public Staff findStaff(String id);

    /**
     * 多条件查询职工信息
     *
     * @param staff
     */
   public List<Staff> more_query(Staff staff);




    /**
     * 多条件查询职工信息获取到相应的部门和职位
     *
     * @param
     */
   public List<Staff> morefind_get_StaffList(Staff staff);


   public int count_staff();


}

