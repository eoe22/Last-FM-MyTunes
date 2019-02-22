//
//  ViewController.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/25/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchResultViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *searchTableView;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (strong, nonatomic) NSMutableArray *artists;
@property (strong, nonatomic) NSMutableArray *albums;

@end

