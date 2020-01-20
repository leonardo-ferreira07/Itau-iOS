//
//  RepositoryTableViewCell.swift
//  Itau-iOS
//
//  Created by Leonardo Vinicius Kaminski Ferreira on 20/01/20.
//  Copyright © 2020 Leonardo Ferreira. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet private var repoName: UILabel!
    @IBOutlet private var repoDescription: UILabel!
    @IBOutlet private var stars: UILabel!
    @IBOutlet private var forks: UILabel!
    @IBOutlet private var userName: UILabel!
    @IBOutlet private var profilePicture: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(with cell: RepositoriesCell) {
        let repository = cell.repository
        repoName.text = repository?.name
        repoName.accessibilityLabel = "nome do repositório"
        repoName.accessibilityValue = repository?.name
        repoDescription.text = repository?.description
        repoDescription.accessibilityLabel = "descrição do repositório"
        repoDescription.accessibilityValue = repository?.description
        stars.text = "\(repository?.stars ?? 0)"
        stars.accessibilityLabel = "número de estrelas do repositório"
        stars.accessibilityValue = "\(repository?.stars ?? 0)"
        forks.text = "\(repository?.forks ?? 0)"
        forks.accessibilityLabel = "número de forks do repositório"
        forks.accessibilityValue = "\(repository?.forks ?? 0)"
        userName.text = repository?.owner.login
        userName.accessibilityLabel = "nome do usuário dono do repositório"
        userName.accessibilityValue = repository?.owner.login
        
    }
    
    func setCellImages(with cell: RepositoriesCell) {
        let repository = cell.repository
        profilePicture.loadImage(repository?.owner.avatar)
        profilePicture.accessibilityLabel = "foto do usuário dono do repositório"
    }
}
