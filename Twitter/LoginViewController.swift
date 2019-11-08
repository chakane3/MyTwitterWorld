//
//  LoginViewController.swift
//  Twitter
//
//  Created by Chakane Shegog on 11/7/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBAction func onLoginButton(_ sender: Any) {
        //Function to login to twitter
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // This is executed when someone logs in sucessfully
            // We perform our segue into loginToHome
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            
            // Prints if user cannot log in
            print("could not log you in :c")
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Checks if thr user is logged in already
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true{
            // If so, go on with the segue
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
