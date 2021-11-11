//
//  WebViewController.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    // the webview where the site will be display
    @IBOutlet weak var webView: WKWebView!
    // a LoadingIndicator
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: WebViewModel?
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    // Load the view in the WebView with the url present in the ViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: self.viewModel!.url)
        self.webView.load(request)
    }

    // when the view did appear the Loading indicator is hidden and stop the animation
    override func viewDidAppear(_ animated: Bool) {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
 
}
