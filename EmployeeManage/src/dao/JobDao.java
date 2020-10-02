package dao;

import domain.Department;
import domain.Job;

import java.util.List;

public interface JobDao {

    public List<Job> findAll(); //查询所有信息

    public void add(Job job);//添加

    Job getinfo_byID(int id);//根据id 查询所有信息
    void updateJob(Job job);
    void deleteJob(int id);
    List<Job> findByname(String usernaem);
}
