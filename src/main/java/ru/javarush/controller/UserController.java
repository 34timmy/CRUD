package ru.javarush.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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

    @RequestMapping(value = "/list")
    public ModelAndView listUser() {
        ModelAndView model=new ModelAndView("list");
        List<User> listUser = userService.findAll();
        model.addObject("listUser", listUser);
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
       model.setViewName("redirect:/list");
        return model;
    }

    @RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
    public ModelAndView deleteShop(@PathVariable Integer id){
        ModelAndView model = new ModelAndView("redirect:/list");

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
    public ModelAndView saveUser(@ModelAttribute User user, @PathVariable Integer id, final RedirectAttributes redirectAttributes){
        ModelAndView mav = new ModelAndView("redirect:/list");

        userService.update(user);


        return mav;
    }
    @RequestMapping(value="/search", method=RequestMethod.GET)
    public ModelAndView userSearchPage(@RequestParam(value = "searchstring", required = false) String name) {
        ModelAndView model = new ModelAndView("list");

        List<User> listUser = userService.search(name);

        model.addObject("listUser", listUser);

        return model;
    }

}
