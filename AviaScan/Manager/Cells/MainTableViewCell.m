//
//  MainTableViewCell.m
//  AviaScan
//
//  Created by Sergey on 24/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "MainTableViewCell.h"

@interface MainTableViewCell ()


@property (nonatomic,strong) UIImageView *myImageView;
@property (nonatomic,strong) UILabel *myNewLabel;


@end

@implementation MainTableViewCell
//instancetype - возвращает тот же объект, id - возвращает nsobject
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //добавление элементов в ячейку
    if (self) {
        self.myImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.myImageView setContentMode:UIViewContentModeScaleAspectFit];
        [self.contentView addSubview:self.myImageView];
        
        self.myNewLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [self.myNewLabel setFont:[UIFont systemFontOfSize: 15]];
        [self.contentView addSubview:self.myNewLabel];
    }
    
    return self;
}

- (void)layoutSubviews { //задание размеров ячейки
    self.myImageView.frame  = CGRectMake(10, 10, 50, 50);
    self.myNewLabel.frame   = CGRectMake(70, 10, self.bounds.size.width - 70, 50);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleGray; // стиль ячейки
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
//метод для задания картинок и имен ячейке
-(void) setMyName:(UIImage*)cat withName:(NSString*)name {
    [self.myImageView setImage:cat];
    [self.myNewLabel setText:name];
}

@end
