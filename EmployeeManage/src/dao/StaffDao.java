package dao;
import domain.Staff;
import java.util.List;
import java.util.Map;

public interface StaffDao {
    public List<Staff> findAll();
    void add(Staff staff);
    void delete(int id);
    Staff findById(int id);
    void update(Staff staff);

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

}
