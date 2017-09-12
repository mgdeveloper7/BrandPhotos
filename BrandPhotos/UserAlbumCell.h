//
//  UserAlbumCell.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserAlbumCell : UITableViewCell

@property (nonatomic, assign) int index;
@property (weak, nonatomic) IBOutlet UILabel *albumNumber;
@property (weak, nonatomic) IBOutlet UILabel *albumName;

@end
