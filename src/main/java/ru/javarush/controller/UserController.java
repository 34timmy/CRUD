package ru.javarush.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ru.javarush.model.User;
import ru.javarush.service.UserService;

import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by Тимур on 10.02.2017.
 */
@Controller
public class UserController {


    public UserController() {
        System.out.println("UserController()");
    }

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/")
    public ModelAndView listUser(ModelAndView model) throws IOException {
        List<User> listUser = userService.getAllUsers();
        model.addObject("listUser", listUser);
        model.setViewName("home");
        return model;
    }

    @RequestMapping(value = "/newUser", method = RequestMethod.GET)
    public ModelAndView newContact(ModelAndView model) {
        User user = new User();
        user.setCreationDate(new Date());
        model.addObject("user", user);
        model.setViewName("UserForm");
        return model;
    }

    @RequestMapping(value = "/saveUser", method = RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute User user) {
        if (user.getId() == 0) {
            userService.addUser(user);
        } else {
            userService.updateUser(user);
            user.setCreationDate(new Date());
        }
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    public ModelAndView deleteEmployee(HttpServletRequest request) {
        int userId = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(userId);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/editUser", method = RequestMethod.GET)
    public ModelAndView editContact(HttpServletRequest request) {
        int userId = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUser(userId);
        ModelAndView model = new ModelAndView("UserForm");
        model.addObject("user", user);

        return model;
    }

}
