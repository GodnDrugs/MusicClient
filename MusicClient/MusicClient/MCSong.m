//
//  MCSong.m
//  MusicClient
//
//  Created by Sergey Salnikov on 10.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCSong.h"

@implementation MCSong

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{
             @"songID":@"id",
             @"title":@"label",
             @"author":@"author"
             };
}

@end
