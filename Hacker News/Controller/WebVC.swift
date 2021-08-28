//
//  WebVC.swift
//  Hacker News
//
//  Created by Khater on 8/28/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
        title: "Back", style: .plain, target: nil, action: nil)
        
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: Constants.backButton, style: .plain, target: nil, action: nil)
        title = Constants.title
        
        if let urlstring = urlString, let url = URL(string: urlstring){
            webView.load(URLRequest(url: url))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
