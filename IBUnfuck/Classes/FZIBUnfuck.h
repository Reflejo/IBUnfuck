#import <Foundation/Foundation.h>

@protocol IDEInitialization

/**
 Main plugin initialization.
 */
+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error;

@end

@interface FZIBUnfuck : NSObject <IDEInitialization>

@end
