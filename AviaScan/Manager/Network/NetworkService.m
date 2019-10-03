//
//  NetworkService.m
//  AviaScan
//
//  Created by Sergey on 25/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "NetworkService.h"
#import "FlyRateModel.h"

#define API_URL @"https://api.exchangeratesapi.io/latest?base="

@implementation NetworkService

+ (instancetype)sharedInstance {
    static NetworkService *instance;
    static dispatch_once_t onceToken;  //запрос выполнится 1 раз за всё время приложения
    dispatch_once(&onceToken, ^{
        instance =[[NetworkService alloc] init];
    });
    return instance;
}

- (void) getExchangeRatesForRoate: (NSString*)rate withCompletion: (void(^)(NSArray *rates))completion {
//получаем курсы валют
    [self load:API_URL withCompletion:^(id  _Nullable result) {
        NSDictionary *json = result;
        NSDictionary *rates = json[@"rates"];
        
        NSMutableArray* resultRates = [NSMutableArray new];
        
        for (NSDictionary*key in rates) {
            NSMutableDictionary* modelDictionary = [NSMutableDictionary new];
            modelDictionary[@"rateName"] = key; //получаем первый объект из словаря
            modelDictionary[@"rateValue"]= [rates objectForKey:key];
            
            [resultRates addObject:[[FlyRateModel alloc] initWithDictionary:modelDictionary]];
        }
        
        completion(resultRates);
        NSLog(@"network test completed");
    }];
}

-(void) load:(NSString*)url withCompletion: (void(^)(id _Nullable result))completion {
    
    NSURLSession *session = [NSURLSession sharedSession];  //создание сессии
    NSURLSessionDataTask * task = [session dataTaskWithURL:[NSURL URLWithString:url] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {  //задача на выполнение запроса
        
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];  //обработка результата
        completion(result);
        
        
        
    }];
    [task resume]; //запуск задачи на выполнение
    
}

@end
