//
//  MCSong.h
//  MusicClient
//
//  Created by Sergey Salnikov on 10.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MTLModel.h"

#import <MTLJSONAdapter.h>


@interface MCSong : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic) NSNumber *songID;
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *author;

@end
