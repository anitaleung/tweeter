//
//  TweetCell.swift
//  Tweeter
//
//  Created by Anita on 2/21/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
//    var tweet: Tweet? {
//        didSet {
//            if let tweet = tweet {
//                tweetContentLabel.text = tweet.text as? String
//            }
////            thumbImageView.setImageWithURL(NSURL(string: tweet.user.profileImageUrl)!)
////            screennameLabel.text = tweet.user.username
////            userNameLabel.text = "@" + tweet.user.screenname
////            let interval: Int = Int(NSDate().timeIntervalSinceDate(tweet.createdAt))
////            //createdTimeLabel.text = makeCreatedTimeLabelText(interval)
//            
//
//        }
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
