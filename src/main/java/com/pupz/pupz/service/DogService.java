package com.pupz.pupz.service;

import com.pupz.pupz.database.dao.*;
import com.pupz.pupz.database.entity.*;
import com.pupz.pupz.form.*;
import lombok.extern.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import java.util.List;

@Slf4j
@Component
public class DogService {

    @Autowired
    private DogDAO dogDao;

    @Autowired
    private BreedDAO breedDao;

    @Autowired
    private OwnerDAO ownerDao;

    public Dog createOrUpdateDog(CreateDogFormBean form) {
        // Log out the incoming variables that are in the CreateDogFormBean
        log.debug(form.toString());

        // First, attempt to look up the record in the database based on the incoming id
        Dog dog = dogDao.findById(form.getId());
        if (dog == null) {
            // This means it was not found in the database, so we're going to create a new dog
            dog = new Dog();
        }

        // Set the values from the incoming form data onto the database entity
        dog.setName(form.getName());
        dog.setDescription(form.getDescription());
        dog.setImageUrl(form.getImageUrl());
        dog.setVaccinated(form.isVaccinated());
        dog.setBuyPrice(form.getPrice());
        dog.setGender(form.getGender());
        dog.setAge(form.getAge());
        dog.setBreed(breedDao.findById(form.getBreedId()));
        dog. setOwner(ownerDao.findById(form.getOwnerId()));
        // If you have a User associated with the Dog, you can set it here
        // Assuming you have a userId in your form
        if (form.getOwnerId() != null) {
           Owner owner = ownerDao.findById(form.getOwnerId());
            dog.setOwner(owner);
        }

        // Save the dog to the database
        // This will either insert a new record or update an existing one
        dog = dogDao.save(dog);

        return dog;
    }

    // You can add more methods here as needed, for example:

    public void vaccinateDog(Integer dogId) {
        Dog dog = dogDao.findById(dogId);
        if (dog != null) {
            dog.setVaccinated(true);
            dogDao.save(dog);
        } else {
            log.warn("Attempted to vaccinate non-existent dog with id: " + dogId);
        }
    }


    // Add more service methods as needed for your application
}
