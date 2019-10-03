//
//  FlyRateModel.m
//  AviaScan
//
//  Created by Sergey on 25/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "FlyRateModel.h"

@implementation FlyRateModel 

#pragma mark Parser

- (instancetype) initWithDictionary: (NSDictionary*) dictionary {
    self = [super init];
    
    if (self) {
        self.rateName = [dictionary valueForKey:@"rateName"];  //обращение к ключу rateName
        self.rateValue= [NSNumber numberWithDouble:[[dictionary valueForKey:@"rateValue"]doubleValue]];
    }
    
    return self;
}

@end
