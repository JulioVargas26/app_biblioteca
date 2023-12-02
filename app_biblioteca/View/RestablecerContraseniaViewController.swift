//
//  RestablecerContraseniaViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit

class RestablecerContraseniaViewController: UIViewController {

    @IBOutlet weak var txtUserCorreo: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    @IBOutlet weak var txtContra2: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnReestablecer(_ sender: UIButton) {
        
        
        //leer cajas
        let usu=txtUserCorreo.text ?? ""
        let con=txtContra.text ?? ""
        let con2=txtContra2.text ?? ""
        
        LoginController().cambiarContrasena(correo: usu, nuevaContraseña: con, confirmarNuevaContraseña: con2)
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
