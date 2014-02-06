//
//  GlobalVariables.h
//  twitter
//
//  Created by Alberto Campos on 2/6/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimelineVC.h"

@interface GlobalVariables : NSObject {
    NSString *twitter_screen_name;
    NSNumber *twitter_id;
    //TimelineVC *twitter_timeline;
}

@property (nonatomic) NSString *twitter_screen_name;
@property (nonatomic) NSNumber *twitter_id;
//@property (nonatomic) TimelineVC *twitter_timeline;

+(GlobalVariables *)timelineGlobal;

@end
