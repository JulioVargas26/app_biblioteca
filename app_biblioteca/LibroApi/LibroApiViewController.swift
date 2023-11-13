//
//  LibroApiViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit
import Alamofire
import Kingfisher

class LibroApiViewController: UIViewController,
                              UICollectionViewDataSource,
                              UICollectionViewDelegate,
                              UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var txtFiltro: UITextField!
    @IBOutlet weak var cvLibros: UICollectionView!
    
    var listaLibro:[Libro]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        cvLibros.dataSource=self
        cvLibros.delegate=self
        cargarProductos()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaLibro.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fila=collectionView.dequeueReusableCell(withReuseIdentifier: "row", for: indexPath) as! ItemLibroCollectionViewCell
                
                //imprimir datos en el collection
                fila.lblTitle.text=listaLibro[indexPath.row].titulo
                
                //let url = URL(string: listaProductos[indexPath.row].image)
                //fila.imgFoto.kf.setImage(with: url)
                print(fila)
                return fila
    }
    
    func cargarProductos(){
            //conexion a la url del api
            AF.request("https://api-biblioteca-nl19.onrender.com/api/libro").responseDecodable(of: [Libro].self){
                
                response in guard let data=response.value else{return}
                self.listaLibro=data
                
                self.cvLibros.reloadData()
            }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let width=(collectionView.frame.width-10)/2
            
            return CGSize(width: width, height: 300)
        }
        
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let cod=listaLibro[indexPath.row].id
            
            print("id : ",cod)
        }

}
