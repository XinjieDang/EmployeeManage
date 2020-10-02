package service;

import domain.Department;
import domain.Job;

import java.util.List;

public interface JobService {
    public List<Job> findAll();

    void addjob(Job job);

    Job getinfoById(int id);

    public void updaeJob(Job job);

    public void deleteJob(String id);

    /**
     * 根据职位名称 查找职位信息
     *
     * @param jobname
     */
    List<Job> findByname(String jobname);

}