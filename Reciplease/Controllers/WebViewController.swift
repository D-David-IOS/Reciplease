//
//  WebViewController.swift
//  Reciplease
//
//  Created by David-IOS on 19/10/2021.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    
    var viewModel: WebViewModel?
    
    init(viewModel: WebViewModel) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(nibName: String(describing: WebViewController.self), bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = URLRequest(url: self.viewModel!.url)
        self.webView.load(request)
    }

    override func viewDidAppear(_ animated: Bool) {
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
 
}
