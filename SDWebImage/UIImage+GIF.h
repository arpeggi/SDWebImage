//
//  UIImage+GIF.h
//  LBGIFImage
//
//  Created by Laurin Brandner on 06.01.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (GIF)

+ (UIImage *)sd_animatedGIFWithData:(NSData *)data;

/**
 *  Checks if an UIImage instance is a GIF. Will use the `images` array
 */
- (BOOL)isGIF;

@end
