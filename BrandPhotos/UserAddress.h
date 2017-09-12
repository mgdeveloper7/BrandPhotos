//
//  UserAddress.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserAddress : NSObject

@property (nonatomic, strong) NSString *street;
@property (nonatomic, strong) NSString *suite;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *zipcode;

- (id)init:(NSDictionary *) userDict;

@end
