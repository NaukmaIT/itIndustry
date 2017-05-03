package ukma.it.industry.entity;


import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "project")
public class Project {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "project_id")
    private Long id_project;
    @Column(name = "project_name")
    private String name;
    @JoinColumn(name = "user_id")
    @OneToOne
    private User teacher;
    @JoinColumn(name = "user_id")
    @OneToMany
    private List<User> students;
    @JoinColumn(name = "subject_id")
    @OneToMany
    private List<Subject> subjects;

    @Column(name = "project_status")
    private List<User> status;

    public Long getId_project() {
        return id_project;
    }

    public void setId_project(Long id_project) {
        this.id_project = id_project;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public User getTeacher() {
        return teacher;
    }

    public void setTeacher(User teacher) {
        this.teacher = teacher;
    }

    public List<User> getStudents() {
        return students;
    }

    public void setStudents(List<User> students) {
        this.students = students;
    }

    public List<Subject> getSubjects() {
        return subjects;
    }

    public void setSubjects(List<Subject> subjects) {
        this.subjects = subjects;
    }

    public List<User> getStatus() {
        return status;
    }

    public void setStatus(List<User> status) {
        this.status = status;
    }
}
