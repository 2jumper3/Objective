//
//  BaseTheme.h
//  AviaScan
//
//  Created by Sergey on 12/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define ThemeIdentifier_DefaultLight @"DefaultLightTheme"
#define ThemeIdentifier_DefaultDark  @"DefaultDarkTheme"


NS_ASSUME_NONNULL_BEGIN

@interface BaseTheme : NSObject

- (nonnull NSString*) identifier;

- (nonnull UIColor*) backgroundColor;
- (nonnull UIColor*) viewBackgroundColor;
- (nonnull UIColor*) activeColor;

- (nonnull UIColor*) textActionColor;
- (nonnull UIColor*) textActiveColor;
- (nonnull UIColor*) textInactiveColor;

- (CGFloat) actionCornerRadius;

- (CGFloat) horizontalEdgeInset;

- (CGFloat) submitActionHeight;

- (CGFloat) topInset;


- (nonnull UIFont*) titleFont;
- (CGSize) travelDirectionsViewSize;

@end

NS_ASSUME_NONNULL_END
