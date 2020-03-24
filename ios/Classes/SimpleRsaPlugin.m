#import "SimpleRsaPlugin.h"
#import <ObjcRSA/DTRSA.h>

@implementation SimpleRsaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterMethodChannel * chennel = [[FlutterMethodChannel alloc]initWithName:@"juanito21.com/simple_rsa" binaryMessenger:registrar.messenger codec:nil];
    SimpleRsaPlugin * plugin = [[SimpleRsaPlugin alloc]init];
    [registrar addMethodCallDelegate:plugin channel:chennel];
}
- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result{
    NSDictionary * data = call.arguments;
    NSString * method = call.method;
   
       [DTRSA encryptString:@"" privateKey:@""];
       [DTRSA decryptString:@"" publicKey:@""];
       [DTRSA decryptData:@"" privateKey:@""];
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
        NSString * string = [DTRSA encryptString:text publicKey:privateKey];
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
