package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.entity.Dog;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Optional;

@Slf4j
@Controller
public class IndexController {

    @Autowired
    private DogDAO dogDAO;

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("index");
        List<Dog> dogs = dogDAO.findAll(); // Assuming you want to display all dogs
        response.addObject("profiles", dogs);
        return response;
    }

}
