//
//  FlyRateModel.h
//  AviaScan
//
//  Created by Sergey on 25/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FlyRateModel : NSObject

@property (nonatomic,strong) NSString* rateName;
@property (nonatomic,strong) NSNumber* rateValue;
- (instancetype) initWithDictionary: (NSDictionary*) dictionary;


@end

NS_ASSUME_NONNULL_END
