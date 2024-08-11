package com.pupz.pupz.database.dao;

import com.pupz.pupz.database.entity.Owner;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OwnerDAO extends JpaRepository<Owner, Long> {

        Owner findById(Integer id);

        List<Owner> findAll();

        // select * from employee where lower(email) = lower(:email)
        Owner findByEmailIgnoreCase(String email);

    }

