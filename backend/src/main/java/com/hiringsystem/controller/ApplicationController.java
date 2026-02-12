package com.hiringsystem.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/applications")
public class ApplicationController {
    
    @GetMapping
    public String getApplications() {
        // TODO: Get all applications
        return "Get all applications endpoint";
    }
    
    @PostMapping
    public String createApplication(@RequestBody Object applicationRequest) {
        // TODO: Create new application
        return "Create application endpoint";
    }
    
    @GetMapping("/{id}")
    public String getApplication(@PathVariable Long id) {
        // TODO: Get application by id
        return "Get application by id endpoint";
    }
    
    @PutMapping("/{id}")
    public String updateApplication(@PathVariable Long id, @RequestBody Object updateRequest) {
        // TODO: Update application
        return "Update application endpoint";
    }
}
