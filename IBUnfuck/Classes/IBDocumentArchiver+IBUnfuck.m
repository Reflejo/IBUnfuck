#import "IBDocumentARchiver+IBUnfuck.h"

@implementation NSObject (IBUnfuck)

/**
Rounds down rects so half pixel changes are not tracked anymore.

**CAUTION**: If you don't use autolayout, this means that you won't be able to position views on half
pixels anymore.
*/
- (void)unfuck_archiveRect:(CGRect)rect forKey:(NSString *)key {
    CGRect unfuckedRect = CGRectMake(floorf(rect.origin.x), floorf(rect.origin.y),
                                     floorf(rect.size.width), floorf(rect.size.height));
    [self unfuck_archiveRect:unfuckedRect forKey:key];
}

@end