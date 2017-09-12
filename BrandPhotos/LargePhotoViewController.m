//
//  LargePhotoViewController.m
//  BrandPhotos
//
//  Created by Mark Gumbs on 12/09/2017.
//  Copyright © 2017 Mark Gumbs. All rights reserved.
//

#import "LargePhotoViewController.h"

@interface LargePhotoViewController ()

@end

@implementation LargePhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSURL *url = [NSURL URLWithString:_selectedPhoto.url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];

    _largePhotoImage.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Button methods

- (IBAction)backButtonPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
