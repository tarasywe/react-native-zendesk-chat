#import "ZDKJWTAuth.h"

@implementation ZDKJWTAuth

-(void)setUrl:(NSString *)urlString{
    AlfUrl=urlString;
}

-(void)setToken:(NSString *)token{
    AuthToken=token;
}

- (void)getToken:(void (^ _Nonnull)(NSString * _Nullable, NSError * _Nullable))completion {
    NSError *error;

    NSURL *url = [NSURL URLWithString:AlfUrl];

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];

    [request setHTTPMethod:@"GET"];

    [request setURL:url];

    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

    [request setValue:[NSString stringWithFormat:@"Bearer %@", AuthToken] forHTTPHeaderField:@"Authorization"];

    NSData *postData = NULL;

    [request setHTTPBody:postData];

    NSData *finalDataToDisplay = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSMutableDictionary *abc = [NSJSONSerialization JSONObjectWithData: finalDataToDisplay
                                                               options: NSJSONReadingMutableContainers
                                                                error: &error];
    completion(abc[@"identity"],NULL);
}

@end
