//
//  TweetCell.swift
//  Tweeter
//
//  Created by Anita on 2/21/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var retweetLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    
    var toggleRetweet: Bool = false
    var toggleFavorite: Bool = false
    
    var numFavorites = Int()
    var numRetweet = Int()
    
    var tweet: Tweet! {
        didSet {
            
            favoriteLabel.text = "\(tweet.favoritesCount)"
            numFavorites = tweet.favoritesCount
            retweetLabel.text = "\(tweet.retweetCount)"
            numRetweet = tweet.retweetCount
            
//            thumbImageView.setImageWithURL(NSURL(string: tweet.user.profileImageUrl)!)
//            screennameLabel.text = tweet.user.username
//            userNameLabel.text = "@" + tweet.user.screenname
//            let interval: Int = Int(NSDate().timeIntervalSinceDate(tweet.createdAt))
//            //createdTimeLabel.text = makeCreatedTimeLabelText(interval)
            

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onRetweetButton(sender: AnyObject) {
        if toggleRetweet  {
            numRetweet--
            toggleRetweet = !toggleRetweet
            sender.setImage(UIImage(named: "retweet-action_default"), forState: UIControlState.Normal)
        } else {
            numRetweet++
            toggleRetweet = !toggleRetweet
            sender.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
        }
        retweetLabel.text = "\(numRetweet)"
    }
    
    @IBAction func onFavoriteButton(sender: AnyObject) {
        if toggleFavorite {
            numFavorites--
            toggleFavorite = !toggleFavorite
            sender.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
        } else{
            numFavorites++
            toggleFavorite = !toggleFavorite
            sender.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
        }
        favoriteLabel.text = "\(numFavorites)"
    }

    

}
