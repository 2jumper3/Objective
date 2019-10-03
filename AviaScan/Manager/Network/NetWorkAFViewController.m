//
//  NetWorkAFViewController.m
//  AviaScan
//
//  Created by Sergey on 26/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "NetWorkAFViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "MainTableViewCell.h"
#import "PreviewTableViewCell.h"

@interface NetWorkAFViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) NSDictionary *responseJSON;
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong,readwrite) NSString* gate;


@end

@implementation NetWorkAFViewController

- (void)viewDidLoad {
    [super viewDidLoad];
      
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDataSource:self];//данные для tableview
    [self.tableView setDelegate:self]; // установка делегата
    [self.tableView setRowHeight:70];
    [self.view addSubview:self.tableView];
    [self load];
}


-(void) load {
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];

    NSURL *URL = [NSURL URLWithString:@"http://api.travelpayouts.com/v2/prices/month-matrix?currency=rub&origin=LED&destination=HKT&show_to_affiliates=true&token=294845782ca9d74f299253c934556ba4"];
   
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];

    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        [self.responseJSON = responseObject objectForKey:@"response"];
       
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
//            NSLog(@"%@ %@", response, responseObject);
//            NSLog(@"%@", [self.responseJSON valueForKey:@"data"]);
//            NSArray* xz = [self.responseJSON objectForKey:@"data"];
//            NSString* albumsvideo = [self.responseJSON valueForKey:@""];
//            NSString* value = [[self.responseJSON objectAtIndex:0] valueForKey:@"value"];
//            NSString *titre1 = [[xz objectAtIndex:0]valueForKey:@"depart_date"];
//            NSString *titre2 = [[albumsvideo objectAtIndex:1]valueForKey:@"titre"];
//            NSLog(@"%@", titre1);
            
            
            NSArray* xz = [self.responseJSON objectForKey:@"data"];
            self.gate   = [[xz objectAtIndex:0]valueForKey:@"depart_date"];
            NSLog(@"json");
            NSLog(@"%@", self.gate);
            [self.tableView reloadData];
            

        }
    }];
    [dataTask resume];
}

-(void) load2 {
    NSData *postData = [@"http://api.travelpayouts.com/v2/prices/month-matrix?currency=rub&origin=LED&destination=HKT&show_to_affiliates=true&token=294845782ca9d74f299253c934556ba4" dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

    
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:@"http://api.travelpayouts.com/v2/prices/month-matrix?currency=rub&origin=LED&destination=HKT&show_to_affiliates=true&token=294845782ca9d74f299253c934556ba4"]];
    [request setHTTPMethod:@"POST"];
    [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/xml" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:postData];
    NSURLResponse* response;
    NSError* error = nil;

    //Capturing server response
    NSDictionary* result  = [NSURLConnection sendSynchronousRequest:request  returningResponse:&response error:&error];
    NSLog(@"result comlete");
    NSLog(@"%@", [result objectForKey:@"response"]);
}



#pragma mark UITableViewSettings
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PreviewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[PreviewTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        NSLog(@"table");
        [self.tableView reloadData];
    }

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // количество строк в таблице
//    return self.responseJSON.count;
    return 3;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {  //разделители
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false]; //чтобы пропадало выделение с ячейки
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
return 70;
}


@end
