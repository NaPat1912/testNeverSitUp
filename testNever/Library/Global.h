//
//  Global.h
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Global : NSObject

@property NSString *app;
@property NSString *appID;

@property NSString *appID_TapKTC;
@property NSString *schema_TapKTC;

@property NSString *appVersion;

@property NSString *appGroup;

//extern NSInteger const authExpired;
@property NSInteger authExpired;

@property NSString *pushNotiDBFile;

@property NSString *pushNotiDBName;

@property NSString *encryptKey;
@property NSString *encryptIV;

@property NSString *photoAlbumName;

@property BOOL voiceEnabled;

@property BOOL cacheEnabled;

@property NSString *imageCacheDir;

/*
typedef enum {
    CLOUD,
    DEV,
    PROD
} serviceSite;


//@property NSString *WEBSERVICE_SITE;
@property serviceSite WEBSERVICE_SITE;

@property NSString *WEBSERVICE_URL;
@property NSString *WEBSERVICE_PORT;
*/

- (id)init;

- (NSString *)getWebServiceURL:(NSString *)service;

@end

NS_ASSUME_NONNULL_END
