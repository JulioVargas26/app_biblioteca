//
//  AdminMainViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class AdminMainViewController: UIViewController {

    @IBOutlet weak var lblTitMainAdmin: UILabel!
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sesionMenu = defaults.object(forKey: "IDUSER") as! [String:String]
        let sesionNombre = sesionMenu["sesionNombre"]
        
        lblTitMainAdmin.text="Biblioteca - "+sesionNombre!
    }
    
}
