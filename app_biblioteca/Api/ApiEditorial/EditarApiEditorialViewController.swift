//
//  EditarApiEditorialViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire

class EditarApiEditorialViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    var data:Editorial!
    var urlEditorial="https://api-biblioteca-nl19.onrender.com/api/autor"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtNombre.text=data.nombre
        txtDireccion.text=data.direccion
        txtTelefono.text=data.telefono
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let dir=txtDireccion.text ?? ""
        let tel=txtTelefono.text ?? ""
        
        data.nombre=nom
        data.direccion=dir
        data.telefono=tel
        
        actualizarEditorial(obj: data)
        print("Registro actualizado")
        
    }
    
    func actualizarEditorial(obj: Editorial){
        AF.request(urlEditorial+"/",method: .put,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
            data in
            //validar data
            switch data.result{
            case.success(let info):
                do{
                    let result = try JSONDecoder().decode(Editorial.self, from: info!)
                }catch{
                    print("error en el Json")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        })
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
