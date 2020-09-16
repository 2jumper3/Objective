//
//  Picktures+CoreDataProperties.h
//  
//
//  Created by Sergey on 15.10.2019.
//
//

#import "Picktures+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Picktures (CoreDataProperties)

+ (NSFetchRequest<Picktures *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *picture;

@end

NS_ASSUME_NONNULL_END
