package model;

/**
 * Created by xzinoviou
 * 19/9/2018
 */
public class Team {

    private String id;
    private String name;
    private Integer year;
    private String owner;

    public Team(){}

    public Team(String id, String name, Integer year, String owner) {
        this.id = id;
        this.name = name;
        this.year = year;
        this.owner = owner;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getYear() {
        return year;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return "Team{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", year=" + year +
                ", owner='" + owner + '\'' +
                '}';
    }
}
