package service.imp;

import dao.JobDao;
import dao.impl.JobDaolmpl;
import domain.Job;
import service.JobService;

import java.util.List;

public class JobServicelmpl  implements JobService {
    private JobDao jobDao=new JobDaolmpl();
    @Override
    public List<Job> findAll() {
        return jobDao.findAll();
    }

    @Override
    public void addjob(Job job) {
        jobDao.add(job);

    }

    @Override
    public Job getinfoById(int id) {
        return jobDao.getinfo_byID(id);
    }
}
