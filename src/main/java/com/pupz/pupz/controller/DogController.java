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


}