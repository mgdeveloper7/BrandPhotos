//
//  ViewUserViewController.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRetrieval.h"
#import "User.h"
#import "Album.h"
#import "UserAlbumCell.h"
#import "Photo.h"
#import "ViewAlbumViewController.h"

@interface ViewUserViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *outerTableViewView;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *email;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UILabel *company;

@property (weak, nonatomic) IBOutlet UILabel *street;
@property (weak, nonatomic) IBOutlet UILabel *suite;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *zipcode;

@property (strong, nonatomic) User *selectedUser;
@property (strong, nonatomic) NSMutableArray *albumsForSelectedUser;

@end
