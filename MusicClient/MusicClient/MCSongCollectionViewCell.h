//
//  MCSongCollectionViewCell.h
//  MusicClient
//
//  Created by Sergey Salnikov on 08.02.16.
//  Copyright © 2016 Sergey Salnikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCSongCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleSongLabel;

@end
