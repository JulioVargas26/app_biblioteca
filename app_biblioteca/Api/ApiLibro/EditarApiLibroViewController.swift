//
//  EditarApiLibroViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 2/12/23.
//

import UIKit
import Alamofire

class EditarApiLibroViewController: UIViewController {

    @IBOutlet weak var txtTitulo: UITextField!
    @IBOutlet weak var txtAutor: UITextField!
    @IBOutlet weak var txtPublicacion: UITextField!
    @IBOutlet weak var txtEditorial: UITextField!
    
    var data:Libro!
    var urlAutor="https://api-biblioteca-nl19.onrender.com/api/autor"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtTitulo.text=data.titulo
        //txtAutor.text=data.autor
        txtPublicacion.text=String(data.anio_publicacion)
       // txtEditorial.text=data.editorial
    }
    
    @IBAction func btnActualizar(_ sender: UIButton) {
        
        //leer cajas
        let tit=txtTitulo.text ?? ""
        let aut=txtAutor.text ?? ""
        let pub=Int(txtPublicacion.text ?? "0") ?? 0
        let edi=txtEditorial.text ?? ""
        
        data.titulo=tit
        //data.autor=aut
        data.anio_publicacion=pub
       // data.editorial=edi
        
        actualizarLibro(obj: data)
        print("Registro actualizado")
        
    }
    
    func actualizarLibro(obj: Libro){
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
