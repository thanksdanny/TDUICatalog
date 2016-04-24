//
//  TDImageViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/24/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDImageViewController.h"

@interface TDImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation TDImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//  UIImageView *imageView = (UIImageView *)self.view;
/*
    demo里没有连线，都是用的上面这段来创建，但是我连线做发现也是ok的。看看有什么区别
 */
    self.imageView.animationImages = @[
       [UIImage imageNamed:@"image_animal_1"],
       [UIImage imageNamed:@"image_animal_2"],
       [UIImage imageNamed:@"image_animal_3"],
       [UIImage imageNamed:@"image_animal_4"],
       [UIImage imageNamed:@"image_animal_5"]
    ];
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // If the image does not have the same aspect ratio as imageView's bounds, then imageView's backgroundColor will be applied to the "empty" space.
    self.imageView.backgroundColor = [UIColor whiteColor];
    self.imageView.animationDuration = 5;
    [self.imageView startAnimating];
    
    self.imageView.isAccessibilityElement = YES;
    self.imageView.accessibilityLabel = NSLocalizedString(@"Animated", nil);
}



@end
