//
//  secondVC.h
//  twitter
//
//  Created by Alberto Campos on 2/2/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewTweet : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *tweetDetail;
@property (weak, nonatomic) IBOutlet UILabel *tweetAuthor;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSDictionary *user;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

- (IBAction)backButton:(id)sender;


@end
