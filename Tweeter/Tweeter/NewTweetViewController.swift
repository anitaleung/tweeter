//
//  NewTweetViewController.swift
//  Tweeter
//
//  Created by Anita on 2/28/16.
//  Copyright © 2016 Anita Leung. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var newTweetTextView: UITextView!
    @IBOutlet weak var characterCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false
        newTweetTextView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPostButton(sender: AnyObject) {
        let text = newTweetTextView.text
        if text.characters.count > 140 {
            self.popupMessage("The tweet text has to be less than 140 characters")
        } else {
            let params = ["status": text] as NSDictionary
            TwitterClient.sharedInstance.postTweetWithCompletion(params, completion: { (response, error) -> () in
                if response != nil {
                    print("tweet posted")
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    print("Failed to post tweet")
                    self.popupMessage("Failed to tweet")
                }
            })
            navigationController!.popViewControllerAnimated(true)
        }
    }
    
    @IBAction func onCancelPostButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    func textViewDidChange(textView: UITextView) {
        let remainingCount = 140 - newTweetTextView.text.characters.count
        characterCountLabel.text = "\(remainingCount)"
        if remainingCount == -1 {
            characterCountLabel.textColor = UIColor.redColor()
        }
        if remainingCount == 0 {
            characterCountLabel.textColor = UIColor.blackColor()
        }
        if remainingCount == 11 {
            characterCountLabel.textColor = UIColor.grayColor()
        }
    }
    
    private func popupMessage(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
