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
        let sesionNombre = sesionMenu["sesionNOM"]
        
        
        lblTitMainUser.text="Biblioteca - " + sesionNombre!
       
    }
    
    @IBAction func btnEditarDatosUser(_ sender: UIButton) {
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="editarUser"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! RestablecerContraseniaViewController
            //acceder
           // pantalla2.bean=data[defaults.data(forKey: "DATAUSER")]
        }
        
    }
    

}
