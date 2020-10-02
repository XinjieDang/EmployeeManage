package service.imp;

import dao.DepartmentDao;
import dao.impl.DepartmentDaolmpl;
import domain.Department;
import service.DepartmentService;

import java.util.List;

public class DepartmentServicelmpl implements DepartmentService {
    private DepartmentDao departmentDao=new DepartmentDaolmpl();
    @Override
    public List<Department> findAll() {
        return departmentDao.finAll();
    }

    @Override
    public void adddepartment(Department department) {
        departmentDao.add(department);

    }

    @Override
    public Department getinfo_ById(int id) {
        return departmentDao.getinfo_ById(id);
    }

    @Override
    public void updateDept(Department dept) {
        departmentDao.updateDept(dept);
    }
    @Override
    public void deleteDept(String id) {
        departmentDao.deleteDept(Integer.parseInt(id));

    }

    @Override
    public List<Department> findByname(String depname) {
        return departmentDao.findByname(depname);
    }
}
