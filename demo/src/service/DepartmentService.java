package service;

import domain.Department;

import java.util.List;

public interface DepartmentService {
    public List<Department> findAll();
    public void adddepartment(Department department);
    Department getinfo_ById(int id);
}
