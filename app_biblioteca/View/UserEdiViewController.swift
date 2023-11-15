//
//  UserEdiViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Toaster
import DropDown

class UserEdiViewController: UIViewController {

    @IBOutlet weak var txtNomUser: UITextField!
    @IBOutlet weak var txtDirUser: UITextField!
    @IBOutlet weak var txtCorUser: UITextField!
    @IBOutlet weak var txtTelUser: UITextField!
    
    @IBOutlet weak var btnCambiarConUser: UIButton!
    
    @IBOutlet weak var lblNuConUser: UILabel!
    @IBOutlet weak var txtConUser: UITextField!
    @IBOutlet weak var lblReConUser: UILabel!
    @IBOutlet weak var txtConUser2: UITextField!
    
    var bean:UsuarioEntity!
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // txtNomUser.placeholder = bean.nombre
       // txtDirUser.placeholder = bean.direccion
       // txtCorUser.placeholder = bean.correo
       // txtTelUser.placeholder = String( bean.telefono)
        
        lblNuConUser.isHidden=true
        txtConUser.isHidden=true
        lblReConUser.isHidden=true
        txtConUser2.isHidden=true
        
        //asignar IMG a los botones(soltero.casado,viudo)
        btnCambiarConUser.setImage(UIImage(named: "radio_off"), for: .normal)
        btnCambiarConUser.setImage(UIImage(named: "radio_on"), for: .selected)
        
        
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        
       
        if sender==btnCambiarConUser{
            btnCambiarConUser.isSelected=true
                txtConUser.placeholder = "Escriba la nueva contrasenia"
                txtConUser2.placeholder="Vuelve a escribir la contraseña"
                lblNuConUser.isHidden=false
                txtConUser.isHidden=false
                
                lblReConUser.isHidden=false
                txtConUser2.isHidden=false
                
            }else {
                btnCambiarConUser.isSelected=false
                lblNuConUser.isHidden=true
                txtConUser.isHidden=true
                lblReConUser.isHidden=true
                txtConUser2.isHidden=true
            }
        }
            
            
            
        
    
    @IBAction func btnActualizarUser(_ sender: UIButton) {
        
        
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
