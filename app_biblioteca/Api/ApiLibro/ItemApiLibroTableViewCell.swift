//
//  ItemApiLibroTableViewCell.swift
//  app_biblioteca
//
//  Created by julio vargas on 12/11/23.
//

import UIKit

class ItemApiLibroTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitLibro: UILabel!
    @IBOutlet weak var lblAutLibro: UILabel!
    @IBOutlet weak var lblAniLibro: UILabel!
    @IBOutlet weak var lblEdiLibro: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
