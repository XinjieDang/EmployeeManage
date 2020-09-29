package dao.impl;
import dao.StaffDao;
import domain.Staff;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;
import java.util.List;
import java.util.Map;

public class StaffDaolmlp implements StaffDao {

    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<Staff> findAll() {
        //使用JDBC操作数据库...
        //1.定义sql
        String sql = "select * from staff";
        List<Staff> staffS = template.query(sql, new BeanPropertyRowMapper<Staff>(Staff.class));
        return staffS;

    }

    @Override
    public void add(Staff staff) {
        //姓名、性别、年龄、部门、职位、身份证、学历、籍贯、联系电话、入职日期
        String sql = "insert into staff values(null,?,?,?,?,?,?,?,?,?,?)";
        template.update(sql,staff.getStaname(),staff.getSex(),staff.getAge(),staff.getDep_id(),staff.getJob_id(), staff.getIDcard(),
                staff.getEducation(),staff.getAdress(),staff.getTel(),staff.getCre_date());

    }

    @Override
    public void delete(int id) {
        String sql="delete from staff where sta_id=?";
        template.update(sql,id);

    }

    @Override
    public Staff findById(int id) {
        String sql="select * from staff where sta_id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Staff>(Staff.class),id);
    }

    @Override
    public void update(Staff staff) {
        //定义sql
        String sql = "update staff set staname = ?,sex = ?, age=? ,dep_id=?,job_id=?,IDcard=?,education=?,adress=?,tel=?,cre_date=? where id = ?";
        template.update(sql,staff.getStaname(),staff.getSex(),staff.getAge(),staff.getDep_id(),staff.getJob_id(),staff.getIDcard(),staff.getEducation(),staff.getAdress(),staff.getTel(),staff.getCre_date(),staff.getSta_id());

    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        return 0;
    }
}
