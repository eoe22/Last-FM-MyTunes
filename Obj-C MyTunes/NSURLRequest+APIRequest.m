//
//  NSURLRequest+APIRequest.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/30/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "NSURLRequest+APIRequest.h"

@implementation NSURLSession (APIRequest)

- (void)makeAPIRequestAt:(NSURL*)url completion:(void (^)(NSDictionary*))completion{
    
    // make request for url
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    // firing off request
    [[self dataTaskWithRequest: request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error){
          
          // parsing base object to dictionary
          NSDictionary *result = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error:nil];
          
          // retrieve results dictionary in response
          NSDictionary *results = [result objectForKey:@"results"];
          
          // pass results to caller
          completion(results);
          
      }] resume];
}

@end
