#import "IBDocumentARchiver+IBUnfuck.h"

@implementation NSObject (IBUnfuck)

/**
Rounds down rects so half pixel changes are not tracked anymore.

**CAUTION**: If you don't use autolayout, this means that you won't be able to position views on half
pixels anymore.
*/
- (void)unfuck_archiveRect:(CGRect)rect forKey:(NSString *)key
{
    CGRect unfuckedRect = CGRectMake(floorf(rect.origin.x), floorf(rect.origin.y),
                                     floorf(rect.size.width), floorf(rect.size.height));
    [self unfuck_archiveRect:unfuckedRect forKey:key];
}

/**
 Rounds down point positioning so half pixel changes are not tracked anymore.

 **CAUTION**: If you don't use autolayout, this means that you won't be able to position views on half
 pixels anymore.
 */
- (void)unfuck_archivePoint:(CGPoint)point forKey:(NSString *)key
{
    CGPoint unfuckedPoint = CGPointMake(floorf(point.x), floorf(point.y));
    [self unfuck_archivePoint:unfuckedPoint forKey:key];
}

/**
 Rounds down sizes so half pixel changes are not tracked anymore.

 **CAUTION**: If you don't use autolayout, this means that you won't be able to position views on half
 pixels anymore.
 */
- (void)unfuck_archiveSize:(CGSize)size forKey:(NSString *)key
{
    CGSize unfuckedSize = CGSizeMake(floorf(size.width), floorf(size.height));
    [self unfuck_archiveSize:unfuckedSize forKey:key];
}


@end