#import <Foundation/Foundation.h>

@interface NSObject (IBUnfuck)

/**
Rounds down rects so half pixel changes are not tracked anymore. 
 
**CAUTION**: If you don't use autolayout, this means that you won't be able to position views on half
pixels anymore.
*/
- (void)unfuck_archiveRect:(CGRect)rect forKey:(NSString *)key;

@end