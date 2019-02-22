//
//  ViewController.m
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/25/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import "SearchResultViewController.h"
#import "ArtistService.h"
#import "AlbumTableViewCell.h"
#import "Obj_C_MyTunes-Swift.h"

@interface SearchResultViewController ()

@end

@implementation SearchResultViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.artists = [[NSMutableArray alloc] initWithObjects: @"The Beatles", @"Drake", @"Bamboo", nil];
    self.albums = [NSMutableArray new];
    
    [self.searchTableView reloadData];
}

//for albumviewcontroller
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        Album *album = self.albums[indexPath.row];
        [self performSegueWithIdentifier:@"detailSegue" sender: album];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"detailSegue"]){
        DetailViewController *vc = segue.destinationViewController;
        vc.sender = sender;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1){
        return 80.0;
    }
    return 44.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch(section){
        case 0:
            return self.artists.count;
        case 1:
            return self.albums.count;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1){
        AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"albumCell" forIndexPath: indexPath];
        
        [cell configureWith:self.albums[indexPath.row]];
        
        return cell;
    }
    else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"reuseCell" forIndexPath: indexPath];
        
        cell.textLabel.text = self.artists[indexPath.row];
        
        return cell;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 1){
        return @"Albums";
    }
    return @"Artists";
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSString *text = searchBar.text;
    
    [[ArtistService sharedInstance] searchArtists:text completion:^(NSArray<NSString*> *artists){
        [self.artists removeAllObjects];
        [self.artists addObjectsFromArray: artists];
        
        NSIndexSet *set = [[NSIndexSet alloc] initWithIndex:0];
        [self.searchTableView reloadSections:set withRowAnimation: UITableViewRowAnimationAutomatic];
    }];
    
    [[ArtistService sharedInstance] searchAlbums:text completion:^(NSArray<Album*> *albums){
        [self.albums removeAllObjects];
        [self.albums addObjectsFromArray:albums];
        [self.searchTableView reloadData];
    }];
}

@end
