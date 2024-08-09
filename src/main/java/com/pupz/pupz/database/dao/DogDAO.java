package com.pupz.pupz.database.dao;

import com.pupz.pupz.database.entity.Dog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface DogDAO extends JpaRepository<Dog, Long> {

    Dog findById(Integer id);

   Dog findByNameIgnoreCase(String name);
}

