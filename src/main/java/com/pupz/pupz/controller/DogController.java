package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.BreedDAO;
import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.dao.OwnerDAO;
import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.Breed;
import com.pupz.pupz.database.entity.Dog;
import com.pupz.pupz.database.entity.Owner;
import com.pupz.pupz.database.entity.User;
import com.pupz.pupz.form.CreateDogFormBean;
import com.pupz.pupz.service.DogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import jakarta.annotation.PostConstruct;
import jakarta.validation.Valid;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/dog")
public class DogController {

    @Autowired
    private DogDAO dogDao;

    @Autowired
    private UserDAO userDAO;

    @Autowired
    private DogService dogService;
    @Autowired
    private OwnerDAO ownerDAO;
    @Autowired
    private BreedDAO breedDAO;


    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Integer dogId) {
        ModelAndView response = new ModelAndView("dog/detail");

        Dog dog = dogDao.findById(dogId);
        response.addObject("dog", dog);

        // Add any other necessary details

        return response;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView response = new ModelAndView("dog/create");
        loadDropdowns(response);
        return response;
    }

    private void loadDropdowns(ModelAndView response) {
        // Load any necessary dropdown data
        // For example:
        List<Owner> owners = ownerDAO.findAll();
        List<Breed> breeds = breedDAO.findAll ();
        response.addObject("owners", owners);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = false) Integer dogId) {
        ModelAndView response = new ModelAndView("dog/create");

        loadDropdowns(response);

        if (dogId != null) {
            Dog dog = dogDao.findById(dogId);
            if (dog != null) {
                CreateDogFormBean form = new CreateDogFormBean();
                form.setId(dog.getId());
                form.setName(dog.getName());
                form.setDescription(dog.getDescription());
                form.setImageUrl(dog.getImageUrl());
                form.setVaccinated(dog.isVaccinated());
                form.setPrice(dog.getBuyPrice());
                form.setGender(dog.getGender());
                form.setAge(dog.getAge());
                form.setBreedId(dog.getBreed().getId());
                form.setOwnerId(dog.getOwner().getId());

                response.addObject("form", form);
            } else {
                response.addObject("errorMessage", "The dog was not found in the database.");
            }
        }

        return response;
    }

    @RequestMapping(value = "/createSubmit", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView createSubmit(@Valid CreateDogFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();

        if (form.getId() == null) {
            Dog d = dogDao.findByNameIgnoreCase(form.getName());
            if (d != null) {
                bindingResult.rejectValue("name", "name", "This dog name is already in use.");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            loadDropdowns(response);
            response.setViewName("dog/create");
            response.addObject("form", form);
            return response;
        } else {
            Dog dog = dogService.createOrUpdateDog(form);
            response.setViewName("redirect:/dog/detail?dogId=" + dog.getId());
            return response;
        }
    }
}