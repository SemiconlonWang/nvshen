//
//  HLEditPhotoViewController.m
//  nvshen
//
//  Created by hoolang on 15/5/14.
//  Copyright (c) 2015年 Hoolang. All rights reserved.
//

#import "HLEditPhotoViewController.h"
#import "AssetHelper.h"
#import "HLImageCrop.h"
#import "HLPostViewController.h"
#import "UIImage+Circle.h"


@interface HLEditPhotoViewController ()

@end

@implementation HLEditPhotoViewController

@synthesize ImageShow;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view from its nib.
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    button.frame = CGRectMake(10, 50, 100, 50);
//    button.backgroundColor = [UIColor blackColor];
//    [button setTitle:@"按1" forState:UIControlStateNormal];
    //[button addTarget:self action:@selector(press1) forControlEvents:UIControlEventTouchUpInside];
    
    //HLLog(@"_ImageShow %@", _ImageShow);
    //_ImageShow.image = _images[0];
    //HLLog(@"%@",_ImageShow.frame);
    //_ImageShow.frame = CGRectMake(0, 64, self.view.width, self.view.width*(_ImageShow.image.size.height/_ImageShow.image.size.width));
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(next) image:@"navigationbar_back" highImage:@"navigationbar_back_highlighted"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一步" style:UIBarButtonItemStylePlain target:self action:@selector(next)];

    UIImageView *imageV = [[UIImageView alloc]init];
    
    imageV.image = _image;
    imageV.frame = CGRectMake(0, 64, self.view.width, self.view.width*(imageV.image.size.height/imageV.image.size.width));
    
    [self.view addSubview:imageV];
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)back {
    HLLog(@"back -==== ");
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)next{
    HLPostViewController *postVC = [[HLPostViewController alloc] init];
    CGFloat imageH = self.image.size.height;
    
    if (imageH > 500) {
        postVC.image = [_image scaleToSize:CGSizeMake(500, 500)];
    }
    else{
        postVC.image = _image;
    }

    postVC.title = @"秀一下";
    
    [self.navigationController pushViewController:postVC animated:YES];
}



//#pragma mark - crop delegate
//- (void)cropImage:(UIImage*)cropImage forOriginalImage:(UIImage*)originalImage
//{
//    
//    _image = cropImage;
////    
////    NSLog(@"ImageShow %@",self.ImageShow);
////    HLLog(@"%@", originalImage);
////    self.ImageShow.image = cropImage;
////    self.ImageShow.frame = CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.width*(cropImage.size.height/cropImage.size.width));
////    HLLog(@"ImageShow.image %@", self.ImageShow.image);
////    NSLog(@"cropImage:");
//}

//- (void)didSelectPhotosFromDoImagePickerController:(DoImagePickerController *)picker result:(NSArray *)aSelected
//{
//    HLLog(@"didSelectPhotosFromDoImagePickerController:%@ ------- ======", aSelected[0]);
//    
//    self.ImageShow.image = aSelected[0];
//
//    _image = aSelected;
//    
////    UIImageView *iv = _images[0];
////    iv.image = aSelected[0];
////    
////
////    HLLog(@"didSelectPhotosFromDoImagePickerController:=======");
////    if (picker.nResultType == DO_PICKER_RESULT_UIIMAGE)
////    {
////        for (int i = 0; i < MIN(4, aSelected.count); i++)
////        {
////            
////            HLLog(@"DO_PICKER_RESULT_UIIMAGE DO_PICKER_RESULT_UIIMAGE: %d", i);
////
////            _ImageShow.image = aSelected[i];
////        }
////    }
////    else if (picker.nResultType == DO_PICKER_RESULT_ASSET)
////    {
////        for (int i = 0; i < MIN(4, aSelected.count); i++)
////        {
////            _ImageShow.image = aSelected[i];
////            _ImageShow.image = [ASSETHELPER getImageFromAsset:aSelected[i] type:ASSET_PHOTO_SCREEN_SIZE];
////            HLLog(@"DO_PICKER_RESULT_UIIMAGE DO_PICKER_RESULT_ASSET: %d", i);
////        }
////        
////        //[ASSETHELPER clearData];
////    }
//}

@end
