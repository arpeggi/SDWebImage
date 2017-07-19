/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "FLAnimatedImageView+WebCache.h"

#if !TARGET_OS_TV
#import "objc/runtime.h"
#import "UIView+WebCacheOperation.h"
#import "UIImageView+WebCache.h"
#import "NSData+ImageContentType.h"
#import "FLAnimatedImage.h"
#import "UIImageView+WebCache.h"

@implementation FLAnimatedImageView (WebCache)

- (void)sd_setImageWithURL:(nullable NSURL *)url {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url completed:(nullable SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder completed:(nullable SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url placeholderImage:(nullable UIImage *)placeholder options:(SDWebImageOptions)options completed:(nullable SDWebImageCompletionBlock)completedBlock {
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

- (void)sd_setImageWithURL:(nullable NSURL *)url
          placeholderImage:(nullable UIImage *)placeholder
                   options:(SDWebImageOptions)options
                  progress:(nullable SDWebImageDownloaderProgressBlock)progressBlock
                 completed:(nullable SDWebImageCompletionBlock)completedBlock {
    __weak typeof(self)weakSelf = self;
    
    [self sd_internalSetImageWithURL:url placeholderImage:placeholder options:options setImageBlock:^(UIImage *image, NSData *imageData) {
        NSString *imageFormat = [NSData sd_contentTypeForImageData:imageData];
        if ([@"image/gif" isEqualToString:imageFormat]) {
            weakSelf.animatedImage = [FLAnimatedImage animatedImageWithGIFData:imageData];
            weakSelf.image = nil;
        } else {
            weakSelf.image = image;
            weakSelf.animatedImage = nil;
        }
    } progress:progressBlock completed:completedBlock];
}

@end

#endif
