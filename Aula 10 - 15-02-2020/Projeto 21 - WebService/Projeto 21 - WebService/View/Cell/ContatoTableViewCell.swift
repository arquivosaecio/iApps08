//
//  ContatoTableViewCell.swift
//  Projeto 21 - WebService
//
//  Created by Master Mac on 03/08/19.
//  Copyright © 2019 Aecio. All rights reserved.
//

import UIKit

class ContatoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var foneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
