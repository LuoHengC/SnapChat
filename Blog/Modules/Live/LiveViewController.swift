//
//  LiveViewController.swift
//  Blog
//
//  Created by Vayne on 2017/9/24.
//  Copyright © 2017年 luoheng. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        
        super.init(nibName: nil, bundle: nil)
        
        self.title = "直播"
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ConstColor.red
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
