//
//  StateMachine.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 4/12/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//

import Foundation

protocol StateMachineDelegate: class {
    func shouldEnter(state: String) -> Bool
    func willEnter(state: String)
    func didEnter(state: String)
    
    func didExit(state: String)
    func didChange(from fromState: String, to toState: String)
}

extension StateMachineDelegate {
    func didExit(state: String) {}
    func didChange(from fromState: String, to toState: String) {}
}

class StateMachine {
    weak var delegate: StateMachineDelegate?
    fileprivate(set) var currentState: String?
    var validTransitions: [String: [String]] = [:]
    
    func apply(state: String) -> Bool {
        return attemptToSet(currentState: state)
    }
    
    func set(currentState state: String) {
        self.attemptToSet(currentState: state)
    }
    
    @discardableResult fileprivate func attemptToSet(currentState toState: String) -> Bool {
        let fromState = self.currentState
        
        guard self.validateTransition(from: fromState, to: toState) else { return false }
        
        delegate?.willEnter(state: toState)
        
        currentState = toState
        
        if let state = fromState {
            delegate?.didExit(state: state)
        }
        
        delegate?.didEnter(state: toState)
        
        if let from = fromState {
            delegate?.didChange(from: from, to: toState)
        }
        
        return true
    }
    
    func validateTransition(from fromState: String?, to toState: String) -> Bool {
        if let fromState = fromState, let tranistions = self.validTransitions[fromState], !tranistions.contains(toState) {
            return false
        }
        
        if let delegate = delegate{
            return delegate.shouldEnter(state: toState)
        }
        
        return true
    }
}

