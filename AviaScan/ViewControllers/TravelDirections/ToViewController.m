//
//  ToViewController.m
//  AviaScan
//
//  Created by Sergey on 24/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "ToViewController.h"
#import "NetworkService.h"
#import "FlyRateModel.h"
#import "FromViewController.h"


@interface ToViewController ()

@property (nonatomic,strong) UITextField *exchange;

@end

@implementation ToViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    self.exchange = [[UITextField alloc] initWithFrame:CGRectMake(20,
                                                                          200,
                                                                          self.view.bounds.size.width,
                                                                          50)];
    [self.exchange setPlaceholder:@"input exchange here"];
    [self.view addSubview:self.exchange];
    

    
    
    
    UIButton* newButton =[[UIButton alloc] initWithFrame:CGRectMake(300,
                                                                       400,
                                                                       100,
                                                                       50)];
    [newButton setTitle:@"Search" forState:UIControlStateNormal];
    [newButton setTitle:@"OK" forState:UIControlStateSelected];
    [newButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [newButton setBackgroundColor:[UIColor redColor]];
    [newButton addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:newButton];
    
}

- (void) pressbutton:(UIButton*) sender {
    if (![self.exchange.text isEqualToString:@""]) {
    NSLog(@"pushed");
#pragma mark Netword Request
    [[NetworkService sharedInstance] getExchangeRatesForRoate:self.exchange.text withCompletion:^(NSArray * _Nonnull rates) {
            dispatch_async(dispatch_get_main_queue(), ^ {
//            FromViewController *vc = [[FromViewController alloc] init];  //передача данных через проперти
//              vc.rates = rates;
            FromViewController *vc = [[FromViewController alloc] initWithRateModel:rates]; //передача данных через конструктор
            [self.navigationController pushViewController:vc animated:true];
          
//            [self presentViewController:vc animated:true completion:nil]; - если нужен переход без использования navigationControlelr
            
            
           });
        NSLog(@"opened"); 
        }];
    }
}

@end
