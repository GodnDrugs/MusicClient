//
//  MCSongCollectionViewCell.m
//  MusicClient
//
//  Created by Sergey Salnikov on 08.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import "MCSongCollectionViewCell.h"

@implementation MCSongCollectionViewCell

- (void)awakeFromNib {
    
    self.authorLabel.textAlignment = NSTextAlignmentCenter;
    self.titleSongLabel.textAlignment = NSTextAlignmentCenter;

}

@end
