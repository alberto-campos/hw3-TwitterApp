//
//  GlobalVariables.m
//  twitter
//
//  Created by Alberto Campos on 2/6/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

#import "GlobalVariables.h"

@implementation GlobalVariables {
    GlobalVariables * twitter_singleton;
}

@synthesize twitter_timeline;
@synthesize twitter_id;
@synthesize twitter_screen_name;

+(GlobalVariables *)timelineGlobal{
    static GlobalVariables *single = nil;
    @synchronized(self) {
        if (!single) {
            single = [[GlobalVariables alloc]init];
        }
    }
    return single;
}

@end
