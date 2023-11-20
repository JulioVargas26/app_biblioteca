//
//  UsuarioApi.swift
//  app_biblioteca
//
//  Created by julio vargas on 18/11/23.
//

import UIKit

struct UsuarioApi:Codable {

    var id:Int
    var nombre:String
    var direccion:String
    var correo:String
    var telefono:Int
    var username:String
    var contrasenia:String
    var rol:RolApi
    
}
