//
//  FirstViewController.m
//  AviaScan
//
//  Created by Sergey on 11/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "FirstViewController.h"
#import "SettingsViewController.h"
#import "AdvacedViewController.h"



@interface FirstViewController () <UITextFieldDelegate>

@property (nonatomic,weak,readwrite) UITableView* tableView;
@property (nonatomic, strong) UIView *myNewView; //создание вию чтобы было видно и можно было к нему обращаться
@property (nonatomic,weak) UIImage *myImageView;
@property (nonatomic,strong) UIProgressView * myProgressViewReusable;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect frame = CGRectMake(100,
                              100,
                              150,
                              150);
    self.myNewView = [[UIView alloc] initWithFrame:frame];
    UILabel* newLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                                  300,
                                                                  self.view.bounds.size.width,
                                                                  50)];
    UIButton* newButton =[[UIButton alloc] initWithFrame:CGRectMake(300,
                                                                    100,
                                                                    100,
                                                                    50)];
    UITextField* newTf = [[UITextField alloc] initWithFrame:CGRectMake(0,
                                                                       300,
                                                                       self.view.bounds.size.width,
                                                                       50)];
    UIImageView* myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100,
                                                                             500,
                                                                             150,
                                                                             150)];
    UIProgressView* myProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,
                                                                                      500,
                                                                                      self.view.bounds.size.width,
                                                                                      40)];
    self.myProgressViewReusable = [[UIProgressView alloc] initWithFrame:CGRectMake(0,
                                                                                   520,
                                                                                   self.view.bounds.size.width,
                                                                                   40)];
    UIActivityIndicatorView* myActivityIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(40,
                                                                                                             70,
                                                                                                             20,
                                                                                                             20)];
    UISlider* mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0,
                                                                    550,
                                                                    self.view.bounds.size.width,
                                                                    40)];
    UISegmentedControl *mySegmentControl = [[UISegmentedControl alloc] initWithItems:@[@"First", @"second"]];
    
    
#pragma ImageVIew
    [myImageView setImage:[UIImage imageNamed:@"background"]];
    [myImageView setContentMode:UIViewContentModeScaleAspectFit]; //варианты отображения картинок во фреймах
    [myImageView.layer setCornerRadius:myImageView.bounds.size.width / 2];
    [myImageView setClipsToBounds:true]; // привязка картинке к бэкграунду
    
#pragma Label
    [newLabel setText:@"Hello"];
    [newLabel setTextColor:[UIColor magentaColor]];
    [newLabel setTextAlignment:NSTextAlignmentCenter];
    [newLabel setBackgroundColor:[UIColor groupTableViewBackgroundColor]];
    [newLabel setNumberOfLines:0];
    
    [_myNewView setBackgroundColor:[UIColor blackColor]];
#pragma Button
    [newButton setTitle:@"Push me" forState:UIControlStateNormal];
    [newButton setTitle:@"OK" forState:UIControlStateSelected];
    [newButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [newButton setBackgroundColor:[UIColor redColor]];
    [newButton addTarget:self action:@selector(pressbutton:) forControlEvents:UIControlEventTouchUpInside];
    
#pragma TextFIeld
    [newTf.layer setBorderWidth:1];
    [newTf.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [newTf setPlaceholder:@"Type here"];
    [newTf setKeyboardType:UIKeyboardTypeDefault];
    [newTf setDelegate:self];
    [newTf addTarget:self action:@selector(textFieldDidChange:)  //вывод в консоль текста из филда
                forControlEvents:UIControlEventEditingChanged];
    
#pragma myProgressView
    
    [myProgressView setBackgroundColor:[UIColor grayColor ]];
    [myProgressView setProgress:0.72];
    [myProgressView setProgressTintColor:[UIColor blackColor]];
    [self.myProgressViewReusable setBackgroundColor:[UIColor grayColor ]];
    [self.myProgressViewReusable setProgress:0.72];
    [self.myProgressViewReusable setProgressTintColor:[UIColor blackColor]];
    
#pragma Slider
    
    [mySlider addTarget:self action:@selector(changeSliderValue:) forControlEvents:UIControlEventValueChanged]; //изменения прогресса от движения слайдера
    
#pragma mySegmentControl
    
    [mySegmentControl setFrame:CGRectMake(0, 70, self.view.bounds.size.width, 15)];
    
#pragma AddSubView
    [self.view addSubview:_myNewView];// Добавление созданых элементов на общий view
    [self.view addSubview:newLabel];
    [self.view addSubview:newButton];
    [self.view addSubview:newTf];
    [self.view addSubview:myImageView];
    [self.view addSubview:myProgressView];
    [self.view addSubview:myActivityIndicator];
    [self.view addSubview:mySlider];
    [self.view addSubview:self.myProgressViewReusable];
    [self.view addSubview:mySegmentControl];
    
    [_myNewView.layer setCornerRadius:50];
   // [newView.layer setCornerRadius:newView.bounds.size.width / 2]; если нужен круг

    [_myNewView.layer setBorderWidth:4];                                   // layer - различные функции с View
    [_myNewView.layer setBorderColor:[[UIColor redColor] CGColor]];
 
#pragma    Создание кнопки в NavigationBar для открытия настроек
    
    UIBarButtonItem* settingsButton = [[UIBarButtonItem alloc] initWithTitle: @"Settings"
                                                                       style: UIBarButtonItemStyleDone
                                                                      target: self
                                                                      action: @selector(openSettings)];
    self.navigationItem.rightBarButtonItem = settingsButton;
    
}

#pragma Активация селектора для открытия настроек (Actions)

- (void) openSettings {
    SettingsViewController* settingsViewController = [SettingsViewController new];
    [self.navigationController pushViewController: settingsViewController animated: YES];
}

#pragma Создание действий для кнопки
- (void) pressbutton:(UIButton*) sender {
    [self.myNewView setBackgroundColor: [UIColor greenColor]];
//    [self.myNewView setBackgroundColor:[UIImage imageNamed:@"liza"]];
}

- (void)textFieldDidEndEditing:(UITextField *)textField; {
    NSLog(@"%@", textField.text);
}

-(void) textFieldDidChange:(UITextField*)field { // вывод в консоль текста из текст филда
    NSLog(@"%@", field.text);
}

-(void) changeSliderValue:(UISlider*)slider {    //изменения прогресса от движения слайдера
    self.myProgressViewReusable.progress = slider.value;
}

@end

