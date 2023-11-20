package com.example.docker.SpringBootDemo;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/rest")
public class HelloWorldController {
    @GetMapping("/get")
    public String sayHello(){
        return "Hello Kishalay here \n\n Connect with me: https://www.linkedin.com/in/connect-with-kishalay-bhattacharya/ \n\n v1";
    }
}
