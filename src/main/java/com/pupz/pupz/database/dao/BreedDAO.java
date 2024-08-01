package com.pupz.pupz.database.dao;

import com.pupz.pupz.database.entity.Breed;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface BreedDAO extends JpaRepository<Breed, Long> {

    Optional<Breed> findByName(String name);
}
