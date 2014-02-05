//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CreateTweet.h"
#import "TimelineVC.h"

@interface TweetCell : UITableViewCell
{
    CreateTweet *cTweet;
    Tweet *tweet;
    TimelineVC *timelineTweet;
    
}


@property (nonatomic, weak) IBOutlet UILabel *author;
@property (nonatomic, weak) IBOutlet UILabel *ext_tweet;
@property (nonatomic, weak) IBOutlet UILabel *twitter_id;
@property (nonatomic, weak) IBOutlet UILabel *time_published;
@property (nonatomic, weak) IBOutlet UILabel *retweeted_by;
@property (nonatomic, weak) IBOutlet UIImageView *previewImage;
@property (nonatomic, weak) IBOutlet UIButton *viewTweet;
@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;
@property (strong, nonatomic) IBOutlet UIButton *onRetweetButton;
@property (strong, nonatomic) Tweet *tweet;
@property (strong, nonatomic) IBOutlet UILabel *id_hidden;
@property (strong, nonatomic) IBOutlet UIView *replyView;
@property (strong, nonatomic) IBOutlet UITextField *replyText;

- (IBAction)favoritesTweet:(id)sender;
- (IBAction)onRetweetButton:(id)sender;
- (IBAction)onReplyButton:(id)sender;

@end
