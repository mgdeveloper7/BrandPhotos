//
//  DataRetrieval.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface DataRetrieval : NSObject

@property (nonatomic, strong) NSMutableData *responseData;

-(void) getData:(NSString *)urlPath andCompletedBlock:(void (^)(NSDictionary *, NSError *)) block;

@end
