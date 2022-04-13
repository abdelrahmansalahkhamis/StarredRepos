//
//  RepoCell.swift
//  StarredRepos
//
//  Created by abdrahman on 11/04/2022.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoStars: UILabel!
    @IBOutlet weak var repoIssues: UILabel!
    @IBOutlet weak var timeIntervalByOwner: UILabel!
    
    @IBOutlet weak var starsView: UIView!
    @IBOutlet weak var issuesView: UIView!
  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        starsView.layer.borderColor = UIColor.black.cgColor
        starsView.layer.borderWidth = 1
        
        issuesView.layer.borderColor = UIColor.black.cgColor
        issuesView.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        // asd
    }
    func update(with viewModel: RepoCellViewModel){
        repoName.text = viewModel.name
        repoDescription.text = viewModel.itemDescription
        repoStars.text = "\(viewModel.stargazersCount)"
        repoIssues.text = "\(viewModel.openIssuesCount)"
        timeIntervalByOwner.text = "submitted " + "\(viewModel.timeInterval) " + "days age by " + viewModel.username
        viewModel.loadAvatar { image in
            self.userAvatar.image = image
        }
//        if let timeRemainingViewModel = viewModel.timeRemainingViewModel{
//            timeRemainingStackView.update(with: timeRemainingViewModel)
//        }
//
//        dateLabel.text = viewModel.dateText
//        eventNameLabel.text = viewModel.eventName
//        viewModel.loadImage { (image) in
//            self.backgroundImageView.image = image
//        }
        
    }
}
