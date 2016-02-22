//
//  TweetsViewController.swift
//  Tweeter
//
//  Created by Anita on 2/21/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var tweets: [Tweet]!
    var toggleFavorite = 1
    var toggleRetweet = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
      
        TwitterClient.sharedInstance.homeTimeline({ (tweets: [Tweet]) -> () in
            self.tweets = tweets
            
            for tweet in tweets {
                print (tweet.text)
                print("Text: \(tweet.text!)")
                print("Timestamp: \(tweet.timestamp)")
                print("Favorites: \(tweet.favoritesCount)")
                print("Retweets: \(tweet.retweetCount)")
            }
            
            self.tableView.reloadData()
            
        }) { (error: NSError) -> () in
            print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(sender: AnyObject) {
        TwitterClient.sharedInstance.logout()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TweetCell", forIndexPath: indexPath) as! TweetCell
        let tweet = tweets[indexPath.row]
        
        cell.usernameLabel.text = "@\(tweet.username!)"
        cell.screennameLabel.text = tweet.displayname
        cell.tweetContentLabel.text = tweet.text as? String
        cell.retweetLabel.text = "\(tweet.retweetCount)"
        cell.favoriteLabel.text = "\(tweet.favoritesCount)"
        cell.timestampLabel.text = "\(tweet.timestamp!)"
        
        
        cell.profileImageView.layer.cornerRadius = 7.0
        cell.profileImageView.clipsToBounds = true
        cell.profileImageView.setImageWithURL(tweet.user!.profileUrl!)
        
        
        
        print("PROFILE IMAGE URL------------------------")
        print(tweet.favoritesCount)
        
        //cell.tweetContentLabel.text = tweet.text as? String
        
//        if tweets != nil {
//            cell.business = filteredData[indexPath.row]
//        } else {
//            cell.business = businesses[indexPath.row]
//        }
        return cell
    }
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tweets != nil {
            return tweets.count
        } else {
            return 0
        }
    }

    @IBAction func onRetweetButton(sender: AnyObject) {
        print("Retweet button clicked")
        if toggleRetweet == 0 {
            toggleRetweet = 1
            sender.setImage(UIImage(named: "retweet-action-inactive"), forState: UIControlState.Normal)
        } else {
            toggleRetweet = 0
            sender.setImage(UIImage(named: "retweet-action-on-green"), forState: UIControlState.Normal)
        }
        self.tableView.reloadData()
    }
    
    @IBAction func onFavoriteButton(sender: AnyObject) {
        if toggleFavorite == 0 {
            toggleFavorite = 1
            sender.setImage(UIImage(named: "like-action-off"), forState: UIControlState.Normal)
        }else{
            toggleFavorite = 0
            sender.setImage(UIImage(named: "like-action-on-red"), forState: UIControlState.Normal)
            
        }
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
