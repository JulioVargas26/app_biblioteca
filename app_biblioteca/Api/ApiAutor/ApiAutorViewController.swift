//
//  ApiAutorViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Alamofire
import Kingfisher

class ApiAutorViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    @IBOutlet weak var txtFiltrarAutor: UITextField!
    @IBOutlet weak var tvAutor: UITableView!
    
    var pos = -1
    var listaAutor:[Autor]=[]
    var urlAutor="https://api-biblioteca-nl19.onrender.com/api/autor"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tvAutor.delegate=self
        tvAutor.dataSource=self
        tvAutor.rowHeight=150
        cargarAutor()
        tvAutor.reloadData()
        
        print(listaAutor.count)
    }
    
    func cargarAutor(){
        
        //conexion a la url del api
        AF.request(urlAutor).responseDecodable(of: [Autor].self){
            
            response in guard let data=response.value else{return}
            
            debugPrint("Response: \(response)")
            
            self.listaAutor=data
            self.tvAutor.reloadData()
        }
        
    }
    
    func eliminarAutor(cod: Int){
        AF.request(urlAutor+"/"+String(cod),method: .delete
        ).responseData{ data in
            //validar data
            switch data.result{
            case.success(let info):
                print("correcto")
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAutor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let row=tvAutor.dequeueReusableCell(withIdentifier: "ItemAutorApi")
                as! ItemApiAutorTableViewCell
            //imprimir datos
            row.lblNomAutor.text=listaAutor[indexPath.row].nombre
            row.lblFecNacAutor.text=listaAutor[indexPath.row].fecha_nacimiento
            row.lblNaciAutor.text=listaAutor[indexPath.row].nacionalidad
            return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editarAutorApi", sender: self)
        print("pos",pos)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            
            var del=listaAutor.remove(at: indexPath.row)
            eliminarAutor(cod: del.id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if segue.identifier=="editarAutorApi"{
            //crear objeto de la clase EditarViewController
            let autor=segue.destination as! EditarApiAutorViewController
            //acceder
            autor.data=listaAutor[pos]
        }
        
    }
    
    @IBAction func btnBuscarAutor(_ sender: UIButton) {
    }
    
    

}
