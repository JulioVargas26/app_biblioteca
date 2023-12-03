//
//  NuevoApiAutorViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire

class NuevoApiAutorViewController: UIViewController {

    @IBOutlet weak var txtNombre: UITextField!
    @IBOutlet weak var txtFecNac: UITextField!
    @IBOutlet weak var txtPais: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnRegistrar(_ sender: UIButton) {
       
        //leer cajas
        let nom=txtNombre.text ?? ""
        let fec=txtFecNac.text ?? ""
        let pai=txtPais.text ?? ""
        
        //crear variable de la estructura Cliente
        let obj=Autor(id: 0, nombre: nom, fecha_nacimiento: fec, nacionalidad: pai)
        //invocar al metodo grabarCliente
        registrarAutor(obj: obj)
        print("Registro correcto")
        
    }
    
    func registrarAutor(obj: Autor){
        AF.request("https://api-biblioteca-nl19.onrender.com/api/autor",method: .post,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
