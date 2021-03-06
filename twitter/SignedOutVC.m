//
//  SignedOutVC.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "SignedOutVC.h"
#import "TwitterClient.h"
#import "NZAlertView.h"
#import "TimelineVC.h"

@interface SignedOutVC ()

- (IBAction)onSignInButton:(id)sender;
- (void)onError;

@end

@implementation SignedOutVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
   // globalTwitter = [GlobalVariables timelineGlobal];
   //
    
   // if (!globalTwitter) {
    globalTwitter = [GlobalVariables timelineGlobal];
    globalTwitter.twitter_timeline = [[TimelineVC alloc] initWithNibName:@"TimelineVC" bundle:nil];
    globalTwitter.twitter_screen_name = @"Name from SignedOutVC.";
        // timelineTweet = [[TimelineVC alloc] initWithNibName:@"TimelineVC" bundle:nil];
    //}
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (IBAction)onSignInButton:(id)sender {
    [[TwitterClient instance] authorizeWithCallbackUrl:[NSURL URLWithString:@"cp-twitter://success"] success:^(AFOAuth1Token *accessToken, id responseObject) {
        [[TwitterClient instance] currentUserWithSuccess:^(AFHTTPRequestOperation *operation, id response) {
            NSLog(@"response: %@", response);
            [User setCurrentUser:[[User alloc] initWithDictionary:response]];
            NSLog(@"Current User: %@", response);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            [self onError];
        }];
        NSLog(@"success!");
        
    } failure:^(NSError *error) {
        [self onError];
    }];
}



- (void)onError {
    
    //NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess title:@"Sign-in canceled" message:@"Thanks for using our Twitter app." delegate:nil];
    
    
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleInfo
                            title:@"Not signed-in"
                            message:@"Thanks for using our Twitter app."
                            delegate:nil];
    
    [alert setStatusBarColor:[UIColor greenColor]];
    [alert setTextAlignment:NSTextAlignmentCenter];
    
    [alert show];
    
    
    //[[[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Couldn't log in with Twitter, please try again!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
}


@end
