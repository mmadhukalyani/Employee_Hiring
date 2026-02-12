package com.hiringsystem.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.time.LocalDateTime;

@Entity
@Table(name = "applications")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Application {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "candidate_id", nullable = false)
    private User candidate;
    
    @Column(nullable = false)
    private String position; // Internship, Fresher Role
    
    @Column(nullable = false)
    private String department;
    
    @Enumerated(EnumType.STRING)
    private ApplicationStatus status; // APPLIED, ONLINE_TEST_SCHEDULED, ONLINE_TEST_COMPLETED, 
                                      // L1_SCHEDULED, L1_COMPLETED, L1_FAILED,
                                      // L2_SCHEDULED, L2_COMPLETED, L2_FAILED,
                                      // HR_INTERVIEW_SCHEDULED, HR_INTERVIEW_COMPLETED, HR_FAILED,
                                      // OFFER_GENERATED, OFFER_ACCEPTED, OFFER_REJECTED,
                                      // ONBOARDING_IN_PROGRESS, ONBOARDED, REJECTED
    
    @Column(name = "applied_at")
    private LocalDateTime appliedAt;
    
    @Column(name = "created_at")
    private LocalDateTime createdAt;
    
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
        appliedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}

enum ApplicationStatus {
    APPLIED, ONLINE_TEST_SCHEDULED, ONLINE_TEST_COMPLETED, 
    L1_SCHEDULED, L1_COMPLETED, L1_FAILED,
    L2_SCHEDULED, L2_COMPLETED, L2_FAILED,
    HR_INTERVIEW_SCHEDULED, HR_INTERVIEW_COMPLETED, HR_FAILED,
    OFFER_GENERATED, OFFER_ACCEPTED, OFFER_REJECTED,
    ONBOARDING_IN_PROGRESS, ONBOARDED, REJECTED
}
