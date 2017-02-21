package ru.javarush.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import ru.javarush.model.User;
import ru.javarush.repository.UserRepository;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


/**
 * Created by Тимур on 10.02.2017.
 */
@Service
@Transactional
public class UserService {


    @Resource
    private UserRepository userRepository;

    @Transactional
    public User create(User user) {

        return userRepository.save(user);
    }

    @Transactional
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Transactional
    public User delete(int id) {
        User deletedUser = userRepository.findOne(id);

        userRepository.delete(deletedUser);

        return deletedUser;
    }

    @Transactional
    public User findById(int id) {
        return userRepository.findOne(id);
    }

    @Transactional
    public User update(User user) {
        User updatedUser = userRepository.findOne(user.getId());

        updatedUser.setName(user.getName());
        updatedUser.setAge(user.getAge());
        updatedUser.setisAdmin(user.getisAdmin());
        updatedUser.setCreationDate(new Date());

        return updatedUser;
    }


    @Transactional
    public List<User> search(String name) {
        return userRepository.findByName(name);
    }


}