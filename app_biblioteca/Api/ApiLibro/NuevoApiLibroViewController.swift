//
//  NuevoApiLibroViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire
import DropDown

class NuevoApiLibroViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtPublicacion: UITextField!
    @IBOutlet weak var txtAutor: UITextField!
    @IBOutlet weak var txtEditorial: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func btnRegistrar(_ sender: UIButton) {
        
        //leer cajas
        let tit=txtTitulo.text ?? ""
        let aut=Int(txtAutor.text ?? "0") ?? 0
        let pub=Int(txtPublicacion.text ?? "0") ?? 0
        let edi=Int(txtEditorial.text ?? "0") ?? 0
        
        //crear variable de la estructura Cliente
        //let obj=Libro(id: 0, titulo: tit, autor: aut, anio_publicacion: pub, editorial: edi)
        
        //invocar al metodo grabarCliente
        //registrarLibro(obj: obj)
        print("Registro correcto")
        
    }
    
    func registrarLibro(obj: Libro){
        AF.request("https://api-biblioteca-nl19.onrender.com/api/libro",method: .post,parameters: obj,encoder: JSONParameterEncoder.default).response(completionHandler: {
            data in
            //validar data
            switch data.result{
            case.success(let info):
                do{
                    let result = try JSONDecoder().decode(Libro.self, from: info!)
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
