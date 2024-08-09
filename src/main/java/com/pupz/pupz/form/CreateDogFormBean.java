package com.pupz.pupz.form;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateDogFormBean {
    private Integer id;

    private Integer userId;

    @NotEmpty(message = "Name is required")
    private String name;

    @NotEmpty(message = "Description is required")
    private String description;

    @NotNull(message = "Price is required")
    private Double price;

    @NotEmpty(message = "Image URL is required")
    private String imageUrl;

    // this is how to capture the boolean value of the checkbox either on or off
    private boolean isVaccinated;

    @NotEmpty(message = "Breed is required")
    private String breed;

    @NotEmpty(message = "Gender is required")
    private String gender;

    @NotEmpty(message = "Age is required")
    private String age;

    private String owner;


    private String radio;

}

