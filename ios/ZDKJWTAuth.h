#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ChatProvidersSDK/ChatProvidersSDK.h>

@interface ZDKJWTAuth: NSObject<ZDKJWTAuthenticator>

{
    NSString *AlfUrl;
    NSString *AuthToken;
}

- (void)setUrl:(NSString *_Nullable) urlString;
- (void)seToken:(NSString *_Nullable) NSString;
- (void)getToken:(void (^ _Nonnull)(NSString * _Nullable, NSError * _Nullable))completion;

@end
