//
//  WebRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import Foundation

class WebRoutingEntry : RoutingEntry {
    
    var url : URL
    
    var viewController: Controller? {
        let viewModel = WebViewModel(url: self.url)
        return WebViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
    init(url : URL){
        self.url = url
    }
    
    
}
