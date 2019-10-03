//
//  SettingsViewController.m
//  AviaScan
//
//  Created by Sergey on 11/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "SettingsViewController.h"
#import "MainTableViewCell.h"
#import "FlyRateModel.h"
#import "NetworkService.h"

@interface SettingsViewController () <UITableViewDataSource, UITableViewDelegate, UISearchResultsUpdating>

@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) UIView* backGroundview;
@property (nonatomic, strong) UIImageView* backGroundImage;
@property (nonnull,strong) NSMutableArray* names; //photo name
@property (nonnull,strong) NSMutableArray* photos;
@property (nonatomic,strong) UISearchController* search;
@property (nonatomic,strong) NSMutableArray*searchResult;


@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Settings"];
    NSMutableArray* searchResult = [[NSMutableArray alloc]init];
    self.search = [[UISearchController alloc]initWithSearchResultsController:nil];
    self.search.obscuresBackgroundDuringPresentation = false;
    self.navigationItem.searchController = self.search;//если все оставить так, то "поиск" будет выдвигаться по свайпу
    self.navigationItem.hidesSearchBarWhenScrolling = false;  // скрытие поиска при скроллинге
    self.search.searchResultsUpdater = self;
    
    
    
    self.view.backgroundColor = [UIColor greenColor];
    self.names = [NSMutableArray arrayWithObjects:@"Raz", @"Dva", @"Tri", @"Chetire", nil];
    self.photos = [NSMutableArray arrayWithObjects:@"background", @"background", @"background", @"background", nil];

    self.backGroundview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    self.backGroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.backGroundImage setImage:[UIImage imageNamed:@"background"]];


    
    
    
    
    //init table view
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView setDataSource:self];//данные для tableview
    [self.tableView setDelegate:self]; // установка делегата
    [self.tableView setRowHeight:70];
    [self.view addSubview:self.tableView];
//    [self.view addSubview:self.backGroundImage]; // картинка на заднем фоне
}

#pragma mark UITableVIewDataSource
//создание ячейки
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }

    if (self.search.isActive &&  [self.searchResult count] > 0 ) { //переделываение в зависимости от поиска
           [cell setMyName:[UIImage imageNamed:self.photos[indexPath.row]] withName:self.searchResult[indexPath.row]];
       } else {
           [cell setMyName:[UIImage imageNamed:self.photos[indexPath.row]] withName:self.names[indexPath.row]] ;// задание в ячейку картинки и подписи из массивов
       }
    //четные нечетные ячейки, переиспользование
//    if (indexPath.row % 2 == 0) {
//        cell.imageView.image = [UIImage imageNamed:@"liza"];
//        cell.textLabel.text = nil;
//    } else {
//        [cell.textLabel setText:[NSString stringWithFormat:@"%ld", indexPath.row]];
//        cell.imageView.image = nil;
//}
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { // количество строк в таблице
    
    if (self.search.isActive &&  [self.searchResult count] > 0 ) { //переделываение в зависимости от поиска
        return [self.searchResult count];
    } else {
        return self.names.count;
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {  //разделители
    return 3;
}

#pragma mark TableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:false]; //чтобы пропадало выделение с ячейки
    if (indexPath.row % 2 == 0) {
        NSLog(@"Cat");
    } else  {
        NSLog(@"%@", [NSString stringWithFormat:@"ячейка номер %ld", indexPath.row]);
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    //если нужно удалить ячейку нужно удалить и содержимое
//    [self.newArray removeObjectAtIndex:indexPath.row];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {  //разделители секций в таблице

    if (section == 0) {
        return @"First";
    }
    if (section == 1) {
        return @"Second";
    }
    if (section == 2) {
        return @"Third";
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}
#pragma Mark Search

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    if (searchController.searchBar.text) {
        NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF.names CONTAINS[cd] %@", searchController.searchBar.text]; //условие при котором мы можем выполнить фильтрацию массива
//        в том объекте где его имя будет содержать в себе символы из searchcontrollera
//        self.searchResult  = [self.names filteredArrayUsingPredicate:predicate];//используем в роли фильтра наш предикат
        [self.tableView reloadData];
    }
}


@end
