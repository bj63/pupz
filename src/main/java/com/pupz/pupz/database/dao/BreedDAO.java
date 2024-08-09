package com.pupz.pupz.database.dao;

import com.pupz.pupz.database.entity.Breed;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface BreedDAO extends JpaRepository<Breed, Long> {

    // This is a magic query in that ... Spring Data JPA is able to use the method name to generate the query
    Breed findById(Integer id);
    @Query("SELECT b FROM Breed b WHERE b.name LIKE CONCAT('%', :name, '%')")
    List<Breed> findByName(@Param("name") String name);

}

