package com.film.folio.comm;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CheckIntImpl implements ConstraintValidator<CheckInt, Integer>{

	@Override
	public boolean isValid(Integer value, ConstraintValidatorContext context) {
		
		int min = 0;
		int max = 5;
		
		if(value < min || value > max){
			context.disableDefaultConstraintViolation();
			context.buildConstraintViolationWithTemplate("0 ~ 5 사이의 숫자로 입력해주세요!").addConstraintViolation();
			return false;
		}
		
		return true;
	}

}
