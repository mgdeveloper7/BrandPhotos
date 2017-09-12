//
//  Photo.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "Photo.h"

@implementation Photo

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)init:(NSDictionary *) photoDict {
    
    self = [super init];
    if (self) {
        
        _albumID = [[photoDict objectForKey:@"albumId"] integerValue];
        _photoID = [[photoDict objectForKey:@"id"] integerValue];
        _title = [photoDict objectForKey:@"title"];
        _url = [photoDict objectForKey:@"url"];
        _thumbnailUrl = [photoDict objectForKey:@"thumbnailUrl"];
        
    }
    
    return self;
}

@end
