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

}
