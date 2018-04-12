//
//  DataSource.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 4/3/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//

import UIKit

struct DataSourcePlaceholder {
    var title: String?
    var message: String?
    var image: UIImage?
    fileprivate var activityIndicator: Bool
    
    fileprivate init(with title: String?, message: String?, image: UIImage?, showActivityIndicator activityIndicator: Bool) {
        self.title = title
        self.message = message
        self.image = image
        self.activityIndicator = activityIndicator
    }
    
    fileprivate static func placeholderWithActivityIndicator() -> DataSourcePlaceholder {
        return DataSourcePlaceholder(with: nil, message: nil, image: nil, showActivityIndicator: true)
    }
    
    static func placeholder(with title: String, withMessage message: String? = nil, andImage image: UIImage? = nil) -> DataSourcePlaceholder {
        return DataSourcePlaceholder(with: title, message: message, image: image, showActivityIndicator: false)
    }
}

