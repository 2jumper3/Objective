//
//  FromViewController.h
//  AviaScan
//
//  Created by Sergey on 24/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FromViewController : UIViewController

@property (nonatomic,strong) NSArray* rates;
-(instancetype) initWithRateModel: (NSArray*)rates ;

@end

NS_ASSUME_NONNULL_END
