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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        tvAutor.delegate=self
        tvAutor.dataSource=self
        tvAutor.rowHeight=120
        cargarAutor()
    }
    
    func cargarAutor(){
        
        //conexion a la url del api
        AF.request("https://api-biblioteca-nl19.onrender.com/api/autor").responseDecodable(of: [Autor].self){
            
            response in guard let data=response.value else{return}
            self.listaAutor=data
            self.tvAutor.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAutor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row=tvAutor.dequeueReusableCell(withIdentifier: "itemAutor")
                as! ItemApiAutorTableViewCell
            //imprimir datos
            row.lblNomAutor.text=listaAutor[indexPath.row].nombre
        
        
        /*let today = Date.now
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .short
        print(formatter1.string(from: today))
        */
        
        row.lblFecNacAutor.text=DateFormatter().string(from:listaAutor[indexPath.row].fecha_nacimiento)
            row.lblNaciAutor.text=listaAutor[indexPath.row].nacionalidad
            return row
    }
    
    @IBAction func btnBuscarAutor(_ sender: UIButton) {
    }
    
    

}
