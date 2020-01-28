//
//  AuthorCell.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import UIKit
import RxDataSourcesViewModels

class AuthorCell: UITableViewCell, CellRegistrable, CellViewModelConfigurable, NibInstantiable {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    static var cellIdentifier: String = "AuthorCellIdentifier"
    static var nibName: String = "AuthorCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configure(with viewModel: CellViewModelType) {
        guard let viewModel = viewModel as? AuthorCellViewModel else { return }
        titleLabel.text = viewModel.name
        detailLabel.text = viewModel.birthDate
    }
}
