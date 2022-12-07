#import "TnexDesignSystemPlugin.h"
#if __has_include(<tnex_design_system/tnex_design_system-Swift.h>)
#import <tnex_design_system/tnex_design_system-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "tnex_design_system-Swift.h"
#endif

@implementation TnexDesignSystemPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTnexDesignSystemPlugin registerWithRegistrar:registrar];
}
@end
