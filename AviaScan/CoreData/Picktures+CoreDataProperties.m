//
//  Picktures+CoreDataProperties.m
//  
//
//  Created by Sergey on 15.10.2019.
//
//

#import "Picktures+CoreDataProperties.h"

@implementation Picktures (CoreDataProperties)

+ (NSFetchRequest<Picktures *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Picktures"];
}

@dynamic picture;

@end
