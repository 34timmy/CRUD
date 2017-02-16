package ru.javarush.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.DAO.UserDAO;
import ru.javarush.model.User;

import java.util.List;

/**
 * Created by Тимур on 10.02.2017.
 */
@Service
@Transactional
public class UserService {

    @Autowired
    private UserDAO userDAO;

    @Transactional
    public void addUser(User user) {
        userDAO.addUser(user);
    }

    @Transactional
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    @Transactional
    public void deleteUser(Integer userId) {
        userDAO.deleteUser(userId);
    }

    public User getUser(int userId) {
        return userDAO.getUser(userId);
    }

    public User updateUser(User user) {
        // TODO Auto-generated method stub
        return userDAO.updateUser(user);
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

}