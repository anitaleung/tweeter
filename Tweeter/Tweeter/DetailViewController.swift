//
//  DetailViewController.swift
//  Tweeter
//
//  Created by Anita on 2/28/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displaynameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    
    var toggleRetweet: Bool = false
    var toggleFavorite: Bool = false
    
    var numFavorites = Int()
    var numRetweet = Int()
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        numFavorites = tweet.favoritesCount
        numRetweet = tweet.retweetCount
        
        profileImageView.layer.cornerRadius = 7.0
        profileImageView.clipsToBounds = true
        profileImageView.setImageWithURL(tweet.user!.profileUrl!)
        
        displaynameLabel.text = tweet.displayname
        usernameLabel.text = "@\(tweet.username!)"
        tweetContent.text = tweet.text! as String
        timestampLabel.text = "\(tweet.time!)"
        retweetCountLabel.text = "\(tweet.retweetCount)"
        favoriteCountLabel.text = "\(tweet.favoritesCount)"
 
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func onDetailsRetweetButton(sender: AnyObject) {
        if toggleRetweet  {
            numRetweet--
            toggleRetweet = !toggleRetweet
            sender.setImage(UIImage(named: "retweet-action_default"), forState: UIControlState.Normal)
        } else {
            numRetweet++
            toggleRetweet = !toggleRetweet
            sender.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
        }
        retweetCountLabel.text = "\(numRetweet)"
    }
    
    @IBAction func onDetailsFavoriteButton(sender: AnyObject) {
        if toggleFavorite {
            numFavorites--
            toggleFavorite = !toggleFavorite
            sender.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
        } else{
            numFavorites++
            toggleFavorite = !toggleFavorite
            sender.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
        }
        favoriteCountLabel.text = "\(numFavorites)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
