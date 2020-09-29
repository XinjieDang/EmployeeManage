package dao;

import domain.Department;

import java.util.List;

public interface DepartmentDao {
    public List<Department> finAll();
    public void add(Department department);
    Department getinfo_ById(int id);
    void updateDept(Department dept);
    void deleteDept(int id);

}
