//
//  Global.m
//  testNever
//
//  Created by Nataporn on 16/2/2563 BE.
//  Copyright © 2563 Nataporn. All rights reserved.
//

#import "Global.h"

@implementation Global
{
    
}

- (NSString *)getWebServiceURL:(NSString *)service
{
    NSString *url = @"http://neversitup.pythonanywhere.com/";
    
    NSString *version = @"v1";
    
    // ##################################################################
    
    NSArray *serviceParts = [service componentsSeparatedByString:@"/"];
    if ([[serviceParts objectAtIndex:0] rangeOfString:@"^v[0-9]+$" options:NSRegularExpressionSearch].location != NSNotFound) {

        version = [serviceParts objectAtIndex:0];

        service = @"";
        for (int i=1; i<[serviceParts count]; i++) {
            if (i>1) {
                service = [NSString stringWithFormat:@"%@/", service];
            }

            service = [NSString stringWithFormat:@"%@%@", service, [serviceParts objectAtIndex:i]];
        }
    }

    // ##################################################################

    url = [NSString stringWithFormat:@"%@/%@", url, service];
    
    return url;
}
@end
