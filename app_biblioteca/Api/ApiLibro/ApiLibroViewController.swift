//
//  ApiLibroViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Alamofire
import Kingfisher

class ApiLibroViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    

    @IBOutlet weak var txtFiltrarLibro: UITextField!
    @IBOutlet weak var tvLibro: UITableView!
    
    var pos = -1
    var listaLibro:[Libro]=[]
    var urlLibro="https://api-biblioteca-nl19.onrender.com/api/libro"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tvLibro.delegate=self
        tvLibro.dataSource=self
        tvLibro.rowHeight=200
        cargarLibro()
    }
    
    func cargarLibro(){
        
        //conexion a la url del api
        AF.request(urlLibro).responseDecodable(of: [Libro].self){
            
            response in guard let data=response.value else{return}
            
            debugPrint("Response: \(response)")
            
            self.listaLibro=data
            self.tvLibro.reloadData()
        }
        
    }
    
    func eliminarLibro(cod: Int){
        AF.request(urlLibro+"/"+String(cod),method: .delete
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
        return listaLibro.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvLibro.dequeueReusableCell(withIdentifier: "ItemLibroApi")
                as! ItemApiLibroTableViewCell
            //imprimir datos
            row.lblTitLibro.text=listaLibro[indexPath.row].titulo
        row.lblAutLibro.text=listaLibro[indexPath.row].autor.nombre
        row.lblAniLibro.text=String(listaLibro[indexPath.row].anio_publicacion)
        row.lblEdiLibro.text=listaLibro[indexPath.row].editorial.nombre
            return row
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pos=indexPath.row
        performSegue(withIdentifier: "editarLibroApi", sender: self)
        print("pos",pos)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            tableView.beginUpdates()
            
            var del=listaLibro.remove(at: indexPath.row)
            eliminarLibro(cod: del.id)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           
        if segue.identifier=="editarLibroApi"{
            //crear objeto de la clase EditarViewController
            let autor=segue.destination as! EditarApiLibroViewController
            //acceder
            autor.data=listaLibro[pos]
        }
        
    }
    
    @IBAction func btnBuscarLibro(_ sender: UIButton) {
    }
    
    
}
