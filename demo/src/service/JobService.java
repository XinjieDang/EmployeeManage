package service;

import domain.Job;

import java.util.List;

public interface JobService {
    public List<Job> findAll();
    void addjob (Job job);
    Job getinfoById(int id);
}
