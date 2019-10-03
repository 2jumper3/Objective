//
//  PreviewTableViewCell.m
//  AviaScan
//
//  Created by Sergey on 27/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "PreviewTableViewCell.h"
#import "AFNetworking/AFNetworking.h"

@interface PreviewTableViewCell()

@property(nonatomic,strong) UILabel *labelPrice;
@property(nonatomic,strong) UILabel *date;
@property (nonatomic,strong) NSDictionary *responseJSON;


@end

@implementation PreviewTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //добавление элементов в ячейку
    if (self) {
        self.date = [[UILabel alloc] initWithFrame:self.bounds];
        [self.date setFont:[UIFont systemFontOfSize: 25]];
        [self.contentView addSubview:self.date];
        
        self.labelPrice = [[UILabel alloc] initWithFrame:self.bounds];
        [self.labelPrice setFont:[UIFont systemFontOfSize: 15]];
        [self.contentView addSubview:self.labelPrice];
    }
    
    return self;
}

- (void)layoutSubviews { //задание размеров ячейки
    self.date.frame         = CGRectMake(10, 10, 50, 50);
    self.labelPrice.frame   = CGRectMake(70, 10, self.bounds.size.width - 70, 50);
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleGray; // стиль ячейки
    [self load];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
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
            NSLog(@"%@ %@", response, responseObject);
//            NSLog(@"%@", [self.responseJSON valueForKey:@"data"]);
//            NSArray* xz = [self.responseJSON objectForKey:@"data"];
//            NSString* albumsvideo = [self.responseJSON valueForKey:@""];
//            NSString* value = [[self.responseJSON objectAtIndex:0] valueForKey:@"value"];
//            NSString *titre1 = [[xz objectAtIndex:0]valueForKey:@"depart_date"];
//            NSString *titre2 = [[albumsvideo objectAtIndex:1]valueForKey:@"titre"];
//            NSLog(@"%@", titre1);
            NSArray* xz = [self.responseJSON objectForKey:@"data"];
            self.date.text   = [[xz objectAtIndex:0]valueForKey:@"depart_date"];
            self.labelPrice = [[xz objectAtIndex:0]valueForKey:@"value"];
            NSLog(@"json");
            NSLog(@"%@", self.date);
            
            

        }
    }];
    [dataTask resume];
}

-(void) setDateAndPrice: (NSString* )date withPrice: (NSString*) price {
    [self.date setText:date];
    [self.labelPrice setText:price];
}

@end
