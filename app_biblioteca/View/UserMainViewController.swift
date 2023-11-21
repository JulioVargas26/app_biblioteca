//
//  UserMainViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class UserMainViewController: UIViewController {

    @IBOutlet weak var lblTitMainUser: UILabel!
    
    let defaults = UserDefaults.standard
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let sesionMenu = defaults.object(forKey: "IDUSER") as! [String:String]
        let sesionNombre = sesionMenu["sesionNombre"]
        
        lblTitMainUser.text="Biblioteca - "+sesionNombre!
       
    }
    
   

}
