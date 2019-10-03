//
//  ThemeManager.h
//  AviaScan
//
//  Created by Sergey on 12/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>


#import "BaseTheme.h"

NS_ASSUME_NONNULL_BEGIN


@interface ThemeManager : NSObject

+ (ThemeManager*) shared;

- (NSNotificationName) didChangedThemeNotificationName;

- (nonnull NSArray<BaseTheme*>*) avaliableThemas;

- (nonnull BaseTheme*) activeTheme;

- (void) selectThemeWith: (nonnull NSString*) identifier;


@end

NS_ASSUME_NONNULL_END
