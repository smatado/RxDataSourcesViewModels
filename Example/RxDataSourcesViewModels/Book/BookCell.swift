//
//  BookCell.swift
//  Books
//
//  Created by Silbino Gonçalves Matado on 2020-01-06.
//  Copyright © 2020 Silbino Gonçalves Matado. All rights reserved.
//

import UIKit
import RxDataSourcesViewModels

class BookCell: UITableViewCell, CellRegistrable, CellViewModelConfigurable, NibInstantiable  {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    static var cellIdentifier: String = "BookCellIdentifier"
    static var nibName: String = "BookCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func configure(with viewModel: CellViewModelType) {
        guard let viewModel = viewModel as? BookCellViewModel else { return }
        titleLabel.text = viewModel.title
        detailLabel.text = viewModel.releaseDate
    }
}
