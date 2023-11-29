//
//  ItemListadoPrestamoTableViewCell.swift
//  app_biblioteca
//
//  Created by julio vargas on 28/11/23.
//

import UIKit

class ItemListadoPrestamoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitLibroPres: UILabel!
    @IBOutlet weak var lblUsuLibroPres: UILabel!
    @IBOutlet weak var lblFecDLibroPres: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
