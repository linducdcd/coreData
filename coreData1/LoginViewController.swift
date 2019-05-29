//
//  ViewController.swift
//  coreData1
//
//  Created by Lind Ucdcd on 5/29/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var resultField: UILabel!
    
    
    @IBAction func registreButton(_ sender: Any) {
        performSegue(withIdentifier: "goToRegister", sender: self)
        
    }
    @IBAction func logIn(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
           let results = try context.fetch(request)
            if results.count > 0 {
                
                for result in results as! [NSManagedObject] {
                    let usernames = result.value(forKey: "username") as? String
                    let passwords = result.value(forKey: "password") as? String
                    
                    if usernames == username.text && passwords == password.text {
                        
                       resultField.text = "you username and password is true"
                        
                    } else {
                        
                      resultField.text =  "please press register Button"
                        
                    }
                    
                }
            } else {
                
                print("No results")
            }
            
        } catch {
            print("couldn't fetch results")
            
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        

    }

  


}

