//
//  MCSong+FMResultSet.h
//  MusicClient
//
//  Created by Sergey Salnikov on 10.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCSong.h"


@class FMResultSet;

@interface MCSong (FMResultSet)

+ (MCSong *)songWithResultSet:(FMResultSet *)resultSet;

@end
