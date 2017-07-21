package ru.javarush.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.javarush.model.User;
import ru.javarush.service.UserService;

import java.util.Date;
import java.util.List;

/**
 * Created by Тимур on 10.02.2017.
 */
@Controller
public class UserController {


    public UserController() {

    }

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/list/{pageNumber}")
    public ModelAndView listUser(@PathVariable Integer pageNumber) {
        ModelAndView model=new ModelAndView("list");

        Page<User> page = userService.findAll(pageNumber);
        List<User> listUser=page.getContent();
        int current = page.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, page.getTotalPages());
        model.addObject("listUser", listUser);
        model.addObject("page", page);
        model.addObject("beginIndex", begin);
        model.addObject("endIndex", end);
        model.addObject("currentIndex", current);
        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public ModelAndView newUserPage() {
        ModelAndView model=new ModelAndView("form");
        User user = new User();
        user.setCreationDate(new Date());
        model.addObject("user", user);
        return model;
    }

    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute User user) {
    ModelAndView model=new ModelAndView();
       userService.create(user);
       model.setViewName("redirect:/list/1");
        return model;
    }

    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public ModelAndView delete(@PathVariable Integer id){
        ModelAndView model = new ModelAndView("redirect:/list/1");

        User user = userService.delete(id);


        return model;
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView editUserPage(@PathVariable Integer id) {
        ModelAndView model=new ModelAndView("edit");
        User user = userService.findById(id);
        model.addObject("user", user);
        return model;
    }
    @RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute User user, @PathVariable Integer id){
        ModelAndView mav = new ModelAndView("redirect:/list/1");

        userService.update(user);


        return mav;
    }
    @RequestMapping(value="/search/{pageNumber}", method=RequestMethod.GET)
    public ModelAndView userSearchPage(@PathVariable Integer pageNumber, @RequestParam(value = "searchstring", required = false) String name) {
        ModelAndView model = new ModelAndView("list");

        Page<User> page = userService.findByName(name,pageNumber);
        List<User> listUser = page.getContent();

        int current = page.getNumber() + 1;
        int begin = Math.max(1, current - 5);
        int end = Math.min(begin + 10, page.getTotalPages());
        model.addObject("listUser", listUser);
        model.addObject("page", page);
        model.addObject("beginIndex", begin);
        model.addObject("endIndex", end);
        model.addObject("currentIndex", current);

        return model;
    }

}
