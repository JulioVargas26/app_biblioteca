//
//  EditarApiAutorViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire

class EditarApiAutorViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtFecNac: UITextField!
    @IBOutlet weak var txtPais: UITextField!
    
    var data:Autor!
    var urlAutor="https://api-biblioteca-nl19.onrender.com/api/autor"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtNombre.text=data.nombre
        txtFecNac.text=data.fecha_nacimiento
        txtPais.text=data.nacionalidad
        
        
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let fec=txtFecNac.text ?? ""
        let pai=txtPais.text ?? ""
        
        data.nombre=nom
        data.fecha_nacimiento=fec
        data.nacionalidad=pai
        
        actualizarAutor(obj: data)
        print("Registro actualizado")
        
    }
    
    func actualizarAutor(obj: Autor){
        AF.request(urlAutor+"/",method: .put,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
            data in
            //validar data
            switch data.result{
            case.success(let info):
                do{
                    let result = try JSONDecoder().decode(Autor.self, from: info!)
                }catch{
                    print("error en el Json")
                }
                
            case.failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    /*func mostrarAlerta() {
            let alerta = UIAlertController(title: "Actualizacion Exitosa", message: "El Autor se Actualizo correctamente.", preferredStyle: .alert)
            
            // Puedes agregar más acciones al alerta si lo deseas
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        
            alerta.addAction(okAction)

            // Presentar la alerta
            present(alerta, animated: true, completion: nil)
        
            performSegue(withIdentifier: "apiAutor", sender: self)
        }
    */
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
