//
//  ReplyTweet.h
//  twitter
//
//  Created by Alberto Campos on 2/5/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReplyTweet : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *author;
@property (strong, nonatomic) IBOutlet UILabel *screen_nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userIcon;
@property (strong, nonatomic) IBOutlet UITextField *charsLeft;
@property (strong, nonatomic) IBOutlet UITextView *tweetMsg;

@end
