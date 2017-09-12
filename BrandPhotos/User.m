//
//  User.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "User.h"

@implementation User

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
        
        _userID = [[userDict objectForKey:@"id"] integerValue];
        _fullname = [userDict objectForKey:@"name"];
        _username = [userDict objectForKey:@"username"];
        _email = [userDict objectForKey:@"email"];
        
        // Get the UserAddress object from the dictionary
        UserAddress *userAddress = [[UserAddress alloc] init:[userDict valueForKey:@"address"]];

        _address = userAddress;
        _phone = [userDict objectForKey:@"phone"];
        _website = [userDict objectForKey:@"website"];
        
        // Only using the company name so no point doing seperate object.
        // Extract the company name from the key.
        
        _company = [[userDict valueForKey:@"company"] objectForKey:@"name"];

    }

    return self;
}

@end
