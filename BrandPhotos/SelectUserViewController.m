//
//  SelectUserViewController.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "SelectUserViewController.h"

@interface SelectUserViewController ()

@end

@implementation SelectUserViewController {

    DataRetrieval *dataRetrieval;
    
    NSMutableArray *users;
    NSMutableArray *albumsForSelectedUser;
    
    User *selectedUser;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Look out for the notification to say user retrieval has been completed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(usersRetrievalFinished) name:USERS_RETRIEVAL_FINISHED object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(albumRetrievalFinished) name:ALBUM_RETRIEVAL_FINISHED object:nil];
    

    [self getUserData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getUserData {
    
    NSString *urlPath = @"/users";
    
    // Obtain the users from the REST service
    
    dataRetrieval = [[DataRetrieval alloc ] init];;

    [dataRetrieval getData:urlPath andCompletedBlock:^(NSDictionary *response, NSError *usersErr) {
        
        NSLog(@"Response = %@", response);

        users = [[NSMutableArray alloc] init];
        
        // Loop through each NSDictionary and populate the User object
        
        for (NSDictionary *dic in response) {
            
            User *user = [[User alloc] init:dic];
            [users addObject:user];
        }
        
        // Notify that refresh has finished
        // Send any UI processing back to the main thread
        dispatch_async(dispatch_get_main_queue(), ^ {
            [[NSNotificationCenter defaultCenter] postNotificationName:USERS_RETRIEVAL_FINISHED object:nil];
        });
        
    }];

}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"ViewUserSegue"] )
    {
        ViewUserViewController *vc = segue.destinationViewController;
        vc.selectedUser = selectedUser;
        vc.albumsForSelectedUser = albumsForSelectedUser;
    }
}

#pragma mark - Notification methods

- (void) usersRetrievalFinished {
    
    [self loadUsersTableView];
    
}

- (void) albumRetrievalFinished {
    
    [self performSegueWithIdentifier:@"ViewUserSegue" sender:self];
    
}

-(void) loadUsersTableView {
    
    [_usersTableView reloadData];
}

// MARK:  UITableViewData delegate methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int rowCount = users.count;
    
    return rowCount;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    User *user = users[[indexPath section]];
    
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserTableViewCellID"];
    
    cell.index = [indexPath section];
    cell.usernameLabel.text = user.username;
    
    // Make label circular
    cell.usernameLabel.layer.cornerRadius = 10;
    cell.usernameLabel.layer.borderWidth = 1;
    cell.usernameLabel.layer.masksToBounds = YES;
    
    return cell;
}

// MARK:  UITableView delegate methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedUser = users[[indexPath section]];
    
    // Obtain the album details for the selected user
    
    NSString *urlPath = [NSString stringWithFormat:@"%@%d", @"/albums?userId=", selectedUser.userID];

    dataRetrieval = [[DataRetrieval alloc ] init];
    
    [dataRetrieval getData:urlPath andCompletedBlock:^(NSDictionary *response, NSError *usersErr) {
        
        NSLog(@"Album Response = %@", response);
        
        albumsForSelectedUser = [[NSMutableArray alloc] init];
        
        // Loop through each NSDictionary and populate the User object
        
        for (NSDictionary *dic in response) {
            
            Album *album = [[Album alloc] init:dic];
            [albumsForSelectedUser addObject:album];
        }

        // Notify that refresh has finished
        // Send any UI processing back to the main thread
        
        dispatch_async(dispatch_get_main_queue(), ^ {
            [[NSNotificationCenter defaultCenter] postNotificationName:ALBUM_RETRIEVAL_FINISHED object:nil];
        });
        
    }];

}


@end
