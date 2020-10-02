package dao.impl;
import dao.UserDao;
import domain.User;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import util.JDBCUtils;
import java.util.List;
import java.util.Map;

public class UserDaoImpl implements UserDao {
    //使用JdbcTemplate Spring MVC内置的对JDBC的一个封装
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    // 查询用户所有信息
    public List<User> findAll() {
        //使用JDBC操作数据库...
        //1.定义sql
        String sql = "select * from user";
        List<User> users = template.query(sql, new BeanPropertyRowMapper<User>(User.class));
        return users;

    }

    @Override
    //用户登录
    public User findUserByUserNameAndPassword(String username, String password) {
        try {
            String sql="select * from user where username=? and password= ?";
            User user = template.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
            return user;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public void add(User user) {
        //1.定义sql
        String sql = "insert into user values(null,?,?)";
        //2.执行sql
        template.update(sql, user.getUsername(),user.getPassword());
    }

    @Override
    public void delete(int id) {
        String sql = "delete from user where id=?";
        //2.执行sql
        template.update(sql, id);

    }

    @Override
    public User findById(int id) {
        String sql = "select* from user where id=?";
        return template.queryForObject(sql,new BeanPropertyRowMapper<User>(User.class),id);
    }

    @Override
    public void update(User user) {
        //定义sql
        String sql = "update user set username = ?,password = ?  where id = ?";
        template.update(sql,user.getUsername(),user.getPassword(),user.getId());

    }

    @Override
    public List<User> findByname(String username) {
        String sql= "select * from user where username like \"%\"? \"%\"";
        List<User> user=template.query(sql,new BeanPropertyRowMapper<User>(User.class),username);
        return user;
    }

    @Override
    public int count() {
        String sql="select count(*) from user";
        return template.queryForObject(sql,Integer.class);
    }


    @Override
    public int findTotalCount(Map<String, String[]> condition) {
        return 0;
    }
}
