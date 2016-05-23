//
//  BlogPost.h
//  BlogReaderFromScratch
//
//  Created by Ethan Neff on 5/15/14.
//  Copyright (c) 2014 Ethan Neff. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BlogPost : NSObject
//{
//    NSString *title;
//    NSString *author;                                 // instance variable only visible by this BlogPost class and nothing else
//}

//- (void) setTitle:(NSString *)title;                  // setter for instance variables
//- (NSString *) title;                                 // getter for instance variables

//@property (nonatomic) int views;                      // no strong or weak b/c primative type
//@property (nonatomic, getter = isUnread) BOOL unread; // rename the getter function from default unread to isUnread

// use properties so you dont have to create a setter and getter for each
// dont ever need instance variables when creating properties
// use self. to access the properties's values
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *author;
@property (strong, nonatomic) NSString *thumbnail;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSURL *url;

// --designated initalizer-- (alternative to just doing an [[BlogPost alloc] init])
// id = general purpose data type (will figure out the type during runtime)
- (id) initWithTitle:(NSString *)title;         // [[BlogPost alloc] initWithTitle:@"bob"];

// --convenience constructors-- (allows you do alloc and init in 1 step)
+ (id) blogPostWithTitle:(NSString *)title;     // [BlogPost blogPostWithTitle:@"bob"];

// --getter--
- (NSURL *) thumbnailURL;

// --getter--
- (NSString *) formattedDate;
@end
