//
//  LocationService.h
//  AviaScan
//
//  Created by Sergey on 30/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>



@interface LocationService : NSObject

- (void)start;
- (void)addressFromLocation:(CLLocation*)location;
- (void)locationFromAddress:(NSString*)address withCompletion:(void(^)(CLLocation *location))completion;
-(void) getCityNameFromLocation: (CLLocation*) location withCompletion:(void(^)(NSString *address))completion;

@end


