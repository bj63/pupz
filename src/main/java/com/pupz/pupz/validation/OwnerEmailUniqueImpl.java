package com.pupz.pupz.validation;


import com.pupz.pupz.database.dao.UserDAO;
import com.pupz.pupz.database.entity.User;
import jakarta.validation.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.util.*;

public class OwnerEmailUniqueImpl implements ConstraintValidator<OwnerEmailUnique, String> {
    public static final Logger LOG = LoggerFactory.getLogger(OwnerEmailUniqueImpl.class);

    @Autowired
    private UserDAO UserDAO;


    @Override
    public boolean isValid(String value, ConstraintValidatorContext context) {
        // a test should only do one thing, so we should check for null first
        // always return true on null ... this is a pattern in creating test cases within JSR 303
        // its a good practice to always return true when your input value is null or empty
        if (StringUtils.isEmpty(value)) {
            return true;
        }

        //UserMSQL user = userService.findByEmailIgnoreCase(value);
        User user = UserDAO.findByEmailIgnoreCase(value);

        // this validation returns true when the email is NOT in the database
        return (user == null);
    }


}
