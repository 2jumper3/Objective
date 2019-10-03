
//
//  BaseTheme.m
//  AviaScan
//
//  Created by Sergey on 12/09/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "BaseTheme.h"


@implementation BaseTheme

- (nonnull NSString*) identifier { return @""; }

- (nonnull UIColor*) backgroundColor     { return UIColor.whiteColor; }
- (nonnull UIColor*) viewBackgroundColor { return UIColor.whiteColor; }
- (nonnull UIColor*) activeColor         { return UIColor.whiteColor; }

- (nonnull UIColor*) textActionColor   { return UIColor.whiteColor; }
- (nonnull UIColor*) textActiveColor   { return UIColor.whiteColor; }
- (nonnull UIColor*) textInactiveColor { return UIColor.whiteColor; }

- (CGFloat) actionCornerRadius { return 0; }

- (CGFloat) horizontalEdgeInset { return 0; }

- (CGFloat) submitActionHeight { return 0; }

- (CGFloat) topInset { return 0; }

- (nonnull UIFont*) titleFont { return [UIFont systemFontOfSize: 15]; }

- (CGSize) travelDirectionsViewSize {return CGSizeMake(200, 300); }

@end
