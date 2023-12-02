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
    @IBOutlet weak var btnCancelConUser: UIButton!
    
    @IBOutlet weak var lblNuConUser: UILabel!
    @IBOutlet weak var txtConUser: UITextField!
    @IBOutlet weak var lblReConUser: UILabel!
    @IBOutlet weak var txtConUser2: UITextField!
    
    var data:UsuarioEntity!
    let dropDown = DropDown()
    let defaults = UserDefaults.standard
   
    
    override func viewDidLoad() {
            super.viewDidLoad()

        let sesionMenu = defaults.object(forKey: "IDUSER") as! [String:String]
       // let sesionNombre = sesionMenu["sesionNOM"]
        print("sesion edit ",sesionMenu)
        
        // Do any additional setup after loading the view.
        txtNomUser.text = sesionMenu["sesionNOM"]
        txtDirUser.text = sesionMenu["sesionDIR"]
        txtCorUser.text = sesionMenu["sesionCOR"]
        txtTelUser.text = sesionMenu["sesionTEL"]
        
        txtCorUser.text = sesionMenu["sesionCOR"]
        txtTelUser.text = sesionMenu["sesionTEL"]
        
        lblNuConUser.isHidden=true
        txtConUser.isHidden=true
        lblReConUser.isHidden=true
        txtConUser2.isHidden=true
        
        //asignar IMG a los botones(soltero.casado,viudo)
        btnCambiarConUser.setImage(UIImage(named: "radio_off"), for: .normal)
        btnCambiarConUser.setImage(UIImage(named: "radio_on"), for: .selected)
        btnCancelConUser.setImage(UIImage(named: "radio_off"), for: .normal)
        btnCancelConUser.setImage(UIImage(named: "radio_on"), for: .selected)
        
        
    }
    
    @IBAction func btnSelect(_ sender: UIButton) {
        
       
        if sender==btnCambiarConUser{
            btnCambiarConUser.isSelected=true
            btnCancelConUser.isSelected=false
            txtConUser.placeholder = "Escriba la nueva contrasenia"
            txtConUser2.placeholder="Vuelve a escribir la contraseña"
                
            lblNuConUser.isHidden=false
            txtConUser.isHidden=false
            lblReConUser.isHidden=false
            txtConUser2.isHidden=false
                
            }
        else if sender==btnCancelConUser{
            btnCancelConUser.isSelected=true
            btnCambiarConUser.isSelected=false
            
            lblNuConUser.isHidden=true
            txtConUser.isHidden=true
            lblReConUser.isHidden=true
            txtConUser2.isHidden=true
            }
        
        }
            
    @IBAction func btnActualizarUser(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNomUser.text ?? ""
        let dir=txtDirUser.text ?? ""
        let cor=txtCorUser.text ?? ""
        let tel=Int(txtTelUser.text ?? "0") ?? 0
        let con=txtConUser.text ?? ""
        let con2=txtConUser2.text ?? ""
        
        let contra=(con == con2)
        
        print("nom" , nom )
        print("dir" , dir )
        print("cor" , cor )
        print("tel" , tel )
        print("con" , con )
        print("con2" , con2 )
        print("contra" , contra)
        
        if(nom==""){
            Toast(text: "el campo nombre es obligatorio").show()
        }
        if(dir==""){
            Toast(text: "el campo direccion es obligatorio").show()
        }
        if(cor==""){
            Toast(text: "Dirección de correo electrónico no válida").show()
        }
        if(tel==0){
            Toast(text: "el campo telefono es obligatorio").show()
        }
        if(con==""){
            Toast(text: "Contraseña no válida. Introduce una contraseña").show()
        }
        if(con2==""){
            Toast(text: "Las contraseñas no coinciden").show()
        }
        if(contra == false){
            Toast(text: "Las contraseñas no coinciden. Compruébalas y vuelve a intentarlo.").show()
        }
        //
        
        var sesionData = defaults.object(forKey: "IDUSER") as! [String:String]
        if sesionData["SesionID"] == String(data.id){
            print("if id", sesionData)
            print("id ",data.id)
            
            
            data.nombre=nom
            data.direccion=dir
            data.correo=cor
            data.telefono=Int32(tel)
            data.contrasenia=con2
            
            print("data ", data)
            //invocar al metodo modificarCliente
            UsuarioController().actualizarUsuario(bean: data)
            print("Registro actualizado")
        }
        
    }
   

}
