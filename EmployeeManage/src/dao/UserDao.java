package dao;
import java.util.List;
import java.util.Map;
import domain.User;
/**
 * 用户操作DAO
 */
public interface UserDao {
    public List<User> findAll();
    User findUserByUserNameAndPassword(String username,String password);
    void add(User user);
    void delete(int id);
    User findById(int id);
    void update(User user);
    List<User> findByname(String usernaem);
    int count();


    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);


}
