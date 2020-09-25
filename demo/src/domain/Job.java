package domain;

public class Job {
    private int job_id;
    private String jobname;
    private String jobdescribe;

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public String getJobname() {
        return jobname;
    }

    public void setJobname(String jobname) {
        this.jobname = jobname;
    }

    public String getJobdescribe() {
        return jobdescribe;
    }

    public void setJobdescribe(String jobdescribe) {
        this.jobdescribe = jobdescribe;
    }


    @Override
    public String toString() {
        return "Job{" +
                "job_id=" + job_id +
                ", jobname='" + jobname + '\'' +
                ", jobdescribe='" + jobdescribe + '\'' +
                '}';
    }


}
