//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"
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
    
//    NSString *myTweetTxt = self.retweetMsg.text;
//    
//    NSLog(@"New tweet accepted %@", myTweetTxt);
//    
//    [[TwitterClient instance] retweet:self.tweet.id success:^(AFHTTPRequestOperation *operation, id response) {
//        [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"ReTweeted successfully" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        [[[UIAlertView alloc] initWithTitle:@"Error!" message:@"Error during retweeting" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//    }];
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
