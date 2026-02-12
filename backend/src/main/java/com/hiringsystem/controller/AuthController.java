package com.hiringsystem.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@CrossOrigin(origins = "http://localhost:5173")
public class AuthController {

    @PostMapping("/login")
    public String login(@RequestBody LoginRequest request) {
        return "Login successful";
    }
}
