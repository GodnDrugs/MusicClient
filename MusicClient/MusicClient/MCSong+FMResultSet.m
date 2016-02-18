//
//  MCSong+FMResultSet.m
//  MusicClient
//
//  Created by Sergey Salnikov on 10.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCSong+FMResultSet.h"

#import <FMDB/FMDB.h>


@implementation MCSong (FMResultSet)

+ (MCSong *)songWithResultSet:(FMResultSet *)resultSet
{
    MCSong *song = [MCSong new];
    
    song.songID = @([resultSet intForColumn:@"id"]);
    song.author = [resultSet stringForColumn:@"author"];
    song.title = [resultSet stringForColumn:@"label"];
    
    return song;
}

@end
