package com.hiringsystem.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, unique = true)
    private String email;
    
    @Column(nullable = false)
    private String password;
    
    @Column(nullable = false)
    private String firstName;
    
    @Column(nullable = false)
    private String lastName;
    
    @Column(nullable = false)
    private String phone;
    
    @Enumerated(EnumType.STRING)
    private UserRole role; // CANDIDATE, INTERVIEWER, HR, MANAGER, ADMIN
    
    @Enumerated(EnumType.STRING)
    private UserStatus status; // ACTIVE, INACTIVE, REJECTED, ONBOARDED
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}

enum UserRole {
    CANDIDATE, INTERVIEWER, HR, MANAGER, ADMIN
}

enum UserStatus {
    ACTIVE, INACTIVE, REJECTED, ONBOARDED
}
