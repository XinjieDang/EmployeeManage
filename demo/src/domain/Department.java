package domain;

public class Department {
    private int dep_id;
    private String depname;
    private String depdescribe;

    public int getDep_id() {
        return dep_id;
    }

    public void setDep_id(int dep_id) {
        this.dep_id = dep_id;
    }

    public String getDepname() {
        return depname;
    }

    public void setDepname(String depname) {
        this.depname = depname;
    }

    public String getDepdescribe() {
        return depdescribe;
    }

    public void setDepdescribe(String depdescribe) {
        this.depdescribe = depdescribe;
    }

    @Override
    public String toString() {
        return "Department{" +
                "dep_id=" + dep_id +
                ", depname='" + depname + '\'' +
                ", depdescribe='" + depdescribe + '\'' +
                '}';
    }
}
