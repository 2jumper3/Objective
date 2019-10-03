//
//  DataManager.h
//  AviaScan
//
//  Created by Sergey on 16/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "Country.h"
#import "City.h"
#import "Airports.h"


NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property (nonatomic, strong, readonly) NSArray<Country*>* countries;
@property (nonatomic, strong, readonly) NSArray<City*>* cities;
@property (nonatomic, strong, readonly) NSArray<Airport*>* airports;

+ (DataManager*) sharedInstance;

- (NSNotificationName) didLoadCountriesNotificationName;
- (NSNotificationName) didLoadCitiesNotificationName;
- (NSNotificationName) didLoadAirportsNotificationName;

- (void) loadData;

@end

NS_ASSUME_NONNULL_END

