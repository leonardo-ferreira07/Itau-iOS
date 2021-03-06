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
        body.attributedText = item.output.bodyAttributed
        author.text = item.output.user.login
        date.text = item.output.date
        addAccessibility(item)
    }
    
    private func addAccessibility(_ item: PullRequestCellViewModel) {
        title.accessibilityLabel = "nome do pull request"
        title.accessibilityValue = item.output.title
        body.accessibilityLabel = "corpo do pull request"
        body.accessibilityAttributedValue = item.output.bodyAttributed
        author.accessibilityLabel = "nome do autor do pull request"
        author.accessibilityValue = item.output.user.login
        date.accessibilityLabel = "data de criação do pull request"
        date.accessibilityValue = item.output.date
    }
}
