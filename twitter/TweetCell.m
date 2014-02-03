//
//  TweetCell.m
//  twitter
//
//  Created by Timothy Lee on 8/6/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "TweetCell.h"
#import "TimelineVC.h"

@implementation TweetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
//        CGRect      buttonFrame = self.favoritesButton.frame;
//        buttonFrame.size = CGSizeMake(5, 5);
//        self.favoritesButton.frame = buttonFrame;
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
    
    if (self.favoritesButton.currentImage == currentImg)
    {
        [self.favoritesButton setImage:[UIImage imageNamed:@"star_yellow.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.favoritesButton setImage:[UIImage imageNamed:@"star_silver.png"] forState:UIControlStateNormal];
    }
    
}
@end
