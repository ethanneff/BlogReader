//
//  BlogPost.m
//  BlogReaderFromScratch
//
//  Created by Ethan Neff on 5/15/14.
//  Copyright (c) 2014 Ethan Neff. All rights reserved.
//

#import "BlogPost.h"

@implementation BlogPost

- (id) initWithTitle:(NSString *)title { // initalizer
    self = [super init];        // using NSObject parent class to grab it's init class
    
    if (self) {                 // if self is a valid instance
        self.title = title;
        self.author = nil;      //defaults
        self.thumbnail = nil;   //defaults
    }
    
    return self;                // returns a valid instance of blog post
}

+ (id) blogPostWithTitle:(NSString *)title { // calls the initalizer
    return [[self alloc] initWithTitle:title];
}

//- (void) setTitle:(NSString *)_title; {   // instance setter
//    title = _title;
//}
//- (NSString *) title {                    // instance getter
//    return title;
//}

- (NSURL *) thumbnailURL {
    return [NSURL URLWithString:self.thumbnail];
}

- (NSString *) formattedDate {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];       // date coming in as string
    
    NSDate *tempDate = [dateFormatter dateFromString:self.date]; // string to date
    
    [dateFormatter setDateFormat:@"EE MMM,dd"];
    return [dateFormatter stringFromDate:tempDate];             // date to string
}
@end
