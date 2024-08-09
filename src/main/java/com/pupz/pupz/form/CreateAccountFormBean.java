package com.pupz.pupz.form;
import jakarta.validation.constraints.*;
import lombok.*;

@Getter
@Setter
public class CreateAccountFormBean {

    @NotEmpty
    private String email;

    @NotEmpty
    private String password;

    private Integer id;


    @NotBlank(message = "Username is required")
    private String username;

    @NotBlank(message = "First name is required")
    private String name;

    @NotBlank(message = "Last name is required")
    private String surname;

    @Min(value = 18, message = "Age must be at least 18")
    private int age;

    @NotBlank(message = "Country is required")
    private String country;

    private Boolean isOwner;

    @NotEmpty(message = "Image URL is required")
    private String imageUrl;

    private Integer userId;

}



