package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.entity.User;
import com.pupz.pupz.database.entity.Dog;
import com.pupz.pupz.form.AddDogToUserFormBean;
import com.pupz.pupz.form.CreateUserFormBean;
import com.pupz.pupz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import jakarta.validation.Valid;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private DogDAO dogDAO;
    @Autowired
    private UserService userService;

    @GetMapping("/index")
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("user/index");
        List<User> users = userDAO.findAll();
        response.addObject("users", users);
        return response;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView response = new ModelAndView("user/create");
        response.addObject("form", new CreateUserFormBean());
        return response;
    }

    @PostMapping("/create")
    public ModelAndView createSubmit(@Valid CreateUserFormBean form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ModelAndView response = new ModelAndView("user/create");
            response.addObject("form", form);
            return response;
        }

        User user = new User();
        user.setUsername(form.getUsername());
        user.setName(form.getName());
        user.setSurname(form.getSurname());
        user.setAge(form.getAge());
        user.setCountry(form.getCountry());
        user.setEmail(form.getEmail());
        user.setPassword(form.getPassword());
        user.setIsOwner(form.getIsOwner());
        userDAO.save(user);

        return new ModelAndView("redirect:/user/detail?id=" + user.getId());
    }

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Long id) {
        ModelAndView response = new ModelAndView("user/detail");
        User user = userDAO.findById(id).orElse(null);
        if (user == null) {
            response.setViewName("redirect:/user/index");
        } else {
            response.addObject("user", user);
        }
        return response;
    }

    // ... existing methods ...

    @GetMapping("/addDog")
    public ModelAndView addDog(@RequestParam Long userId) {
        ModelAndView response = new ModelAndView("user/addDog");
        User user = userDAO.findById(userId).orElse(null);
        if (user == null) {
            response.setViewName("redirect:/user/index");
        } else {
            response.addObject("user", user);
            response.addObject("form", new AddDogToUserFormBean());
        }
        return response;
    }

    @PostMapping("/addDog")
    public ModelAndView addDogSubmit(@Valid AddDogToUserFormBean form, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            ModelAndView response = new ModelAndView("user/addDog");
            response.addObject("form", form);
            return response;
        }

        User user = userDAO.findById(form.getUserId()).orElse(null);
        if (user == null) {
            return new ModelAndView("redirect:/user/index");
        }

        Dog dog = new Dog();
        dog.setName(form.getName());
        dog.setAge(form.getAge());
        dog.setGender(form.getGender());
        dog.setDescription(form.getDescription());
        dog.setUser(user);

        dogDAO.save(dog);
        user.addDog(dog);
        userDAO.save(user);

        return new ModelAndView("redirect:/user/detail?id=" + user.getId());
    }

    @PostMapping("/add")
    public String addUser(@ModelAttribute("userForm") @Valid CreateUserFormBean form,
                          BindingResult result,
                          @RequestParam("file") MultipartFile file) {

        if (result.hasErrors()) {
            return "user/create";
        }

        User user = new User(); // Assuming you're creating a new User object from the form data
        // Set other user properties from the form...

        if (!file.isEmpty()) {
            try {
                // Define the upload directory
                String uploadDir = "src/main/resources/static/uploads/users/";
                String fileName = file.getOriginalFilename();
                Path path = Paths.get(uploadDir + fileName);

                // Save the file
                Files.write(path, file.getBytes());

                // Set the profile image directly on the user object
                user.setProfileImage(file.getBytes());

                // You might also want to save the file path if needed
                user.setImageUrl("/uploads/users/" + fileName);
            } catch (IOException e) {
                e.printStackTrace();
                // Handle the error (e.g., add a model attribute with an error message)
            }
        }

        userDAO.save(user);
        return "redirect:/users";
    }

}