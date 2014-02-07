//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"
#import "CreateTweet.h"
#import "Tweet.h"
#import "TimelineVC.h"
#import "TwitterClient.h"
#import "NZAlertView.h"

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)favoritesTweet:(id)sender {

    UIImage* currentImg=[UIImage imageNamed:@"star_silver.png"];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myTweetID = [f numberFromString:self.id_hidden.text];
    
    
    
    if (self.favoritesButton.currentImage == currentImg)
    {
        [self.favoritesButton setImage:[UIImage imageNamed:@"star_yellow.png"] forState:UIControlStateNormal];
        
        
        [[TwitterClient instance] favorite:myTweetID
                                   success:^(AFHTTPRequestOperation *operation, id response)
         {
             
             NSLog(@"Favorited tweet ID: %@", myTweetID);
         }
                                   failure:^(AFHTTPRequestOperation *operation, NSError *error)
         {
             [self onError];
         }];
    }
    else
    {
        [self.favoritesButton setImage:[UIImage imageNamed:@"star_silver.png"] forState:UIControlStateNormal];
        
        // TODO: implement "Unfavorite"
        [self onError];
    }

    
}

- (IBAction)onRetweetButton:(id)sender {
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myTweetID = [f numberFromString:self.id_hidden.text];
    
    [[TwitterClient instance] retweet:myTweetID success:^(AFHTTPRequestOperation *operation, id response) {
        [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"ReTweeted successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Error during retweeting" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}

- (IBAction)onReplyButton:(id)sender {

    if (!cTweet) {
        cTweet = [[CreateTweet alloc] initWithNibName:@"CreateTweet" bundle:nil];
    }
    globalTwitter = [GlobalVariables timelineGlobal];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:cTweet];
    
    globalTwitter.twitter_screen_name = @"Changed in TweetCell";
    cTweet.author.text = [tweet.user valueForKey:@"screen_name"];
    cTweet.screen_nameLabel.text = [tweet.user valueForKey:@"name"];
    
     NSLog(@"Global after: %@", globalTwitter.twitter_screen_name);
    
    [globalTwitter.twitter_timeline.navigationController pushViewController:cTweet animated:YES];


}

- (void)onReplyButton2
{
    
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myTweetID = [f numberFromString:self.id_hidden.text];
    
    NSString *reply = self.replyText.text;
    reply = [reply stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    
    [[TwitterClient instance] reply:reply forPostId:myTweetID success:^(AFHTTPRequestOperation *operation, id response) {
        NSLog(@"Successfully replied.");
        //        [self dismissViewControllerAnimated:YES completion:^{
        //            [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your reply was sent" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        //        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
        [[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Couldn't reply to the status, please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }];
}

- (void)onSuccess {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                                      title:@"Success!"
                                                    message:@"Favorited"
                                                   delegate:nil];
    
    [UIView animateWithDuration:.3f
                     animations:^
     {
         alert.frame = CGRectMake(300, 250, 320, 100);
     }];
    
    [alert setStatusBarColor:[UIColor greenColor]];
    [alert setTextAlignment:NSTextAlignmentCenter];
    
    [alert show];
    
}

- (void)onError {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleError
                                                      title:@"Something went wrong"
                                                    message:@"Error adding to favorites."
                                                   delegate:nil];
    
    [alert setStatusBarColor:[UIColor greenColor]];
    [alert setTextAlignment:NSTextAlignmentCenter];
    
    [alert show];
    
    
}

@end
