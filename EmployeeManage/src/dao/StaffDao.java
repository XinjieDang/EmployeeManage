package dao;
import domain.Staff;
import domain.User;

import java.util.List;
import java.util.Map;

public interface StaffDao {
    public List<Staff> findAll();
    void add(Staff staff);
    void delete(int id);
    Staff findById(int id);
    void update(Staff staff);
    Staff login(String login_id, String login_pwd);
    void updatePwd(String pwd,String id);

    /**
     * 查询总记录数
     * @return
     * @param condition
     */
    int findTotalCount(Map<String, String[]> condition);


    /**
     * 根据 id 查询
     * @return
     * @param condition
     */
   // public List<Staff> findgetID




    /**

     * 多条件组合查询
     * @param staff
     * @return
     */
    public List<Staff> more_query(Staff staff);

    /**

     * 统计职工人数
     * @param
     * @return
     */
    int count_staff();

}
