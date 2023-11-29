//
//  ListadoPrestamoViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 28/11/23.
//

import UIKit
import FirebaseFirestore

class ListadoPrestamoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    

    @IBOutlet weak var tvPrestamo: UITableView!
    
    var listPrestamo:[prestamo]=[]
    
    var pos = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tvPrestamo.dataSource=self
        //
        tvPrestamo.delegate=self
        //alto de la celda
        tvPrestamo.rowHeight=150
        
        listado()
    }
    
    func listado(){
        let db = Firestore.firestore()
        db.collection("prestamo").addSnapshotListener{(data, error) in
            
            guard let info=data?.documents else {
                return
            }
            
            self.listPrestamo=info.map{(e)->prestamo in
                let row=e.data()
                let nom=row["nomUsu"] as! String
                let tit=row["titLibro"] as! String
                let fecP=row["fec_prestamo"] as! String
                let fecD=row["fec_devolucion"] as! String
                return prestamo(id: "", nomUsu: nom, titLibro: tit, fec_prestamo: fecP, fec_devolucion: fecD)
            }
            
            self.tvPrestamo.reloadData()
            print(self.listPrestamo.count)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPrestamo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = tableView.dequeueReusableCell(withIdentifier: "ItemPrestamo", for: indexPath) as! ItemListadoPrestamoTableViewCell
            
        row.lblTitLibroPres.text = listPrestamo[indexPath.row].titLibro
        row.lblFecDLibroPres.text = listPrestamo[indexPath.row].fec_devolucion
        row.lblUsuLibroPres.text = listPrestamo[indexPath.row].nomUsu
            
        return row
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
