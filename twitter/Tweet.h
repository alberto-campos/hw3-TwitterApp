//
//  Tweet.h
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tweet : RestObject

@property (nonatomic, strong, readonly) NSString *text;
@property (nonatomic, strong, readonly) NSNumber *retweetCount;
@property (nonatomic, strong, readonly) NSDictionary *user;
@property (nonatomic, strong, readonly) NSString *tweet_id;

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array;

@end
