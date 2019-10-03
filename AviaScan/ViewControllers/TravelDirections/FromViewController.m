//
//  FromViewController.m
//  AviaScan
//
//  Created by Sergey on 24/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "FromViewController.h"
#import "NetworkService.h"
#import "FlyRateModel.h"

@interface FromViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) UITableView* tableView;


//@property (nonatomic,strong)

@end

@implementation FromViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDataSource:self];//данные для tableview
    [self.tableView setDelegate:self]; // установка делегата
    [self.tableView setRowHeight:70];
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark UITableViewSettings
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    FlyRateModel *model = [self.rates objectAtIndex:indexPath.row];
    [cell.textLabel setText:[model rateName]];
    [cell.detailTextLabel setText:[[model rateValue]stringValue]];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // количество строк в таблице
    return [self.rates count];
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

#pragma Передача данных с помощью конструктора
-(instancetype) initWithRateModel: (NSArray*)rates {
    self = [super init];
    if (self) {
        self.rates = rates;
    }
    return self;
}
    


@end
