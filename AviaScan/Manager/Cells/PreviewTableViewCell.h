//
//  PreviewTableViewCell.h
//  AviaScan
//
//  Created by Sergey on 27/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PreviewTableViewCell : UITableViewCell
-(void) setDateAndPrice: (NSString* )date withPrice: (NSString*) price;
@end

NS_ASSUME_NONNULL_END
