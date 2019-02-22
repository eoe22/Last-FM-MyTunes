//
//  ArtistService.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/28/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "ArtistService.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "NSURL+SearchURL.h"
#import "NSURLSession+APIRequest.h"
#import "Album.h"

@implementation ArtistService

+ (instancetype)sharedInstance {
    
    static ArtistService *sharedInstance;
    
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

- (void)searchArtists:(NSString*)text completion:(void (^)(NSArray<NSString*>*))completion{
    
    // make the url
    NSURL *url = [NSURL searchFor: text ofKind: @"artist"];
    
    [[NSURLSession sharedSession] makeAPIRequestAt:url completion:
     ^(NSDictionary *results){
         
         NSDictionary *matches = [results objectForKey:@"artistmatches"];
         NSArray *list = [matches objectForKey: @"artist"];
         
         // parse each artist dictionary
         NSMutableArray *artists = [NSMutableArray new];
         for (NSDictionary *info in list){
             //extract name of artist
             NSString *name = [info objectForKey: @"name"];
             [artists addObject: name];
         }
         
         // dispatch to main queue for UI update
         dispatch_async(dispatch_get_main_queue(), ^{
             // pass to completion handler
             completion(artists);
         });
     }];
}

- (void)searchAlbums:(NSString*)text completion:(void (^)(NSArray<Album*>*))completion{
    
    // make the url
    NSURL *url = [NSURL searchFor: text ofKind: @"album"];
    
    [[NSURLSession sharedSession] makeAPIRequestAt:url completion:
     ^(NSDictionary *results){
         
         NSDictionary *matches = [results objectForKey:@"albummatches"];
         NSArray *list = [matches objectForKey: @"album"];
         
         // parse each artist dictionary
         NSMutableArray *albums = [NSMutableArray new];
         for (NSDictionary *info in list){
             //extract name of album
             Album *album = [[Album alloc] initWithData: info];
             [albums addObject: album];
         }
         
         // dispatch to main queue for UI update
         dispatch_async(dispatch_get_main_queue(), ^{
             // pass to completion handler
             completion(albums);
         });
     }];
}

//- (void)searchArtists:(NSString*)text completion: (void (^)(NSArray<NSString*>*))completion{
//    
//    NSURL *urlString = [NSURL searchFor: text ofKind: @"artist"];
//    
//    //changed due to NSURL+searchURL
//    //URL with text from search bar
////     NSString *urlString = [NSString stringWithFormat: @"https://ws.audioscrobbler.com/2.0/?method=artist.search&artist=%@&api_key=666ec342286977fbceef97f221aed827&format=json", text];
//    
//    
//    //making a request to that URL
////    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString: urlString]];
//    //changed due to NSURL+searchURL
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL: urlString];
//    
//    //firing off request
//    [[[NSURLSession sharedSession]
//     dataTaskWithRequest: request
//     completionHandler: ^(NSData *data, NSURLResponse *response, NSError *error){
//         
//         //parsing base object to dictionary
//         NSDictionary *result = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: nil];
//         
//         //parse
//         NSDictionary *resultsss = [result objectForKey:@"results"];
//         
//         NSDictionary *matches = [resultsss objectForKey:@"artistmatches"];
//         NSArray *list = [matches objectForKey: @"artist"];
//         
//         //parse each artist dictionary
//         NSMutableArray *artists = [NSMutableArray new];
//         for (NSDictionary *info in list){
//             //extract name of artist
//             NSString *name = [info objectForKey: @"name"];
//             [artists addObject: name];
//         }
//         
//         //dispatch to main queue for UI update
//         dispatch_async(dispatch_get_main_queue(), ^{
//             //pass to completion handler
//             completion(artists);
//         });
//     }] resume];
//}

//- (void)searchArtists: (void (^)(NSArray<NSString*>*))completion{
//    
//    //array of strings
//    NSArray* artists = @[@"Bruno Mars", @"Russ", @"Bootleg Boy"];
//    
//    //pass to completion handler
//    completion(artists);
//}

@end
