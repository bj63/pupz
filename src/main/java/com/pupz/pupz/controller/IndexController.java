package com.pupz.pupz.controller;

import com.pupz.pupz.database.dao.BreedDAO;
import com.pupz.pupz.database.dao.DogDAO;
import com.pupz.pupz.database.dao.OwnerDAO;
import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.Breed;
import com.pupz.pupz.database.entity.Dog;
import com.pupz.pupz.database.entity.Owner;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;

@Slf4j
@Controller
public class IndexController {

    @Autowired
    private DogDAO dogDAO;
    @Autowired
    private OwnerDAO ownerDAO;
    @Autowired
    private BreedDAO breedDAO;

    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView response = new ModelAndView("index");
        List<Dog> dogs = dogDAO.findAll(); // Assuming you want to display all dogs
        response.addObject("profiles", dogs);
        return response;
    }

    @GetMapping("/file-upload")
    public ModelAndView fileUpload(@RequestParam Integer ownerId) {
        // this page is for another page of the website which is express as "/page-url"
        ModelAndView response = new ModelAndView("file-upload");
        response.addObject("ownerId" ,ownerId);

        return response;
    }


    @PostMapping("/file-upload")
    public ModelAndView fileUploadSubmit(@RequestParam MultipartFile file, @RequestParam Integer ownerId) {
        // this page is for another page of the website which is express as "/page-url"
        ModelAndView modelAndView = new ModelAndView("redirect:/owner/detail?ownerId=" + ownerId);

        log.debug("The file name is: " + file.getOriginalFilename());
        log.debug("The file size is: " + file.getSize());
        log.debug("The file content type is: " + file.getContentType());

        // Homework
        // use the original file name and get a substring of the last index of . to the end of the string
        // then restrict based on "jpg" or "png"
        // use the model to put an error message on the page


        // this is the location on the hard drive
        String saveFilename = "./src/main/webapp/pub/images/" + file.getOriginalFilename();

        // this Files.copy is a utility that will read the stream one chunk at a time and write it to a file.
        // first arg is the input stream to read from the uploaded file
        // 2nd is the filename where we want to write the file
        // 3rd says to overwrite if existing.
        try {
            Files.copy(file.getInputStream(), Paths.get(saveFilename), StandardCopyOption.REPLACE_EXISTING);
        } catch ( Exception e ) {
            log.error("Unable to finish reading file", e);
        }

        // we can load the record from the database based on the incoming employeeId
        Owner owner = ownerDAO.findById(ownerId);

        // this is the URL to get the image
        String url = "/pub/images/" + file.getOriginalFilename();
       owner.setImageUrl(url);

         ownerDAO.save(owner);

        return modelAndView;
    }

    @GetMapping("/search")
    public ModelAndView search(@RequestParam(required = false) String search) {
        // This page is for another page of the website which is expressed as "/page-url"
        ModelAndView response = new ModelAndView("search");

        log.debug("The user searched for the term: " + search);

        // I am going to add the user input back to the model so that
        // we can display the search term in the input field
        response.addObject("search", search);

        List<Breed> breeds = breedDAO.findByName(search);

        log.debug("=================================== stream ===============================");

        // This is a stream with a lambda function
        breeds.stream().forEach(breed -> {
            log.debug("Breed: " + breed.getName());
        });

        log.debug("=================================== for loop ===============================");

        // Essentially the same as the above stream
        for (Breed breed : breeds) {
            log.debug("Breed: " + breed.getName());
        }

        response.addObject("breeds", breeds);

        return response;
    }


}


