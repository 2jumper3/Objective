//
//  SearchMapViewController.m
//  AviaScan
//
//  Created by Sergey on 02/10/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "SearchMapViewController.h"
#import "MapsViewController.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"

@interface SearchMapViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIImageView* backGroundImage;


@end

@implementation SearchMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
#pragma mark BackgroundSettings
    
    self.backGroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.backGroundImage setImage:[UIImage imageNamed:@"background"]];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.98;
    blurEffectView.frame = self.backGroundImage.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.backGroundImage addSubview:blurEffectView]; 
    [self.view addSubview:self.backGroundImage];

    
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, 300, 50)];
    [self.textField setPlaceholder:@"Enter city"];
    [self.view addSubview:self.textField];
    
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 50)];
    [btn setTitle:@"Search" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)pressButton {
    [[[LocationService alloc] init] locationFromAddress:self.textField.text withCompletion:^(CLLocation *location) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            MapsViewController *vc = [[MapsViewController alloc] init];
            vc.location = location;
            [self.navigationController pushViewController:vc animated:true];
        });
    }];
}


@end
