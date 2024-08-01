package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.Dog;
import com.pupz.pupz.database.entity.User;
import com.pupz.pupz.form.CreateDogFormBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/dog")
public class DogController {

    @Autowired
    private DogDAO dogDAO;

    @Autowired
    private UserDAO userDAO;

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("dog/index");
        List<Dog> dogs = dogDAO.findAll();
        response.addObject("dogs", dogs);
        return response;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView response = new ModelAndView("dog/create");
        response.addObject("form", new CreateDogFormBean());
        List<User> users = userDAO.findAll();
        response.addObject("users", users);
        return response;
    }

    @PostMapping("/create")
    public ModelAndView createSubmit(@Valid CreateDogFormBean form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ModelAndView response = new ModelAndView("dog/create");
            response.addObject("form", form);
            List<User> users = userDAO.findAll();
            response.addObject("users", users);
            return response;
        }

        Dog dog = new Dog();
        dog.setName(form.getName());
        dog.setAge(form.getAge());
        dog.setGender(form.getGender());
        dog.setDescription(form.getDescription());
        dog.setImageUrl(form.getImageUrl());

        User user = userDAO.findById(form.getUserId()).orElse(null);
        dog.setUser(user);

        dogDAO.save(dog);

        return new ModelAndView("redirect:/dog/detail?id=" + dog.getId());
    }

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Long id) {
        ModelAndView response = new ModelAndView("dog/detail");
        Dog dog = dogDAO.findById(id).orElse(null);
        if (dog == null) {
            response.setViewName("redirect:/dog/index");
        } else {
            response.addObject("dog", dog);
        }
        return response;
    }
}