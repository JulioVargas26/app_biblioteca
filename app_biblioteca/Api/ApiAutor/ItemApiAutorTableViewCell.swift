//
//  ItemApiAutorTableViewCell.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class ItemApiAutorTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomAutor: UILabel!
    @IBOutlet weak var lblFecNacAutor: UILabel!
    @IBOutlet weak var lblNaciAutor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
