package ru.javarush.DAO;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import ru.javarush.model.User;

import java.util.List;

/**
 * Created by Тимур on 10.02.2017.
 */
@Repository
public class UserDAO {
    @Autowired
    private SessionFactory sessionFactory;

    public void addUser(User user) {
        sessionFactory.getCurrentSession().saveOrUpdate(user);
    }

    @SuppressWarnings("unchecked")
    public List<User> getAllUsers() {
        return sessionFactory.getCurrentSession().createQuery("from User").list();
    }

    public void deleteUser(int userId) {
        User user = (User) sessionFactory.getCurrentSession().load(User.class, userId);
        if (null != user) {
            this.sessionFactory.getCurrentSession().delete(user);
        }
    }

    public User getUser(int userId) {
        return (User) sessionFactory.getCurrentSession().get(User.class, userId);
    }

    public User updateUser(User user) {
        sessionFactory.getCurrentSession().update(user);
        return user;
    }
}
