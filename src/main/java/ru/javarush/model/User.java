package ru.javarush.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by Тимур on 10.02.2017.
 */

@Entity
@Table(name = "user")
public class User implements Serializable {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @Column(name = "NAME")
    private String name;

    @Column(name = "AGE")
    private int age;

    @Column(name = "IS_ADMIN")
    private boolean isAdmin;

    @Column(name = "CREATIONDATE")
    private Date creationDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean getisAdmin() {
        return isAdmin;
    }

    public void setisAdmin(boolean admin) {
        this.isAdmin = admin;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }
}
