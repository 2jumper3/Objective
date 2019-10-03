//
//  LocationService.m
//  AviaScan
//
//  Created by Sergey on 30/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//
/*
#import "LocationService.h"
#import <CoreLocation/CoreLocation.h>


@interface LocationService () <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation LocationService

- (void)start {
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.distanceFilter = 500;
    
    [self.locationManager requestAlwaysAuthorization];
}

- (void)addressFromLocation:(CLLocation*)location {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            for (MKPlacemark *place in placemarks) {
                NSLog(@"%@", place.name);
            }
        }
    }];
}

- (void)locationFromAddress:(NSString*)address withCompletion:(void(^)(CLLocation *location))completion {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            for (MKPlacemark *place in placemarks) {
                completion(place.location);
            }
        }
    }];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Пользователь дал добро");
        [self.locationManager startUpdatingLocation];
    } else {
        NSLog(@"Пользователь запретил");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = [locations firstObject];
    if (location) {
        NSLog(@"%@", location);
    }
}

@end
*/




#import "LocationService.h"
#import "CoreLocation/CoreLocation.h"

@interface LocationService () <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;

@end



@implementation LocationService

-(void) start {
    self.locationManager =[[CLLocationManager alloc]init]; // инициализация локации
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
    self.locationManager.distanceFilter = 500;
    
    
    [self.locationManager requestAlwaysAuthorization];
}

-(void) addressFromLocation:(CLLocation*)location {
    CLGeocoder* geocoder = [[CLGeocoder  alloc]init];//позволяет получить координаты и адрес
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0 ) {  //если количество меток уже больше 0
            for (MKPlacemark *place in placemarks) {
                NSLog(@"%@", place.name);
            }
        }
    }];
}

-(void) getCityNameFromLocation: (CLLocation*) location withCompletion:(void(^)(NSString *address))completion {
    CLGeocoder* geocoder = [[CLGeocoder  alloc]init];//позволяет получить координаты и адрес
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0 ) {  //если количество меток уже больше 0
            completion([[placemarks firstObject] name]);
        }
    }];
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {  //обновление локации
    CLLocation *location = [locations firstObject];
    if (location) {
        NSLog(@"%@", location);
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status { //разрешил ли пользователь геопозицию
    if (status == kCLAuthorizationStatusAuthorizedAlways || status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"Разрешено");
        [self.locationManager startUpdatingLocation]; // обновление геолокации
    } else {
        NSLog(@"Нет доступа к геологакии");
    }
}

- (void)locationFromAddress:(NSString*)address withCompletion:(void(^)(CLLocation *location))completion {
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder geocodeAddressString:address completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if ([placemarks count] > 0) {
            for (MKPlacemark *place in placemarks) {
                completion(place.location);
            }
        }
    }];
}
@end

