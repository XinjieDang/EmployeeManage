package service;

import domain.Department;
import domain.User;

import java.util.List;

public interface DepartmentService {
    public List<Department> findAll();
    public void adddepartment(Department department);
    Department getinfo_ById(int id);
    public void updateDept(Department dept);
    public void deleteDept(String id);
    /**
     * 根据部门名称 查找部门信息
     * @param  depname
     */
    List<Department> findByname(String depname);

}
