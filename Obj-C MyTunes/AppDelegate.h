//
//  AppDelegate.h
//  Obj-C MyTunes
//
//  Created by C2QJG01SDRJD on 1/25/19.
//  Copyright © 2019 C2QJG01SDRJD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

