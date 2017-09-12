//
//  ViewAlbumViewController.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "ViewAlbumViewController.h"

@interface ViewAlbumViewController ()

@end

@implementation ViewAlbumViewController {
    
    Photo *selectedPhoto;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _albumName.text = _selectedAlbum.title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ( [segue.identifier isEqualToString:@"LargePhotoSegue"] )
    {
        LargePhotoViewController *vc = segue.destinationViewController;
        vc.selectedPhoto = selectedPhoto;
    }
}

#pragma mark - Button methods

- (IBAction)backButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _photosForSelectedUser.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PhotoThumbnailCellID";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    Photo *photo = _photosForSelectedUser[indexPath.row];
    
    // Configure the cell
    
    NSURL *url = [NSURL URLWithString:photo.thumbnailUrl];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //    UIImageView *photoImageView = (UIImageView *)[cell viewWithTag:1000];
    //    photoImageView.image = [UIImage imageNamed:@"test-icon"];
    
    //    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test-icon"]];
    cell.backgroundView = [[UIImageView alloc] initWithImage:image];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedPhoto = _photosForSelectedUser[indexPath.row];
    [self performSegueWithIdentifier:@"LargePhotoSegue" sender:self];

}


@end
