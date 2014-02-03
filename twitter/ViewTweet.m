//
//  secondVC.m
//  twitter
//
//  Created by Alberto Campos on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "ViewTweet.h"
#import "TimelineVC.h"

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
  //  vTweet.tweetAuthor.text = @"this is the author tweet";
    
  //  vTweet.TweetDetail.text = @"these are the details";
}
- (IBAction)favoritesTweet:(id)sender {
}

- (IBAction)retweeet:(id)sender {
}

- (IBAction)replyTweet:(id)sender {
}

- (void)onReplyTweetButton {
}

@end
