//
//  Theme.swift
//  AdvancedCollectionView
//
//  Created by Shawn Moore on 4/12/18.
//  Copyright © 2018 Shawn Moore. All rights reserved.
//

import UIKit

class Theme {
    var theme: Theme = Theme()
    
    let sectionHeaderFont = UIFont.preferredFont(forTextStyle: .headline)
    let sectionHeaderSmallFont = UIFont.preferredFont(forTextStyle: .subheadline)
    
    let headerTitleFont = UIFont.preferredFont(forTextStyle: .headline)
    let headerBodyFont = UIFont.preferredFont(forTextStyle: .body)
    
    let actionButtonFont = UIFont.preferredFont(forTextStyle: .headline)
    let cellActionButtonFont = UIFont.preferredFont(forTextStyle: .subheadline)
    let bodyFont = UIFont.preferredFont(forTextStyle: .body)
    let smallBodyFont = UIFont.preferredFont(forTextStyle: .footnote)
    let largeBodyFont = UIFont.preferredFont(forTextStyle: .body)
    
    let listBodyFont = UIFont.preferredFont(forTextStyle: .body)
    let listDetailFont = UIFont.preferredFont(forTextStyle: .footnote)
    let listSmallFont = UIFont.preferredFont(forTextStyle: .footnote)
    
    let listLayoutMargins = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    let sectionHeaderLayoutMargins = UIEdgeInsets(top: 5, left: 15, bottom: 5, right: 15)
    
    let destructiveActionColor = UIColor(red: 1, green: 0.231, blue: 0.188, alpha: 1)
    let alternateActionColors = [UIColor(red: 1, green: 0.584, blue: 0, alpha: 1), UIColor(white: 199/255.0, alpha: 1)]
    let cellActionBackgroundColor = UIColor(white: 235/255.0, alpha: 1)
    
    let selectedBackgroundColor = UIColor(white: 235/255.0, alpha: 1)
    let lightGreyBackgroundColor = UIColor(white: 248/255.0, alpha: 1)
    let greyBackgroundColor = UIColor(white: 235/255.0, alpha: 1)
    let darkGreyBackgroundColor = UIColor(white: 199/255.0, alpha: 1)
    let backgroundColor = UIColor.white

    let seperatorColor = UIColor(white: 204/255.0, alpha: 1)

    let mediumGreyTextColor = UIColor(white: 116/255.0, alpha: 1)
    let lightGreyTextColor = UIColor(white: 172/255.0, alpha: 1)
    let darkGreyTextColor = UIColor(white: 77/255.0, alpha: 1)
}
