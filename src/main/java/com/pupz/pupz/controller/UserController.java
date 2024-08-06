package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import java.util.Optional;

public class UserController {

    @Autowired
    private UserDAO userDao;

@GetMapping("/detail")
    public ModelAndView detail(@RequestParam Integer userId) {
        ModelAndView response = new ModelAndView("user/detail");
            Optional<User> user = userDao.findById(userId);
        response.addObject("user", user);
        return response;
    }
}