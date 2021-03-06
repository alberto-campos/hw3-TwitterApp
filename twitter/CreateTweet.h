//
//  CreateTweet.h
//  twitter
//
//  Created by Alberto Campos on 2/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalVariables.h"

@interface CreateTweet : UIViewController {
    GlobalVariables *globalTwitter;
}


@property (weak, nonatomic) IBOutlet UILabel *author;
@property (strong, nonatomic) IBOutlet UILabel *screen_nameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *userIcon;
@property (strong, nonatomic) IBOutlet UITextField *charsLeft;
@property (strong, nonatomic) IBOutlet UITextView *tweetMsg;
@property (strong, nonatomic) IBOutlet UITextField *whatsHappening;

@end
