//
//  BaseViewModel.swift
//  Created by Asset's Macbook Pro on 01/07/2025.
//  Copyright © 2025 youssef. All rights reserved.

import Combine

class BaseViewModel: DisposeObject {
    // MARK: - PROPERTIES
    @Published var state:  ViewModelState<NetworkError> = .idle
    
    deinit {
        self.cancellables.removeAll()
        print("viewModel deallocated ☠︎☠︎☠︎☠︎☠︎☠︎☠︎☠︎☠︎☠︎☠︎☠︎")
    }
}
 
class DisposeObject {
    // MARK: - Properties
    //
    /// A closure that gets called when the object is deinitialized.
    public var deinitCalled: (() -> Void)?
    
    /// A set of cancellable objects that will be cleared when the object is deinitialized.
    public var cancellables: Set<AnyCancellable>
    
    // MARK: - Initializer
    //
    /**
     Initializes a new `DisposeObject` instance.
     */
    public init() {
        self.cancellables = Set<AnyCancellable>()
    }
    
    // MARK: - Deinitializer
    //
    /**
     Deinitializes the object, clears all cancellables, and calls the `deinitCalled` closure if it is set.
     */
    deinit {
        self.cancellables.removeAll()
        deinitCalled?()
    }
}
