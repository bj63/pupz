package com.pupz.pupz.service;

import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.dao.UserRoleDAO;
import com.pupz.pupz.database.entity.User;
import com.pupz.pupz.database.entity.UserRole;
import com.pupz.pupz.form.CreateAccountFormBean;
import lombok.extern.slf4j.*;
import org.springframework.security.crypto.password.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;

@Slf4j
@Service
public class UserService {

    @Autowired
    private UserDAO userDao;

    @Autowired
    private UserRoleDAO userRoleDao;

    @Autowired
    private PasswordEncoder passwordEncoder;

    public User createUser( CreateAccountFormBean form) {
        log.debug(form.toString());
        User user = userDao.findById(form.getUserId());
        if (user == null) {

            user = new User();
        }


        user.setEmail(form.getEmail());
        user.setUsername(form.getUsername());
        user.setName(form.getName());
        user.setSurname(form.getSurname());
        user.setAge(form.getAge());
        user.setCountry(form.getCountry());
        user.setImageUrl(form.getImageUrl());

        String encryptedPassword = passwordEncoder.encode(form.getPassword());
        user.setPassword(encryptedPassword);

        user.setCreateDate(new Date());


        // Save or update the user
        user = userDao.save(user);

        // Create a user role if it's a new user
            UserRole userRole = new UserRole();
            userRole.setRoleName("USER");
            userRole.setUserId(user.getId());


            userRoleDao.save(userRole);



        return user;


    }
}