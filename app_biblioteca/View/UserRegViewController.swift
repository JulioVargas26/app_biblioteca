//
//  UserRegViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Toaster

class UserRegViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtContrasenia: UITextField!
    @IBOutlet weak var txtContrasenia2: UITextField!
    
    let bean:[UsuarioEntity]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGrabar(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let dir=txtDireccion.text ?? ""
        let cor=txtCorreo.text ?? ""
        let tel=Int(txtTelefono.text ?? "0") ?? 0
        let usu=txtUsername.text ?? ""
        let con=txtContrasenia.text ?? ""
        let con2=txtContrasenia2.text ?? ""
        
        let contra=(con == con2)
        let lis=bean.count
        let cod=Int16(lis + 1)
        
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
        if(usu==""){
            Toast(text: "el campo usuario es obligatorio").show()
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
        //crear variable de la estructura Usuario
        let obj=Usuario(id: Int(cod), nombre: nom, direccion: dir, correo: cor, telefono: Int(tel), username: usu, contrasenia: con2, rol: "usuario")
            
        if(nom != "" && dir != "" && cor != "" && tel != 0 && usu != "" && contra != false){
            //invocar al metodo registrarUsuario
            UsuarioController().registrarUsuario(bean: obj)
            Toast(text:"Registro Correcto").show()
        }
    }
    

}
