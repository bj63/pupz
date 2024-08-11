package com.pupz.pupz.service;


import com.pupz.pupz.database.dao.OwnerDAO;
import com.pupz.pupz.database.entity.Owner;
import com.pupz.pupz.form.CreateOwnerFormBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class OwnerService {

    @Autowired
    private OwnerDAO ownerDao;



    public Owner createOwner(CreateOwnerFormBean form) {
        // Log out the incoming variables that are in the CreateOwnerFormBean
        log.debug(form.toString());

        // Attempt to look up the record in the database based on the incoming ownerId
        // This is from the hidden input field and is not something the user actually entered themselves
        Owner owner = ownerDao.findById(form.getOwnerId());
        if (owner == null) {
            // If not found in the database, consider this a create operation
            owner = new Owner();
        }

        // Set the values from the incoming form data onto the database entity

        owner.setEmail(form.getEmail());
        owner.setUsername(form.getUsername());
        owner.setName(form.getName());
        owner.setAge(form.getAge());
        owner.setCountry(form.getCountry());
        owner.setImageUrl(form.getImageUrl());


        // Save to the database; this will auto-increment and give us a new ID
        owner = ownerDao.save(owner);

        return owner;
    }
}
