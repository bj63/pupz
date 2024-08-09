package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.User;
import com.pupz.pupz.form.CreateAccountFormBean;
import com.pupz.pupz.security.AuthenticatedUserUtilities;
import com.pupz.pupz.service.UserService;
import jakarta.annotation.PostConstruct;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.*;
import lombok.extern.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;


@Slf4j
@Controller
@RequestMapping("/account")
public class UserLoginController {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserService userService;

    @Autowired
    private AuthenticatedUserUtilities authenticatedUserUtilities;

    @PostConstruct
    public void init() {
        // Initialization code if needed
    }



    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Integer userId) {
        ModelAndView response = new ModelAndView("auth/detail");
        User user = userDao.findById(userId);
        response.addObject("user", user);
        return response;
    }


    @GetMapping("/loginPageUrl")
    public ModelAndView loginPage(@RequestParam(required = false) String error) {
        // this was the homework from friday to crate your own login page
        ModelAndView response = new ModelAndView("auth/login");

        return response;
    }


    @GetMapping("/create-account")
    public ModelAndView createAccount() {
        ModelAndView response = new ModelAndView("auth/create-account");

        return response;
    }

    @PostMapping("/create-account")
    public ModelAndView createAccountSubmit(@Valid CreateAccountFormBean form, BindingResult bindingResult, HttpSession session) {
        ModelAndView response = new ModelAndView("auth/create-account");

        // homework if you want - check to make sure the email does not already exist
        // this is a great case the custom annotation that we made

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            response.addObject("form", form);
        } else {
            // there were no errors so we can create the new user in the database
           userService.createUser(form);
            authenticatedUserUtilities.manualAuthentication(session, form.getEmail(), form.getPassword());
        }

        return response;
    }


}