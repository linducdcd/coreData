//
//  RegisterViewController.swift
//  coreData1
//
//  Created by Lind Ucdcd on 5/29/19.
//  Copyright © 2019 Lind Ucdcd. All rights reserved.
//

import UIKit
import CoreData

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func backToLogin(_ sender: Any) {

        performSegue(withIdentifier: "goToLogIn", sender: self)
    }
    
    
    @IBAction func register(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue(username.text, forKey: "username")
        newUser.setValue(password.text, forKey: "password")
        
        do {
            try context.save()
            print("Save")
            performSegue(withIdentifier: "goToLogIn", sender: self)
            
        } catch {
            print("save: there was error")
            
        }
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }

   

}
