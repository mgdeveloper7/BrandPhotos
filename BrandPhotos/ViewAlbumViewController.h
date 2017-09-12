//
//  ViewAlbumViewController.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
#import "Photo.h"
#import "Album.h"
#import "LargePhotoViewController.h"

@interface ViewAlbumViewController : UIViewController<UICollectionViewDelegate>

@property (strong, nonatomic) User *selectedUser;
@property (strong, nonatomic) Album *selectedAlbum;
@property (strong, nonatomic) NSMutableArray *photosForSelectedUser;

@property (strong, nonatomic) IBOutlet UILabel *albumName;

@end
