//
//  Action.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 3/15/17.
//  Copyright (C) 2015 Apple Inc. All Rights Reserved.
//
// A generic object wrapping a localized title and a selector.

import Foundation

///  A simple object that represents an action that might be associated with a cell or used in a data source to present a series of buttons.
class Action {
    // MARK: - Properties
    /// Is the action destructive? Destructive actions will be rendered using the theme's destructiveActionColor property.
    var destructive: Bool
    
    /// The title of the action.
    var title: String
    
    /// The closure sent up the responder chain when this action is invoked.
    var handler: () -> Void
    
    // MARK: - Initializers
    fileprivate init(title: String, destructive: Bool, handler: @escaping () -> Void) {
        self.title = title
        self.destructive = destructive
        self.handler = handler
    }
    
    // MARK: - Static Factory Methods
    /// Create an Action instance with the given title and action.
    static func action(with title: String, handler: @escaping () -> Void) -> Action {
        return Action(title: title, destructive: false, handler: handler)
    }
    
    /// Create an Action instance that is destructive and has the given title and action.
    static func destructiveAction(with title: String, handler: @escaping () -> Void) -> Action {
        return Action(title: title, destructive: true, handler: handler)
    }
}
