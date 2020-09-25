package domain;

public class Staff {
    private  int sta_id;
    private int job_id;
    private int dep_id;
    private Job job;

    @Override
    public String toString() {
        return "Staff{" +
                "sta_id=" + sta_id +
                ", job_id=" + job_id +
                ", dep_id=" + dep_id +
                ", job=" + job +
                ", dept=" + dept +
                ", staname='" + staname + '\'' +
                ", sex=" + sex +
                ", age=" + age +
                ", IDcard='" + IDcard + '\'' +
                ", education='" + education + '\'' +
                ", adress='" + adress + '\'' +
                ", tel='" + tel + '\'' +
                ", cre_date='" + cre_date + '\'' +
                '}';
    }

    private Department dept;
    private String staname;
    private int sex;
    private int age;
    private  String IDcard;
    private  String education;
    private  String adress;
    private  String tel;
    private  String cre_date;

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }



    public int getSta_id() {
        return sta_id;
    }

    public void setSta_id(int sta_id) {
        this.sta_id = sta_id;
    }

    public int getJob_id() {
        return job_id;
    }

    public void setJob_id(int job_id) {
        this.job_id = job_id;
    }

    public int getDep_id() {
        return dep_id;
    }

    public void setDep_id(int dep_id) {
        this.dep_id = dep_id;
    }

    public Job getJob() {
        return job;
    }

    public void setJob(Job job) {
        this.job = job;
    }

    public Department getDept() {
        return dept;
    }

    public void setDept(Department dept) {
        this.dept = dept;
    }

    public String getStaname() {
        return staname;
    }

    public void setStaname(String staname) {
        this.staname = staname;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getIDcard() {
        return IDcard;
    }

    public void setIDcard(String IDcard) {
        this.IDcard = IDcard;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getCre_date() {
        return cre_date;
    }

    public void setCre_date(String cre_date) {
        this.cre_date = cre_date;
    }



}
