package service;

import domain.User;

import java.util.List;

/**
 * 用户管理的业务接口
 */
public interface UserService {
    /**
     * 查询所有用户信息
     * @return
     */
    public List<User> findAll();

    /**
     * 用户login 方法
     * @param user
     * @return
     */
    User login(User user);

    /**
     * 保存User
     * @param user
     */
    void addUser(User user);


    /**
     * 根据id删除User
     * @param id
     */
    void deleteUser(String id);



    /**
     * 根据修改User信息
     * @param  user
     */
    void updateUser(User user);




    /**
     * 根据修改id 查找User信息
     * @param  id
     */
    User findUserByid(String id);
}
