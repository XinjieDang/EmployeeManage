package dao.impl;
import dao.StaffDao;
import domain.Staff;
import domain.User;
import jdk.internal.dynalink.beans.BeansLinker;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;

import java.util.ArrayList;
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

    @Override
    public List<Staff> more_query(Staff staff) {
        //1、给出sql 模板 2、给出参数  3、调用query查询 使用结果集处理器：BeanListHandler
        //1.1给出一个sql 前半句
        StringBuffer sql=new StringBuffer("select *from staff where 1=1");
        //2.1 判断条件 向sql 语句中追加 where 条件
        // 创建一个ArrayList来装参数
        List<Object> params = new ArrayList<Object>();

        String staname=staff.getStaname(); //职工名
        if(staname != null && !staname.trim().isEmpty()) {
            sql.append(" and staname like ?");
            params.add("%" + staname + "%");
        }

        String education=staff.getEducation();//学历
        if(education != null && !education.trim().isEmpty()) {
            sql.append(" and education like ?");
            params.add("%" + education + "%");
        }
        String adress=staff.getAdress();//籍贯
        if(adress != null && !adress.trim().isEmpty()) {
            sql.append(" and adress like ?");
            params.add("%" + adress + "%");
        }
        //执行调用query查询
        List<Staff> staffs=template.query(sql.toString(), new BeanPropertyRowMapper<Staff>(Staff.class),params.toArray());
        return staffs;


    }
}
