//
//  secondVC.h
//  twitter
//
//  Created by Alberto Campos on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewTweet : UIViewController

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDictionary *user;

@property (weak, nonatomic) IBOutlet UILabel *tweetDetail;
@property (weak, nonatomic) IBOutlet UILabel *tweetAuthor;
@property (nonatomic, weak) IBOutlet UILabel *twitter_id;
@property (strong, nonatomic) IBOutlet UILabel *id_hidden;
@property (nonatomic, weak) IBOutlet UILabel *time_published;
@property (nonatomic, weak) IBOutlet UILabel *retweeted_by;
@property (weak, nonatomic) IBOutlet UILabel *retweetsCount;
@property (weak, nonatomic) IBOutlet UILabel *favoritesCount;

@property (nonatomic, weak) IBOutlet UIImageView *previewImage;

@property (weak, nonatomic) IBOutlet UIButton *retweet;
@property (weak, nonatomic) IBOutlet UIButton *favoritesButton;
@property (weak, nonatomic) IBOutlet UIButton *replyTweet;

- (IBAction)favoritesTweet:(id)sender;
- (IBAction)retweeet:(id)sender;
- (IBAction)replyTweet:(id)sender;
- (IBAction)backButton:(id)sender;
- (void)onReplyTweetButton;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
