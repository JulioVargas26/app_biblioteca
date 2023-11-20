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
        AF.request("https://api-biblioteca-nl19.onrender.com/api/editorial").responseDecodable(of: [Editorial].self){
            
            response in guard let data=response.value else{return}
            
            debugPrint("Response: \(response)")
            
            self.listaEditorial=data
            self.tvEditorial.reloadData()
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
    
}
