//
//  CreateTweet.m
//  twitter
//
//  Created by Alberto Campos on 2/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "CreateTweet.h"
#import "TwitterClient.h"
#import "NZAlertView.h"
#import "TimelineVC.h"

@interface CreateTweet ()

- (void)openTimelineVC;
- (void)onCreateTweet;
- (void)onCancelButton;
- (void)onSuccess;
- (void)onError;

@end

@implementation CreateTweet

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
    
   // self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(onCancelButton)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Tweet" style:UIBarButtonItemStylePlain target:self action:@selector(onCreateTweet)];
    
    if (!globalTwitter) {
        globalTwitter = [GlobalVariables timelineGlobal];
    }
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private methods

- (void)onCreateTweet {
    NSString *myTweetTxt = self.whatsHappening.text; 
    
    NSLog(@"New tweet accepted %@", myTweetTxt);

   // Validation
    // TweetText should be less than 140 chars
    // Remove leading and trailing spaces
    // set characters left to use
    
    [[TwitterClient instance] postStatus:myTweetTxt success:^(AFHTTPRequestOperation *operation, id response) {
        [self dismissViewControllerAnimated:YES completion:^{
            [[[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your status was published" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"error: %@", error);
        [self onError];
    }];
    
    [self.navigationController popViewControllerAnimated:YES];
    [self onSuccess];
}


- (void)onCancelButton {
    
    globalTwitter = [GlobalVariables timelineGlobal];
    //[globalTwitter.twitter_timeline.navigationController popToRootViewControllerAnimated:YES];
    //self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:globalTwitter.twitter_timeline];
    [globalTwitter.twitter_timeline.navigationController popViewControllerAnimated:YES];
}

- (void)openTimelineVC {
    
    
    
   // if (!globalTwitter.twitter_timeline) {
     //   globalTwitter.twitter_timeline = [[TimelineVC alloc] initWithNibName:@"TimelineVC" bundle:nil];
       // timelineTweet = [[TimelineVC alloc] initWithNibName:@"TimelineVC" bundle:nil];
   // }
   // [globalTwitter.twitter_timeline.navigationController pushViewController:globalTwitter.twitter_timeline animated:YES];
//    [globalTwitter.twitter_timeline.navigationController pushViewController:timelineTweet animated:YES];
    
}

- (void)onSuccess {
    NZAlertView *alert = [[NZAlertView alloc] initWithStyle:NZAlertStyleSuccess
                                                      title:@"Success!"
                                                    message:@"Tweeted"
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
                                                          title:@"Error Posting Tweet"
                                                        message:@"Thanks for using our Twitter app."
                                                       delegate:nil];
        
        [alert setStatusBarColor:[UIColor greenColor]];
        [alert setTextAlignment:NSTextAlignmentCenter];
        
        [alert show];

    
}


@end
