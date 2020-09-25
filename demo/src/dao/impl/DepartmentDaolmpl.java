package dao.impl;
import dao.DepartmentDao;
import domain.Department;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapperResultSetExtractor;
import util.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;
import java.util.List;

public class DepartmentDaolmpl implements DepartmentDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<Department> finAll() {
        String sql="select * from department";
        List<Department> departmentList=template.query(sql,new BeanPropertyRowMapper<Department>(Department.class));
        return departmentList;
    }

    @Override
    public void add(Department department) {
        String sql = "insert into department values(null,?,?)";
        template.update(sql,department.getDepname(),department.getDepdescribe());

    }

    @Override
    public Department getinfo_ById(int id) {
        String sql="select * from department where dep_id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<Department>(Department.class),id);
    }
}
