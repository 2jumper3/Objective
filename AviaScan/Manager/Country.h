//
//  Country.h
//  AviaScan
//
//  Created by Sergey on 16/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@interface Country : NSObject

@property (nonatomic, strong, readonly) NSString     *name;
@property (nonatomic, strong, readonly) NSString     *currency;
@property (nonatomic, strong, readonly) NSDictionary *translations;
@property (nonatomic, strong, readonly) NSString     *code;

+ (nullable Country*) createWithDictionary: (NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END
