package com.pupz.pupz.controller;
import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.dao.OwnerDAO;
import com.pupz.pupz.database.entity.Dog;
import com.pupz.pupz.database.entity.Owner;
import com.pupz.pupz.service.OwnerService;
import com.pupz.pupz.form.CreateOwnerFormBean;
import jakarta.annotation.*;
import jakarta.validation.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/owner")
public class OwnerController {

    public OwnerController() {
        // Initialization code can be placed here
    }

    @PostConstruct
    public void init() {
        // This method is executed after all the autowired fields are set
    }

    @Autowired
    private DogDAO dogDao;

    @Autowired
    private OwnerDAO ownerDao;

    @Autowired
    private OwnerService ownerService;

    @GetMapping("/detail")
    public ModelAndView detail(@RequestParam Integer ownerId) {
        ModelAndView response = new ModelAndView("owner/detail");

        List<Dog> dogs = dogDao.findByOwnerId(ownerId);
        response.addObject("dogs", dogs);

        Owner owner = ownerDao.findById(ownerId);
        response.addObject("owner", owner);

        return response;
    }

    @GetMapping("/create")
    public ModelAndView create() {
        ModelAndView response = new ModelAndView("owner/create");
        loadDropdowns(response);
        return response;
    }

    private void loadDropdowns(ModelAndView response) {
        List<Dog> dogs = dogDao.findAll();
        response.addObject("dogs", dogs);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public ModelAndView edit(@RequestParam(required = false) Integer ownerId) {
        ModelAndView response = new ModelAndView("owner/create");
        loadDropdowns(response);

        if (ownerId != null) {
            Owner owner = ownerDao.findById(ownerId);
            if (owner != null) {
                CreateOwnerFormBean form = new CreateOwnerFormBean();
                form.setEmail(form.getEmail());
                form.setUsername(owner.getUsername());
                form.setName(owner.getName());
                form.setAge(owner.getAge());
                form.setImageUrl(owner.getImageUrl());

                response.addObject("form", form);
            } else {
                response.addObject("errorMessage", "The owner was not found in the database.");
            }
        }

        return response;
    }

    @RequestMapping(value = "/createSubmit", method = { RequestMethod.POST, RequestMethod.GET })
    public ModelAndView createSubmit(@Valid CreateOwnerFormBean form, BindingResult bindingResult) {
        ModelAndView response = new ModelAndView();

        if (form.getOwnerId() == null) {
            Owner o = ownerDao.findByEmailIgnoreCase(form.getEmail());
            if (o != null) {
                bindingResult.rejectValue("username", "username", "This username is already in use. Manual Check");
            }
        }

        if (bindingResult.hasErrors()) {
            for (ObjectError error : bindingResult.getAllErrors()) {
                log.debug("Validation error : " + ((FieldError) error).getField() + " = " + error.getDefaultMessage());
            }

            response.addObject("bindingResult", bindingResult);
            loadDropdowns(response);
            response.setViewName("owner/create");
            response.addObject("form", form);
            return response;
        } else {
            Owner owner = ownerService.createOwner(form);
            response.setViewName("redirect:/owner/detail?ownerId=" + owner.getId());
            return response;
        }
    }
}
