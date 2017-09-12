//
//  DataRetrieval.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "DataRetrieval.h"

@implementation DataRetrieval

-(void) getData:(NSString *)urlPath andCompletedBlock:(void (^)(NSDictionary *, NSError *)) block {
        
    id finishedBlock = [block copy];
    
    NSString *url = [NSString stringWithFormat:@"%@%@", BASE_URL, urlPath];
    
    // NOTE:  Arbitary loads has been set to YES in info.plist to allow the call to HTTP
    // (as opposed to the more secure HTTPS) to go through.
    //
    // http://jsonplaceholder.typicode.com has been allowed through as an exception
    // http://placehold.it has been allowed through as an exception
    
    NSError *error;
    
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:[NSURL URLWithString:url]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
        // handle response
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        ((void (^)(NSString *, NSError *))finishedBlock)( json, error);
        
    }] resume];
    
}

@end
