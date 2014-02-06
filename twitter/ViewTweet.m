//
//  secondVC.m
//  twitter
//
//  Created by Alberto Campos on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ViewTweet.h"
#import "TimelineVC.h"
#import "NZAlertView.h"

@interface ViewTweet ()

@end

@implementation ViewTweet

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        
//        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Out" style:UIBarButtonItemStylePlain target:self action:@selector(onSignOutButton)];
//        
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Reply" style:UIBarButtonItemStylePlain target:self action:@selector(onReplyTweetButton)];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    TimelineVC *vTweet = [[TimelineVC alloc] initWithNibName:nil bundle:nil];
    
    [self presentViewController:vTweet animated:YES completion:NULL];
}
- (IBAction)favoritesTweet:(id)sender {
    UIImage* currentImg=[UIImage imageNamed:@"star_silver.png"];
    NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
    [f setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber * myTweetID = [f numberFromString:self.id_hidden.text];
    
    NSLog(@"currentImg: %@", currentImg);
    NSLog(@"currentImg: %@", self.favoritesButton.currentImage);
    
    
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

- (IBAction)retweeet:(id)sender {
}

- (IBAction)replyTweet:(id)sender {
}

- (void)onReplyTweetButton {
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
