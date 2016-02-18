//
//  MCNetworkingManager.h
//  MusicClient
//
//  Created by Sergey Salnikov on 08.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import <Foundation/Foundation.h>


FOUNDATION_EXTERN NSString *const kMCBaseUrl;

@interface MCNetworkingManager : NSObject

+ (instancetype)sharedInstance;

- (void)createModelsSongJSON:(void (^)(NSArray *))success fail:(void (^)(NSError *))failure;

@end
