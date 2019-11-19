//
//  ViewController.m
//  CameraAndBtn
//
//  Created by sunmingzhe on 2019/10/24.
//  Copyright © 2019 v_sunmingzhe01. All rights reserved.
//
#import <AVFoundation/AVCaptureDevice.h>
#import <AVFoundation/AVMediaFormat.h>
#import "ViewController.h"

@interface ViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (strong, nonatomic) UIImagePickerController *imagePickerController;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (weak, nonatomic) IBOutlet UIButton *CBtn;
@property (weak, nonatomic) IBOutlet UIButton *PBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //cameraBtn设置样式
    [_CBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_CBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
     // Set default backgrond color
     [_CBtn setBackgroundColor:[UIColor blackColor]];
     // Add Custom Font
     [[_CBtn titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:18.0f]];
     // Draw a custom gradient
     CAGradientLayer *btnGradient = [CAGradientLayer layer];
     btnGradient.frame = _CBtn.bounds;
     btnGradient.colors = [NSArray arrayWithObjects:
      (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
      (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
      nil];
     [_CBtn.layer insertSublayer:btnGradient atIndex:0];
     // Round button corners
     CALayer *btnLayer = [_CBtn layer];
     [btnLayer setMasksToBounds:YES];
     [btnLayer setCornerRadius:5.0f];
     // Apply a 1 pixel, black border around Buy Button
     [btnLayer setBorderWidth:1.0f];
     [btnLayer setBorderColor:[[UIColor blackColor] CGColor]];
    //photoBtn设置样式
    [_PBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_PBtn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
     // Set default backgrond color
     [_PBtn setBackgroundColor:[UIColor blackColor]];
     // Add Custom Font
     [[_PBtn titleLabel] setFont:[UIFont fontWithName:@"Knewave" size:18.0f]];
     // Draw a custom gradient
     CAGradientLayer *btnGradient2 = [CAGradientLayer layer];
     btnGradient2.frame = _PBtn.bounds;
     btnGradient2.colors = [NSArray arrayWithObjects:
      (id)[[UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f] CGColor],
      (id)[[UIColor colorWithRed:51.0f / 255.0f green:51.0f / 255.0f blue:51.0f / 255.0f alpha:1.0f] CGColor],
      nil];
     [_PBtn.layer insertSublayer:btnGradient2 atIndex:0];
     // Round button corners
     CALayer *btnLayer2 = [_PBtn layer];
     [btnLayer2 setMasksToBounds:YES];
     [btnLayer2 setCornerRadius:5.0f];
     // Apply a 1 pixel, black border around Buy Button
     [btnLayer2 setBorderWidth:1.0f];
     [btnLayer2 setBorderColor:[[UIColor blackColor] CGColor]];
}
//初始化imagePickerController属性
- (UIImagePickerController*) imagePickerController{
    if (_imagePickerController == nil){
        _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        //允许编辑
        _imagePickerController.allowsEditing = YES;
    }
    return  _imagePickerController;
}

- (IBAction)CameraBtn:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera]){
        //权限判断
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (authStatus == AVAuthorizationStatusRestricted ||
            authStatus ==AVAuthorizationStatusDenied){

            //无权限
            NSLog(@"无权限");

        }else{
            self.imagePickerController.sourceType =
            UIImagePickerControllerSourceTypeCamera;
            self.imagePickerController.cameraDevice = UIImagePickerControllerCameraDeviceRear;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
            NSLog(@"点击相机");
        }
    }else{
        NSLog(@"不存在相机");
    }
    
    
}


- (IBAction)PhotoBtn:(id)sender {
    NSLog(@"点击相册");
    self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.photoView.image = image;
    
}


@end
