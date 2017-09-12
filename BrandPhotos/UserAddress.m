//
//  UserAddress.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "UserAddress.h"

@implementation UserAddress

- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (id)init:(NSDictionary *) userDict {
    
    self = [super init];
    if (self) {
        
        _street = [userDict objectForKey:@"street"];
        _suite = [userDict objectForKey:@"suite"];
        _city = [userDict objectForKey:@"city"];
        _zipcode = [userDict objectForKey:@"zipcode"];
    }
    
    return self;
}

@end
