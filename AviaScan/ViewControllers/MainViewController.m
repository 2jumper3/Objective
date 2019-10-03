//
//  MainViewController.m
//  AviaScan
//
//  Created by Sergey on 24/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "MainViewController.h"
#import "SettingsViewController.h"
#import "FromViewController.h"
#import "ToViewController.h"
#import "NetworkService.h"
#import "FlyRateModel.h"
#import "NetWorkAFViewController.h"
#import "NetWorkAFViewController.h"



@interface MainViewController ()

@property (nonatomic, strong) UIView *menuView; //создание вию чтобы было видно и можно было к нему обращаться
@property (nonatomic, strong) UIImageView* backGroundImage;
@property (nonatomic, strong) UIButton* from;
@property (nonatomic, strong) UIButton* to;
@property (nonatomic, strong) UIButton* search;





@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Welcome to AviaScan"];
    
//    self.view.backgroundColor = [UIColor greenColor];
    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle: @"Settings"
                                                                       style: UIBarButtonItemStyleDone
                                                                      target: self
                                                                      action: @selector(openSettings)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width / 2) - 100,
                                                             (self.view.bounds.size.height / 2) - 150 ,
                                                             200,
                                                             300)];
    self.from = [[UIButton alloc] initWithFrame:CGRectMake((self.menuView.bounds.size.width-190),
                                                           (self.menuView.bounds.size.height-250),
                                                           self.menuView.bounds.size.width - 20, 30)];
    self.to = [[UIButton alloc] initWithFrame:CGRectMake((self.menuView.bounds.size.width-190),
                                                         (self.menuView.bounds.size.height-165),
                                                         self.menuView.bounds.size.width - 20, 30)];
    
    self.search = [[UIButton alloc] initWithFrame:CGRectMake((self.menuView.bounds.size.width-190),
                                                             (self.menuView.bounds.size.height-80),
                                                             self.menuView.bounds.size.width - 20, 30)];


    

#pragma mark - BackgroundSettings
    self.backGroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.backGroundImage setImage:[UIImage imageNamed:@"background"]];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
    UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurEffectView.alpha = 0.98;
    blurEffectView.frame = self.backGroundImage.bounds;
    blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.backGroundImage addSubview:blurEffectView]; //if you have more UIViews, use an insertSubview API to place it where needed
    [self.view addSubview:self.backGroundImage];

    
    self.menuView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.3];
    [self.view addSubview:self.menuView];
#pragma mark Buttons on Menu
    
    [self.from setBackgroundColor:[UIColor darkGrayColor]];
    [self.from setTitle:@"From" forState:UIControlStateNormal];
    [self.from setTintColor: [UIColor blueColor]];
    [self.from addTarget:self action:@selector(segueFromViewController:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.to setBackgroundColor:[UIColor darkGrayColor]];
    [self.to setTitle:@"To" forState:UIControlStateNormal];
    [self.to setTintColor: [UIColor blueColor]];
    [self.to addTarget:self action:@selector(segueToViewController:) forControlEvents:UIControlEventTouchUpInside];

    [self.search setBackgroundColor:[UIColor darkGrayColor ]];
    [self.search setTitle:@"Search" forState:UIControlStateNormal];
    [self.search setTintColor: [UIColor blueColor]];
    [self.search addTarget:self action:@selector(segueSearchViewController:) forControlEvents:UIControlEventTouchUpInside];


    [self.menuView addSubview:self.from];
    [self.menuView addSubview:self.to];
    [self.menuView addSubview:self.search];



}

- (void) openSettings {
    SettingsViewController* settingsViewController = [SettingsViewController new];
    [self.navigationController pushViewController: settingsViewController animated: YES];
}

- (void) segueFromViewController:(UIButton*) sender {

    NSLog(@"pushed");
#pragma mark Netword Request
    [[NetworkService sharedInstance] getExchangeRatesForRoate:@"USD" withCompletion:^(NSArray * _Nonnull rates) {
        dispatch_async(dispatch_get_main_queue(), ^ {
//            FromViewController *vc = [[FromViewController alloc] init];  //передача данных через проперти
//              vc.rates = rates;
            FromViewController *vc = [[FromViewController alloc] initWithRateModel:rates]; //передача данных через конструктор
            [self.navigationController pushViewController:vc animated:true];
          
//            [self presentViewController:vc animated:true completion:nil]; - если нужен переход без использования navigationControlelr
            
            
           });
        NSLog(@"opened"); //не выводится в консоль
        }];
}

- (void) segueToViewController:(UIButton*) sender {
    ToViewController* toViewController = [ToViewController new];
    [self.navigationController pushViewController:toViewController animated:YES];
}

- (void) segueSearchViewController:(UIButton*) sender {
    NetWorkAFViewController* afViewController = [NetWorkAFViewController alloc];
    [NetWorkAFViewController load];
    [self.navigationController pushViewController:afViewController animated:YES];
    
}
    


@end
