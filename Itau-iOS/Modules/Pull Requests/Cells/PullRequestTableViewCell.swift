//
//  PullRequestTableViewCell.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 22/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

class PullRequestTableViewCell: BaseCell<PullRequestsViewModel> {

    @IBOutlet private weak var title: UILabel!
    @IBOutlet private weak var body: UILabel!
    @IBOutlet private weak var author: UILabel!
    @IBOutlet private weak var date: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PullRequestTableViewCell: ItemizableCell {
    func configure(_ item: Itemizable, at indexPath: IndexPath) {
        guard let item = item as? PullRequestCellViewModel else { return }
        title.text = item.output.title
        body.text = item.output.body
        author.text = item.output.user.login
        date.text = item.output.date
    }
}
