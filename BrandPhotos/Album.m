//
//  Albums.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "Album.h"

@implementation Album

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)init:(NSDictionary *) albumDict {
    
    self = [super init];
    if (self) {
        
        _albumID = [[albumDict objectForKey:@"id"] integerValue];
        _userID = [[albumDict objectForKey:@"userId"] integerValue];
        _title = [albumDict objectForKey:@"title"];
        
    }
    
    return self;
}

@end
