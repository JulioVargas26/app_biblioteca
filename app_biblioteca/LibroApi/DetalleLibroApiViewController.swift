//
//  DetalleLibroApiViewController.swift
//  app_biblioteca
//
//  Created by julio vargas on 20/11/23.
//

import UIKit

class DetalleLibroApiViewController: UIViewController {
    
    @IBOutlet weak var lblDetTituloApi: UILabel!
    @IBOutlet weak var imgLibroApi: UIImageView!
    @IBOutlet weak var lblAutorApi: UILabel!
    @IBOutlet weak var lblEditorialApi: UILabel!
    @IBOutlet weak var lblAnioApi: UILabel!
    
    var data: Libro!
    
    var listaLibro:[Libro]=[]
    
    var pos = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblDetTituloApi.text=data.titulo
       // imgLibroApi.image=UIImage(named: data.id)
        lblAutorApi.text=data.autor.nombre
        lblEditorialApi.text=data.editorial.nombre
        lblAnioApi.text=String(data.anio_publicacion)
       
        
    }
    @IBAction func btnPrestamoLibroApi(_ sender: UIButton) {
        
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare ")
        if segue.identifier=="PresLibApi"{
            //crear objeto de la clase EditarViewController
            let pantalla2=segue.destination as! PrestamoLibroApiViewController
            
            print("prse " )
            //acceder
            pantalla2.datPresLibApi=String(data.titulo)
            
            print("pres " , pantalla2)
        }
        
    }
    


}
