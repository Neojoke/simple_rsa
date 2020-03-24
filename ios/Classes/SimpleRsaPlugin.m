#import "SimpleRsaPlugin.h"
#import <ObjcRSA/DTRSA.h>

@implementation SimpleRsaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel* channel = [FlutterMethodChannel
          methodChannelWithName:@"juanito21.com/simple_rsa"
                binaryMessenger:[registrar messenger]];
      SimpleRsaPlugin* instance = [[SimpleRsaPlugin alloc] init];
      [registrar addMethodCallDelegate:instance channel:channel];
}
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    NSLog(@"调用原生");
    NSDictionary * data = call.arguments;
    NSString * method = call.method;
    if ([method isEqualToString:@"encrypt"]) {
        NSString * text = [data objectForKey:@"txt"];
        NSString * publicKey = [data objectForKey:@"publicKey"];
        NSString * string = [DTRSA encryptString:text publicKey:publicKey];
        result(string);
    }else if ([method isEqualToString:@"decrypt"]){
        NSString * text = [data objectForKey:@"txt"];
        NSString * privateKey = [data objectForKey:@"privateKey"];
        NSString * string = [DTRSA decryptString:text privateKey:privateKey];
        result(string);
    }else if ([method isEqualToString:@"sign"]){
        NSString * text = [data objectForKey:@"plainText"];
        NSString * privateKey = [data objectForKey:@"privateKey"];
        NSString * string = [DTRSA encryptString:text privateKey:privateKey];
        result(string);
    }else if ([method isEqualToString:@"verify"]){
        NSString * plainText = [data objectForKey:@"plainText"];
        NSString * signature = [data objectForKey:@"signature"];
        NSString * publicKey = [data objectForKey:@"publicKey"];
        NSString * string = [DTRSA decryptString:plainText publicKey:publicKey];
        NSNumber * isSuccess = @([signature isEqualToString:string]);
        result(isSuccess);
    }
}
@end
