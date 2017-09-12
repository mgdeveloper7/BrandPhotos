//
//  LargePhotoViewController.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Photo.h"

@interface LargePhotoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *largePhotoImage;

@property (strong, nonatomic) Photo *selectedPhoto;

@end
