#import "IBDocumentArchiver+IBUnfuck.h"
#import "IBUnfuck.h"
#import "JRSwizzle.h"

@implementation IBUnfuck

- (id)initWithBundle:(NSBundle *)plugin
{
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(xcodeDidFinishLaunching:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
    }

    return self;
}

+ (void)pluginDidLoad:(NSBundle *)plugin
{
    static dispatch_once_t onceToken;
    NSString *currentApplicationName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
    if ([currentApplicationName isEqual:@"Xcode"]) {
        dispatch_once(&onceToken, ^{
            sharedPlugin = [[IBUnfuck alloc] initWithBundle:plugin];
        });
    }
}

- (void)xcodeDidFinishLaunching:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

    Class IBDocumentArchiver = NSClassFromString(@"IBDocumentArchiver");

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    [IBDocumentArchiver jr_swizzleMethod:@selector(archiveRect:forKey:)
                              withMethod:@selector(unfuck_archiveRect:forKey:)
                                   error:nil];

    [IBDocumentArchiver jr_swizzleMethod:@selector(archiveSize:forKey:)
                              withMethod:@selector(unfuck_archiveSize:forKey:)
                                   error:nil];

    [IBDocumentArchiver jr_swizzleMethod:@selector(archivePoint:forKey:)
                              withMethod:@selector(unfuck_archivePoint:forKey:)
                                   error:nil];
#pragma clang diagnostic pop
}

@end
