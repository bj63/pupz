package com.pupz.pupz.form;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;
import org.hibernate.validator.constraints.*;


@Getter
@Setter
@ToString
public class CreateOwnerFormBean {
    private Integer ownerId;

    @Length(max = 100, message = "Email must be less than 100 characters")
    @NotEmpty(message="Email is required.")
    @Email(message = "This must be a valid email")
    // this is a flaw in the architecture of validation because you
    //@EmployeeEmailUnique(message = "This email is already in use.")
    private String email;


    @NotBlank(message = "Username is required")
    private String username;

    @NotBlank(message = "First name is required")
    private String name;


    @Min(value = 18, message = "Age must be at least 18")
    private int age;

    @NotBlank(message = "Country is required")
    private String country;


    @NotEmpty(message = "Image URL is required")
    private String imageUrl;


}


