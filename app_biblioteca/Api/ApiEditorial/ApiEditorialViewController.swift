//
//  ApiEditorialViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Alamofire
import Kingfisher

class ApiEditorialViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var txtFiltrarEditorial: UITextField!
    @IBOutlet weak var tvEditorial: UITableView!
    
    var pos = -1
    var listaEditorial:[Editorial]=[]
    var urlEditorial="https://api-biblioteca-nl19.onrender.com/api/editorial"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tvEditorial.delegate=self
        tvEditorial.dataSource=self
        tvEditorial.rowHeight=150
        cargarEditorial()
    }
    
    func cargarEditorial(){
        
        //conexion a la url del api
        AF.request(urlEditorial).responseDecodable(of: [Editorial].self){
            
            response in guard let data=response.value else{return}
            
            debugPrint("Response: \(response)")
            
            self.listaEditorial=data
            self.tvEditorial.reloadData()
        }
        
    }
    
    func eliminarEditorial(cod: Int){
        AF.request(urlEditorial+"/"+String(cod),method: .delete
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
            return listaEditorial.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvEditorial.dequeueReusableCell(withIdentifier: "ItemEditorialApi")
                as! ItemApiEditorialTableViewCell
            //imprimir datos
            row.lblNomEditorial.text=listaEditorial[indexPath.row].nombre
            row.lblDirEditorial.text=listaEditorial[indexPath.row].direccion
            row.lblTelEditorial.text=String(listaEditorial[indexPath.row].telefono)
            return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editarEditorialApi", sender: self)
        print("pos",pos)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            
            var del=listaEditorial.remove(at: indexPath.row)
            eliminarEditorial(cod: del.id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if segue.identifier=="editarEditorialApi"{
            //crear objeto de la clase EditarViewController
            let autor=segue.destination as! EditarApiEditorialViewController
            //acceder
            autor.data=listaEditorial[pos]
        }
        
    }
    
}
