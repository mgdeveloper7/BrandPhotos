//
//  ViewUserViewController.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "ViewUserViewController.h"

@interface ViewUserViewController ()

@end

@implementation ViewUserViewController {
    
    DataRetrieval *dataRetrieval;
    Album *selectedAlbum;
    
    NSMutableArray *photos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Look out for the notification to say user retrieval has been completed
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(photoRetrievalFinished) name:PHOTO_RETRIEVAL_FINISHED object:nil];

    [self setupScreen];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setupScreen {

    _name.text = _selectedUser.fullname;
    _email.text = _selectedUser.email;
    _phone.text = _selectedUser.phone;
    _company.text = _selectedUser.company;
    
    _street.text = _selectedUser.address.street;
    _suite.text = _selectedUser.address.suite;
    _city.text = _selectedUser.address.city;
    _zipcode.text = _selectedUser.address.zipcode;

}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"ViewPhotosSegue"] )
    {
        ViewAlbumViewController *vc = segue.destinationViewController;
        vc.selectedUser = _selectedUser;
        vc.selectedAlbum = selectedAlbum;
        vc.photosForSelectedUser = photos;
    }
}


#pragma mark - Button methods

- (IBAction)backButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - Notification methods

- (void) photoRetrievalFinished {
    
 //   [self.view hideToastActivity];
    [self performSegueWithIdentifier:@"ViewPhotosSegue" sender:self];

}

// MARK:  UITableViewData delegate methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    int rowCount = _albumsForSelectedUser.count;
    
    return rowCount;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Album *album = _albumsForSelectedUser[[indexPath section]];
    
    UserAlbumCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserAlbumCellID"];
    
    cell.index = [indexPath section];
    cell.albumName.text = album.title;
    cell.albumNumber.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section+1];
    
    cell.albumNumber.backgroundColor = [UIColor yellowColor];
    cell.albumNumber.layer.cornerRadius = 10;
    cell.albumNumber.layer.borderWidth = 1;
    cell.albumNumber.layer.masksToBounds = YES;
    
    return cell;
}

// MARK:  UITableView delegate methods

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedAlbum = _albumsForSelectedUser[[indexPath section]];
    
    // TODO:  Make toast here
    // display toast with an activity spinner
    [self.view makeToastActivity:CSToastPositionCenter];

    [self.view makeToast:@"Loading photos for the selected album..."];
    
    // Obtain the album details for the selected user
    
    NSString *urlPath = [NSString stringWithFormat:@"%@%d", @"/photos?albumId=", selectedAlbum.albumID];
    
    dataRetrieval = [[DataRetrieval alloc ] init];

    [dataRetrieval getData:urlPath andCompletedBlock:^(NSDictionary *response, NSError *usersErr) {
        
        NSLog(@"Photo Response = %@", response);
                
        photos = [[NSMutableArray alloc] init];
        
        // Loop through each NSDictionary and populate the Photo object
        
        for (NSDictionary *dic in response) {
            
            Photo *rec = [[Photo alloc] init:dic];
            [photos addObject:rec];
        }
        
        // Notify that refresh has finished
        // Send any UI processing back to the main thread
        [self.view hideToastActivity];

        dispatch_async(dispatch_get_main_queue(), ^ {
            [[NSNotificationCenter defaultCenter] postNotificationName:PHOTO_RETRIEVAL_FINISHED object:nil];
        });
        
    }];
    
}


@end
