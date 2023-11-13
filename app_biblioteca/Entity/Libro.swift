//
//  Libro.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

struct Libro:Codable{
    var id:Int
    var titulo:String
    var autor:Autor
    var anio_publicacion:String
    var editorial:Editorial
}
