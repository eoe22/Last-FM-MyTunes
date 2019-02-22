//
//  AlbumService.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/29/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "AlbumService.h"

@implementation AlbumService

+ (instancetype)sharedInstance {
    
    static AlbumService *sharedInstance;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] initPrivate];
    });
    return sharedInstance;
}

- (instancetype)initPrivate {
    
    if (self = [super init]){
        //TODO
    }
    
    return self;
}

- (void)searchAlbums:(NSString*)text completion: (void (^)(NSArray<NSString*>*))completion{
    
    //URL with text from search bar
    NSString *urlString = [NSString stringWithFormat: @"https://ws.audioscrobbler.com/2.0/?method=album.search&album=%@&api_key=666ec342286977fbceef97f221aed827&format=json", text];
    
    //making a request to that URL
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: urlString]];
    
    //firing off request
    [[[NSURLSession sharedSession]
      dataTaskWithRequest: request
      completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
          
          //parsing base object to dictionary
          NSDictionary *result = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: nil];
          
          //parse
          NSDictionary *resultsss = [result objectForKey:@"results"];
          NSDictionary *matches = [resultsss objectForKey:@"albummatches"];
          NSArray *list = [matches objectForKey: @"album"];
          
          //parse each artist dictionary
          NSMutableArray *albums = [NSMutableArray new];
          for (NSDictionary *info in list){
              //extract name of artist
              NSString *name = [info objectForKey: @"name"];
              [albums addObject: name];
          }
          
          //dispatch to main queue for UI update
          dispatch_async(dispatch_get_main_queue(), ^{
              //pass to completion handler
              completion(albums);
          });
      }] resume];
}

@end
