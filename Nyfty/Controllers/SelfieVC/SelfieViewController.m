//
//  SelfieViewController.m
//  Nyfty
//
//  Created by Atif Mehmood on 18/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import "SelfieViewController.h"
#import "HexColors.h"


@interface SelfieViewController ()

@end

@implementation SelfieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Border Color For Camera Button
    self.btnCamera.layer.borderColor = [UIColor blackColor].CGColor;
    self.btnCamera.layer.cornerRadius = 3.33f;
    self.btnCamera.layer.borderWidth = 1.0f;
    
    //Next Button Start Color
    self.btnNext.backgroundColor = [UIColor colorWithHexString:@"ABD4EC"];
    self.btnNext.enabled = false;
}


//Choose Photo Button Tapped
- (IBAction)addPictureButton:(id)sender
{
    NSString *ImportImageString = @"Please select an option:";
    NSString *CancelString = @"Cancel";
    NSString *CameraString = @"Camera";
    NSString *PhotoLibraryString = @"Photo Library";
    
    
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:ImportImageString message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:CancelString style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:CameraString style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        // Camera button tapped.
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            self.ImagePickerVC = [[UIImagePickerController alloc] init];
            self.ImagePickerVC.delegate = self;
            [self.ImagePickerVC setSourceType:UIImagePickerControllerSourceTypeCamera];
            
            [self.ImagePickerVC setAllowsEditing:YES];
            [self presentViewController:self.ImagePickerVC animated:YES completion:nil];
        }else{
            [self dismissViewControllerAnimated:YES completion:^{
            }];
        }
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:PhotoLibraryString style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        
        // Photo button tapped.
        
        self.ImagePickerVC = [[UIImagePickerController alloc] init];
        self.ImagePickerVC.delegate = self;
        [self.ImagePickerVC setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self.ImagePickerVC setAllowsEditing:YES];
        [self presentViewController:self.ImagePickerVC animated:YES completion:nil];
    }]];
    
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    [self.userProfileImage setImage:image];
    self.userProfileImage.layer.cornerRadius = self.userProfileImage.bounds.size.height/2;
    self.userProfileImage.clipsToBounds = true;
    self.btnNext.backgroundColor = [UIColor colorWithHexString:@"58AAD9"];
    self.btnNext.enabled = true;
    [self.btnCamera setTitle:@"Choose Alternate Photo" forState:UIControlStateNormal];
    [self.cameraImageview setImage:[UIImage imageNamed:@"checkmark-darkblue"]];
    //[self callWebServiceToUpdateUserPhoto];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
