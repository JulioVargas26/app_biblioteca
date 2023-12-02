//
//  ItemUsuarioTableViewCell.swift
//  app_biblioteca
//
//  Created by julio vargas on 30/11/23.
//

import UIKit

class ItemUsuarioTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblUsuario: UILabel!
    @IBOutlet weak var lblRol: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
