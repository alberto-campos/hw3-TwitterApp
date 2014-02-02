//
//  TweetCell.h
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *author;
@property (nonatomic, weak) IBOutlet UITextView *ext_tweet;
@property (nonatomic, weak) IBOutlet UILabel *twitter_id;
@property (nonatomic, weak) IBOutlet UILabel *time_published;
@property (nonatomic, weak) IBOutlet UILabel *retweeted_by;
@property (nonatomic, weak) IBOutlet UIImageView *previewImage;

@end
