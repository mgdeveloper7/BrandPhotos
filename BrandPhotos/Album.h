//
//  Albums.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject

@property (nonatomic) int albumID;
@property (nonatomic) int userID;
@property (nonatomic, strong) NSString *title;

- (id)init:(NSDictionary *) albumDict;

@end
