#import "IBDocumentArchiver+IBUnfuck.h"
#import "FZIBUnfuck.h"
#import "JRSwizzle.h"

@implementation FZIBUnfuck

/**
 Main plugin initialization.
 */
+ (void)ide_initializeWithOptions:(int)options error:(NSError **)error
{
    Class IBDocumentArchiver = NSClassFromString(@"IBDocumentArchiver");

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [IBDocumentArchiver jr_swizzleMethod:@selector(archiveRect:forKey:)
                              withMethod:@selector(unfuck_archiveRect:forKey:)
                                   error:nil];
#pragma clang diagnostic pop
}

@end