//
//  secondVC.h
//  twitter
//
//  Created by Alberto Campos on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewTweet : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *TweetDetail;
@property (weak, nonatomic) IBOutlet UILabel *tweetAuthor;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
- (IBAction)backButton:(id)sender;

@end
