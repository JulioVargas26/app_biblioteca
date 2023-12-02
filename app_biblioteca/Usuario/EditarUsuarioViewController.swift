//
//  EditarUsuarioViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 30/11/23.
//

import UIKit

class EditarUsuarioViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    @IBOutlet weak var txtCorreo: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    @IBOutlet weak var txtContra: UITextField!
    @IBOutlet weak var txtRol: UITextField!
    
    var data:UsuarioEntity!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtNombre.text=data.nombre
        txtDireccion.text=data.direccion
        txtTelefono.text=String(data.telefono)
        txtCorreo.text=data.correo
        txtUser.text=data.username
        txtContra.text=data.contrasenia
        txtRol.text=data.rol
        
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        //leer cajas
        let nom=txtNombre.text ?? ""
        let dir=txtDireccion.text ?? ""
        let tel=Int32(txtTelefono.text ?? "0") ?? 0
        let cor=txtCorreo.text ?? ""
        let use=txtUser.text ?? ""
        let con=txtContra.text ?? ""
        let rol=txtRol.text ?? ""
        
        //
        data.nombre=nom
        data.direccion=dir
        data.telefono=tel
        data.correo=cor
        data.username=use
        data.contrasenia=con
        data.rol=rol
        
        //invocar al metodo modificarCliente
        UsuarioController().actualizarUsuario(bean: data)
        print("Registro actualizado")
        
        let alerta = UIAlertController(title: "Actualizacion Exitosa", message: "Se Actualizo Correctamente.", preferredStyle: .alert)
        
        // Puedes agregar más acciones al alerta si lo deseas
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alerta.addAction(okAction)

        // Presentar la alerta
        present(alerta, animated: true, completion: nil)
        
        performSegue(withIdentifier: "nuevo1", sender: self)
    }
    
    @IBAction func btnEliminar(_ sender: UIButton) {
        //crear ventana
         let ventana=UIAlertController(title: "Sistema", message: "Seguro de eliminar?", preferredStyle: .alert)
        //boton aceptar
         let botonAceptar=UIAlertAction(title: "Si", style: .default,handler: {action in
             UsuarioController().eliminarUsuario(bean: self.data)
         })
        //adicionar boton aceptar
         ventana.addAction(botonAceptar)
        //adicionar boton cancelar
         ventana.addAction(UIAlertAction(title: "No", style: .cancel))
        //mostrar venta
        present(ventana, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="actualizaUsuario"{
            //crear objeto de la clase EditarViewController
            let lista=segue.destination as! ListadoUsuarioViewController
            //acceder
            //pantalla2.data=listaClientes[pos]
        }
        
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
