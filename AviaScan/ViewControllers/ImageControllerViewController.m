//
//  ImageControllerViewController.m
//  AviaScan
//
//  Created by Sergey on 03/10/2019.
//  Copyright © 2019 Sergey. All rights reserved.
//

#import "ImageControllerViewController.h"

@interface ImageControllerViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic,strong) UIImageView* imageview;
@property (nonatomic, strong) UIImageView* backGroundImage;

@end

@implementation ImageControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    #pragma mark - BackgroundSettings
       self.backGroundImage = [[UIImageView alloc] initWithFrame:self.view.bounds];
       [self.backGroundImage setImage:[UIImage imageNamed:@"background"]];
       UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleRegular];
       UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
       blurEffectView.alpha = 0.98;
       blurEffectView.frame = self.backGroundImage.bounds;
       blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
       [self.backGroundImage addSubview:blurEffectView]; //if you have more UIViews, use an insertSubview API to place it where needed
       [self.view addSubview:self.backGroundImage];
       
    
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.bounds.size.width / 2) - 100,
                                                                   (self.view.bounds.size.height / 2) - 250 , 200, 200)];
    [_imageview.layer setCornerRadius:_imageview.bounds.size.width / 2];

    [self.imageview setContentMode:UIViewContentModeScaleAspectFit];
    [self.imageview setBackgroundColor:[UIColor whiteColor]];
    
 
    [self.view addSubview:self.imageview ];
    
    UIButton* btn =[[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width / 2) - 80,
                                                             (self.view.bounds.size.height / 2) , 160, 50)];
    [btn setTitle:@"Change your Pickture" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor darkGrayColor]];

    [btn addTarget:self action:@selector(pressButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
   
}
-(void) pressButton {
    UIImagePickerController* pickerController = [[UIImagePickerController alloc]init];
    pickerController.sourceType =UIImagePickerControllerSourceTypePhotoLibrary; //откуда брать фото
    pickerController.delegate = self;
    [self presentViewController:pickerController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info { //вытаскиваем картинку выбранную
    UIImage* image = [info valueForKey:UIImagePickerControllerOriginalImage]; //берем фото из массива
    if (image) { //если фото получено то присваиваем
        self.imageview.image = image;
    }
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {  // если нажать "закрыть"
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
