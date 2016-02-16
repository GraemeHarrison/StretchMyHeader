//
//  NewsItem.swift
//  StretchMyHeader
//
//  Created by Graeme Harrison on 2016-02-16.
//  Copyright © 2016 Graeme Harrison. All rights reserved.
//

import Foundation

struct NewsItem {
    let categ: String
    let headline: String
    
    init(categ: String, headline: String) {
        self.categ = categ
        self.headline = headline
    }
}