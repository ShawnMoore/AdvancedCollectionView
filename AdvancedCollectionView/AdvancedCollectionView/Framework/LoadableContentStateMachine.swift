//
//  LoadableContentStateMachine.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 4/12/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//

import Foundation

typealias LoadingUpdateBlock = (AnyObject) -> Void

class LoadableContentStateMachine: StateMachine {
    enum LoadState: String {
        case initial = "Initial"
        case loadingContent = "LoadingState"
        case refreshingContent = "RefreshingState"
        case contentLoaded = "LoadedState"
        case noContent = "NoContentState"
        case error = "ErrorState"
    }
    
    override init() {
        super.init()
        
        self.validTransitions = [
            LoadState.initial.rawValue: [LoadState.loadingContent.rawValue],
            LoadState.loadingContent.rawValue: [LoadState.contentLoaded.rawValue, LoadState.noContent.rawValue, LoadState.error.rawValue],
            LoadState.refreshingContent.rawValue: [LoadState.contentLoaded.rawValue, LoadState.noContent.rawValue, LoadState.error.rawValue],
            LoadState.contentLoaded.rawValue: [LoadState.refreshingContent.rawValue, LoadState.noContent.rawValue, LoadState.error.rawValue],
            LoadState.noContent.rawValue: [LoadState.refreshingContent.rawValue, LoadState.noContent.rawValue, LoadState.error.rawValue],
            LoadState.error.rawValue: [LoadState.loadingContent.rawValue, LoadState.refreshingContent.rawValue, LoadState.noContent.rawValue, LoadState.contentLoaded.rawValue]
        ]
        
        self.currentState = LoadState.initial.rawValue
    }
}

class LoadingProgress {
    fileprivate(set) var cancelled: Bool {
        didSet {
            guard cancelled else { return }
            
            self.ignore()
        }
    }
    
    
    fileprivate var block: ((String?, Error?, LoadingUpdateBlock?) -> Void)?
    
    fileprivate init(cancelled: Bool, block: @escaping (String?, Error?, LoadingUpdateBlock?) -> Void) {
        self.cancelled = cancelled
        self.block = block
    }
    
    static func loadingProgress(withCompletionHandler handler: @escaping (String?, Error?, LoadingUpdateBlock?) -> Void) -> LoadingProgress {
        return LoadingProgress(cancelled: false, block: handler)
    }
    
    fileprivate func done(with newState: String?, error: Error?, update: LoadingUpdateBlock?) {
        block?(newState, error, update)
        
        block = nil
    }
    
    func ignore() {
        done(with: nil, error: nil, update: nil)
    }
    
    func done() {
        done(with: LoadableContentStateMachine.LoadState.contentLoaded.rawValue, error: nil, update: nil)
    }
    
    func updateWithContent(_ update: LoadingUpdateBlock?) {
        done(with: LoadableContentStateMachine.LoadState.contentLoaded.rawValue, error: nil, update: update)
    }
    
    func done(with error: Error?) {
        let newState = error != nil ? LoadableContentStateMachine.LoadState.error : LoadableContentStateMachine.LoadState.contentLoaded
        
        done(with: newState.rawValue, error: error, update: nil)
    }
    
    func updateWithNoContent(_ update: LoadingUpdateBlock?) {
        done(with: LoadableContentStateMachine.LoadState.noContent.rawValue, error: nil, update: update)
    }
}

protocol ContentLoading {
    var loadingState: String { get set }
    var loadingError: Error? { get set }
    
    func loadContent(withProgress progress: Int)
    func resetContent()
}
