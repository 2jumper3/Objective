//
//  Airports.h
//  AviaScan
//
//  Created by Sergey on 16/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>

// http://api.travelpayouts.com/data/ru/airports.json

NS_ASSUME_NONNULL_BEGIN


@interface Airport : NSObject

@property (nonatomic, strong, nonnull, readonly) NSString* code;
@property (nonatomic, strong, nonnull, readonly) NSString* name;

@property (nonatomic, strong, nonnull, readonly) NSString* timeZone;
@property (nonatomic, strong, nonnull, readonly) NSString* countryCode;
@property (nonatomic, strong, nonnull, readonly) NSString* cityCode;

@property (nonatomic, strong, nonnull, readonly) NSDictionary* translations;

@property (nonatomic, strong, nonnull, readonly) NSNumber* lon;
@property (nonatomic, strong, nonnull, readonly) NSNumber* lat;

+ (nullable Airport*) createWithDictionary: (NSDictionary*) dictionary;

@end

NS_ASSUME_NONNULL_END

