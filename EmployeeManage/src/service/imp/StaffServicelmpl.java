package service.imp;
import dao.DepartmentDao;
import dao.JobDao;
import dao.StaffDao;
import dao.impl.DepartmentDaolmpl;
import dao.impl.JobDaolmpl;
import dao.impl.StaffDaolmlp;
import domain.Department;
import domain.Job;
import domain.Staff;
import service.StaffService;

import java.util.ArrayList;
import java.util.List;
public class StaffServicelmpl implements StaffService {
    private  StaffDao staffDao=new StaffDaolmlp();
    private DepartmentDao departmentDao=new DepartmentDaolmpl();
    private JobDao jobDao=new JobDaolmpl();

    @Override
    public List<Staff> findAll() {
        return staffDao.findAll();
    }

    @Override
    public Staff login(Staff staff) {
        return null;
    }

    @Override
    public void addStaff(Staff staff) {
        staffDao.add(staff);

    }

    @Override
    public void deleteStaff(String id) {

    }

    @Override
    public void updateStaff(Staff saff) {
        staffDao.update(saff);


    }

    @Override
    public List<Staff> get_StaffList() {
        /**
         * 将新增员工时，将部门，职位id中的信息提取出来
         */
        List<Staff> list = staffDao.findAll();
        int size = list.size();
        List<Staff> list2 = new ArrayList<>();
        for(int i = 0;i<size;i++){
            Staff data = list.get(i);
            Department dept =departmentDao.getinfo_ById(data.getDep_id());
            data.setDept(dept);
            Job job=jobDao.getinfo_byID(data.getJob_id());
            data.setJob(job);
            list2.add(i,data);
        }
        return list2;
    }

    @Override
    public Staff fin_StaffList(String id) {
        /**
         * 修改员工时 将部门，职位id中的信息提取出来
         */
         Staff data = staffDao.findById(Integer.parseInt(id));
         Department dept =departmentDao.getinfo_ById(data.getDep_id());
        data.setDept(dept);
        Job job=jobDao.getinfo_byID(data.getJob_id());
        data.setJob(job);
        return data;
    }

    @Override
    public void delStaff(String sta_id) {
        staffDao.delete(Integer.parseInt(sta_id));
    }

    @Override
    public Staff findStaff(String id) {
        return staffDao.findById(Integer.parseInt(id));
    }

    @Override
    public List<Staff> more_query(Staff staff) {
        return staffDao.more_query(staff);
    }

    @Override
    public List<Staff> morefind_get_StaffList(Staff staff) {
        /**
         * 多条件查询时，将部门，职位id中的信息提取出来
         */
        List<Staff> list = staffDao.more_query(staff);
        int size = list.size();
        List<Staff> list2 = new ArrayList<>();
        for(int i = 0;i<size;i++){
            Staff data = list.get(i);
            Department dept =departmentDao.getinfo_ById(data.getDep_id());
            data.setDept(dept);
            Job job=jobDao.getinfo_byID(data.getJob_id());
            data.setJob(job);
            list2.add(i,data);
        }
        return list2;
    }

    @Override
    public int count_staff() {
        return staffDao.count_staff();
    }
}
