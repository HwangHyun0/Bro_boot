package com.bro.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
/**
 * Handles requests for the application home page.
 */
@SpringBootApplication(scanBasePackages = "com.bro.web")
public class HomeController {
	
	  public static void main(String[] args) {
	        SpringApplication.run(HomeController.class, args);
	    }
	
}
