package com.levo.dockerexample.controller;

import java.util.Date;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("app")
public class HelloController {
	
	@RequestMapping(value = "/blue", method = RequestMethod.GET)
	public String test() {
		return "Welcome to DevOpsForAll ECS Demo for Blue Targets " ;
	}

}
