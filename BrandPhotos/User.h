//
//  User.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserAddress.h"

@interface User : NSObject

@property (nonatomic) int userID;
@property (nonatomic, strong) NSString *fullname;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) UserAddress *address;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSMutableArray *company;

- (id)init:(NSDictionary *) userDict;

@end
