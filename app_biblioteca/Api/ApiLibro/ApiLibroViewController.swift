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
        AF.request("https://api-biblioteca-nl19.onrender.com/api/libro").responseDecodable(of: [Libro].self){
            
            response in guard let data=response.value else{return}
            
            debugPrint("Response: \(response)")
            
            self.listaLibro=data
            self.tvLibro.reloadData()
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
    
    @IBAction func btnBuscarLibro(_ sender: UIButton) {
    }
    
    
}
