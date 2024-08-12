package com.pupz.pupz.database.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "dogs")
public class Dog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "buy_price", columnDefinition = "DECIMAL")
    private Double buyPrice;

    @Column(name = "dog_name", nullable = false)
    private String name;

    @ManyToOne
    @JoinColumn(name = "breed_id", nullable = false)
    private Breed breed;


    @Column(name = "dog_age", nullable = false)
    private Integer age;


    @Column (name = "dog_gender", nullable = false)
    private String gender;



    @Column (name = "dog_description", columnDefinition = "TEXT")
    private String description;

    @Column (name = "image_url")
    private String imageUrl;

    @Column (name = "is_vaccinated")
    private boolean isVaccinated;



    @ManyToOne
    @JoinColumn(name = "owner_id")
    private Owner owner;



}