//
//  SelectUserViewController.h
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataRetrieval.h"
#import "UserTableViewCell.h"
#import "ViewUserViewController.h"

@interface SelectUserViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *outerView;
@property (weak, nonatomic) IBOutlet UIView *outerTableViewView;
@property (weak, nonatomic) IBOutlet UITableView *usersTableView;

@end
