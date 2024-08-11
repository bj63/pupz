package com.pupz.pupz.validation;
import jakarta.validation.*;

import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = OwnerEmailUniqueImpl.class)
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface OwnerEmailUnique {

    String message() default "{OwnerEmailUnique}";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};


}