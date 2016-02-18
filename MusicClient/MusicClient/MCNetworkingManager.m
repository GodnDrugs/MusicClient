//
//  MCNetworkingManager.m
//  MusicClient
//
//  Created by Sergey Salnikov on 08.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCNetworkingManager.h"
#import "MCSong.h"

#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <Mantle/Mantle.h>


NSString * const kMCBaseUrl = @"http://tomcat.kilograpp.com/songs/api/";

@interface MCNetworkingManager ()

@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end

@implementation MCNetworkingManager

+ (instancetype)sharedInstance
{
    static MCNetworkingManager *instance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        instance = [MCNetworkingManager new];
    });
    
    return instance;
}

- (id)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:kMCBaseUrl]];
    
    return self;
}

- (void)createModelsSongJSON:(void (^)(NSArray *))success fail:(void (^)(NSError *))failure
{
    [self.manager GET:@"songs"
           parameters:nil
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                  BOOL status = (BOOL)responseObject[@"status"];
//                  if (!status) {
//                      return;
//                  }
                  NSArray *jsonSongs = (NSArray *)responseObject;
                  NSError *error = nil;
                  NSArray *modelsSong = [MTLJSONAdapter modelsOfClass:MCSong.class fromJSONArray:jsonSongs error:&error];
                  if (success) {
                      success(modelsSong);
                  }
              } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  if (failure) {
                      failure(error);
                  }
              }];

}

@end
