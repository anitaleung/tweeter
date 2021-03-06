//
//  Tweet.swift
//  Tweeter
//
//  Created by Anita on 2/21/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var profileImageUrl: NSURL?
    var username: String?
    var displayname: String?
    var user: User?
    var id: NSNumber?
    var time: String?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? String
        
        id = dictionary["id"] as? Int
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        
        let timestampString = dictionary["created_at"] as? String
        
        if let timestampString = timestampString {
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
        
        let today = NSDate()
        let timePosted = timestamp
        let timePassed = Int(today.timeIntervalSinceDate(timePosted!))
        
        if timePassed >= 86400 {
            time = "\(timePassed / 86400)d"
        }
        if (3600..<86400).contains(timePassed){
            time = "\(timePassed/3600)h"
        }
        if (60..<3600).contains(timePassed){
            time = "\(timePassed/60)m"
        }
        if timePassed < 60 {
            time = "\(timePassed)s"
        }
        
        user = User(dictionary: dictionary["user"] as! NSDictionary)
    
        username = dictionary["user"]!["screen_name"] as? String
        displayname = dictionary["user"]!["name"] as? String
        
        let profileUrlString = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileImageUrl = NSURL(string: profileUrlString)
        }
        
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}
