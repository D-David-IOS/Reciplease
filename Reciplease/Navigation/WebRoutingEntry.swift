//
//  WebRoutingEntry.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import Foundation

// this Routing push a new controller : WebViewController with a WebViewModel
class WebRoutingEntry : RoutingEntry {
    
    // The Url to open in the WebView
    var url : URL
    
    init(url : URL){
        self.url = url
    }
    
    var viewController: Controller? {
        let viewModel = WebViewModel(url: self.url)
        return WebViewController(viewModel: viewModel)
    }
    
    var completionBlock: (() -> Void)?
    
    var navigationStyle: NavigationStyle {
        return .push
    }
    
}
