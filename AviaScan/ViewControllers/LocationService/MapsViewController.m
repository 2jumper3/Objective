//
//  MapsViewController.m
//  AviaScan
//
//  Created by Sergey on 30/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//


#import "MapsViewController.h"
#import <MapKit/MapKit.h>
#import "LocationService.h"
#import "SearchMapViewController.h"

@interface MapsViewController () <MKMapViewDelegate,UIAlertViewDelegate>

@property (nonatomic, strong) LocationService *loc;

@end

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loc = [[LocationService alloc] init];



    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    [mapView setDelegate:self];
    
    [mapView setShowsUserLocation:true];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.location.coordinate, 1000, 1000);
    [mapView setRegion:region animated:true];
    
    [self.view addSubview:mapView];
    [self.loc getCityNameFromLocation:self.location withCompletion:^(NSString *address) {
        dispatch_async(dispatch_get_main_queue(), ^{
             MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
                        annotation.title = address;
                        annotation.subtitle = @"Subtitle";
                        annotation.coordinate = self.location.coordinate;
                        [mapView addAnnotation:annotation];
        });
    }];
}
//    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
//    annotation.title = @"address";
//    annotation.subtitle = @"Subtitle";
//    annotation.coordinate = self.location.coordinate;
//    [mapView addAnnotation:annotation];
//}


- (void)viewDidAppear:(BOOL)animated {
    [self.loc start];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *identifire = @"MarkerIdentifier";
    MKAnnotationView *annotationView = (MKMarkerAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifire];
    if (!annotationView) {
        annotationView = [[MKMarkerAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifire];
        annotationView.canShowCallout = true;
        annotationView.calloutOffset = CGPointMake(-5.0, 5.0);
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [btn addTarget:self action:@selector(pressInfoButton) forControlEvents:UIControlEventTouchUpInside];
        
        annotationView.rightCalloutAccessoryView = btn;
    }
    annotationView.annotation = annotation;
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
//    NSLog(@"Lat %f, Long %f", mapView.centerCoordinate.latitude, mapView.centerCoordinate.longitude);
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    NSLog(@"Нажата метка");
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
    [self.loc addressFromLocation:loc];
}

- (void)pressInfoButton {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Нажата инфо кнопка" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:true completion:nil];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * action) {}];
    [alert addAction:defaultAction];
//    [self presentViewController:alert animated:true completion:nil];

}

@end


/*
#import "MapsViewController.h"
#import "LocationService.h"

@interface MapsViewController () <MKMapViewDelegate>
@property (nonatomic, strong) LocationService *loc;

@end

@implementation MapsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [super viewDidLoad];
    [[[LocationService alloc] init] start];
    
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(55.75220, 37.615600); //координаты карты

    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        [mapView setDelegate:self];
        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 5000, 5000); //координаты, регион и масштаб
        [mapView setRegion:region animated:true];
      [self.view addSubview:mapView];
    
    MKPointAnnotation* point =[[MKPointAnnotation alloc]init];
    point.title = @"title";
    point.subtitle = @"subtitle";
    point.coordinate = coordinate;
    [mapView addAnnotation:point];
        
      
}
#pragma Mark DelegateSettings
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)point { //button с информацией над меткой
    static NSString *idencifier = @"MarkerID";
    MKAnnotationView* annitationView = (MKAnnotationView * )[mapView dequeueReusableAnnotationViewWithIdentifier:idencifier];
    if (!annitationView) {
        annitationView = [[MKAnnotationView alloc] initWithAnnotation:point reuseIdentifier:idencifier];
        annitationView.calloutOffset = CGPointMake(0,0);
        annitationView.canShowCallout = true;
        
        UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [newBtn addTarget:self action:@selector(pressBtn) forControlEvents:UIControlEventTouchUpInside];
        
        annitationView.rightCalloutAccessoryView = newBtn;
    }
    annitationView.annotation = point;
    return annitationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {  //когда тыкаешь по аннотации
    NSLog(@"Нажата");
    CLLocation *loc = [[CLLocation alloc] initWithLatitude:view.annotation.coordinate.latitude longitude:view.annotation.coordinate.longitude];
    [self.loc addressFromLocation:loc ];
    
}

-(void)  pressBtn {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Кнопка нажата" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert setTitle:@"Кнопка нажата"];
    [self presentViewController:alert animated:true completion: nil];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated { // отслеживание центра карт с выводом в консоль
    NSLog(@"Coordinate is %f and %f", mapView.centerCoordinate.latitude, mapView.centerCoordinate.longitude);
}

@end
*/
