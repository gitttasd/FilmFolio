package com.film.folio.comm;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;

@Constraint(validatedBy = CheckIntImpl.class )
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.FIELD, ElementType.PARAMETER})
public @interface CheckInt {
	
	String message() default "입력값이 숫자가 아닙니다.";
	Class[] groups() default {};
	Class[] payload() default {};
	
}
