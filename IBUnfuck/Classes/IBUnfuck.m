#import "IBDocumentArchiver+IBUnfuck.h"
#import "IBUnfuck.h"
#import "JRSwizzle.h"

@implementation IBUnfuck

+ (void)pluginDidLoad:(NSBundle *)plugin
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
