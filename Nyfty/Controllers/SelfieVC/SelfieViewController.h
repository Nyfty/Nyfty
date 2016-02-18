//
//  SelfieViewController.h
//  Nyfty
//
//  Created by Atif Mehmood on 18/02/2016.
//  Copyright © 2016 Atif Mehmood. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelfieViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>


@property (nonatomic , strong) IBOutlet UIButton *btnCamera;
@property (nonatomic , strong) IBOutlet UIButton *btnNext;
@property (nonatomic , strong) IBOutlet UIImageView *cameraImageview;

//Selfie
@property (nonatomic, strong) NSString *placeholderImgName;
@property (weak, nonatomic) IBOutlet UIImageView *userProfileImage;
@property (strong, nonatomic  ) UIImagePickerController *ImagePickerVC;

@end
