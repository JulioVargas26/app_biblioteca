//
//  ItemApiEditorialTableViewCell.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class ItemApiEditorialTableViewCell: UITableViewCell {

    @IBOutlet weak var lblNomEditorial: UILabel!
    @IBOutlet weak var lblDirEditorial: UILabel!
    @IBOutlet weak var lblTelEditorial: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
