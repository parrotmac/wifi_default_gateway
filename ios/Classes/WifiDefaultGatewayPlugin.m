#import "WifiDefaultGatewayPlugin.h"
#import "GatewayInterfaceInterface.h"

@implementation WifiDefaultGatewayPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"isaacparker.co/wifi_default_gateway"
            binaryMessenger:[registrar messenger]];
  WifiDefaultGatewayPlugin* instance = [[WifiDefaultGatewayPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getGatewayIP" isEqualToString:call.method]) {
      result([GatewayInteraceInterface getGatewayIP]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
