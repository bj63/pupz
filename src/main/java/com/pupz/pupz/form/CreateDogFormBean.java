package com.pupz.pupz.form;

import jakarta.validation.constraints.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CreateDogFormBean {
    private Integer id;

    private Integer ownerId;

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

    private Integer breedId;

    @NotEmpty(message = "Gender is required")
    private String gender;

    @NotNull(message = "Age is required")
    @Min(value = 1, message = "Age must be at least 1")
    private Integer age;

  


}

