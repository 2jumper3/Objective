//
//  TabBarViewController.m
//  AviaScan
//
//  Created by Sergey on 30/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "TabBarViewController.h"
#import "MapsViewController.h"
#import "AdvacedViewController.h"
#import "SearchMapViewController.h"
#import "MainViewController.h"
#import "NavigationViewController.h"
#import "ImageControllerViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (instancetype) init {
    
    self = [super init];
    if (self) {
        SearchMapViewController* mapsVS = [[SearchMapViewController alloc] init];
        mapsVS.title = @"Maps";
//        mapsVS.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
        MainViewController* mainVS = [[MainViewController alloc] init];
        mainVS.title = @"Home";
//        mainVS.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
        AdvacedViewController*    thirdVS = [[AdvacedViewController   alloc] init];
        thirdVS.title = @"Advanced";
//        thirdVS.tabBarItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemRecents tag:2];
        ImageControllerViewController* fourthVC = [[ImageControllerViewController alloc] init];
        
        NavigationViewController* rootNavigationController = [[NavigationViewController alloc] initWithRootViewController: mapsVS];
        NavigationViewController* rootNavigationController2 = [[NavigationViewController alloc] initWithRootViewController: mainVS];
        rootNavigationController2.navigationBar.prefersLargeTitles = true; //изменение размеров навигейшн бара

        NavigationViewController* rootNavigationController3 = [[NavigationViewController alloc] initWithRootViewController: thirdVS];
        NavigationViewController* rootNavigationController4 = [[NavigationViewController alloc] initWithRootViewController: fourthVC];
        

        
        
        self.viewControllers = @[rootNavigationController2,rootNavigationController,rootNavigationController3,rootNavigationController4];

    }
    return self;
}


@end
