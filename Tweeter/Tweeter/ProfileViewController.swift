//
//  ProfileViewController.swift
//  Tweeter
//
//  Created by Anita on 2/28/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var displaynameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetsCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    
    var tweet: Tweet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coverImageView.setImageWithURL(NSURL(string: tweet.user!.coverUrl! as String)!)

        profileImageView.layer.cornerRadius = 7.0
        profileImageView.clipsToBounds = true
        profileImageView.setImageWithURL(tweet.user!.profileUrl!)
        
        displaynameLabel.text = tweet.displayname
        usernameLabel.text = "@\(tweet.username!)"
        taglineLabel.text = tweet.user!.tagline as? String
        tweetsCountLabel.text = "\(tweet.user!.tweetsCount!) Tweets"
        followersCountLabel.text = "\(tweet.user!.followerCount!) Followers"
        followingCountLabel.text = "\(tweet.user!.followingCount!) Following"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onBackButton(sender: UIBarButtonItem) {
        print("clicked on back")
        dismissViewControllerAnimated(true, completion: nil)

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
