//
//  ViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import CoreData
import Toaster

class ViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtContrasenia: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        if let login = txtUsername.text,
            let password = txtContrasenia.text {
            let resultado = LoginController().IniciarSesion(username: login, contrasenia: password)

                if resultado.success {
                    Toast(text: "Inicio de sesión exitoso").show()

                    if let rol = resultado.rol {
                        // Puedes agregar condiciones adicionales según el rol del usuario
                        if rol == "administrador" {
                            performSegue(withIdentifier: "mainAdmin", sender: self)
                        } else if rol == "usuario"  {
                            performSegue(withIdentifier: "mainUser", sender: self)
                        } else {
                            // Manejar otros roles si es necesario
                        }
                    } else {
                        // Manejar el caso donde el rol es nil
                    }
                } else {
                    Toast(text: "Inicio de sesión fallido").show()
                }
            }
        
    }
    
    
    
}

