//
//  OnboardingViewModel.swift
//  Created by Asset's Macbook Pro on 20/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Foundation
struct OnboardingModel: Hashable {
    var id: String = UUID().uuidString
    var image: String
    var description: String
}

class OnboardingViewModel: ObservableObject {
    
    @Published var cureentStap: Int = 0
    
    @Published var onBoardData: [OnboardingModel] = [
        OnboardingModel(
            image: "onboard1",
            description: "Grow your delivery business and reach more hungry customers"
        ),
        OnboardingModel(
            image: "onboard2",
            description: "Easy order management and real-time tracking to boost your service"
        ),
        OnboardingModel(
            image: "onboard3",
            description: "Secure and flexible payment options for a smoother delivery experience"
        )
    ]
}
