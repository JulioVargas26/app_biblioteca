//
//  NuevoApiEditorialViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire

class NuevoApiEditorialViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtDireccion: UITextField!
    @IBOutlet weak var txtTelefono: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
        
        //leer cajas
        let nom=txtNombre.text ?? ""
        let dir=txtDireccion.text ?? ""
        let tel=txtTelefono.text ?? ""
        
        //crear variable de la estructura Cliente
        let obj=Editorial(id: 0, nombre: nom, direccion: dir, telefono: tel)
        //invocar al metodo grabarCliente
        registrarEditorial(obj: obj)
        print("Registro correcto")
        
    }
    
    func registrarEditorial(obj: Editorial){
        AF.request("https://api-biblioteca-nl19.onrender.com/api/editorial",method: .post,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
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
