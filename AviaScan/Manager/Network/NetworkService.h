//
//  NetworkService.h
//  AviaScan
//
//  Created by Sergey on 25/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkService : NSObject

+  (instancetype) sharedInstance;
- (void) getExchangeRatesForRoate: (NSString*)rate withCompletion: (void(^)(NSArray *rates))completion;




@end

NS_ASSUME_NONNULL_END
