//
//  PrestamoLibroApiViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 20/11/23.
//

import UIKit

class PrestamoLibroApiViewController: UIViewController {

    @IBOutlet weak var txtIdUser: UITextField!
    @IBOutlet weak var txtTitLibroApi: UITextField!
    @IBOutlet weak var txtFecPrestamo: UITextField!
    @IBOutlet weak var ckAceLibApi: UIButton!
    
    let defaults = UserDefaults.standard
    
    var datPresLibApi:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let sesionMenu = defaults.object(forKey: "IDUSER") as! [String:String]
        let sesionNombre = sesionMenu["sesionNombre"]
        
        txtIdUser.text=sesionNombre
        txtTitLibroApi.text=datPresLibApi
        txtFecPrestamo.text=String(Date.now.formatted())
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
