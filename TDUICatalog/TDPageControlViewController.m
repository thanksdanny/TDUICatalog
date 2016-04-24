//
//  TDPageControlViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/25/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDPageControlViewController.h"
#import "UIColor+TDApplicationSpecific.h"

@interface TDPageControlViewController ()

@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *colors;

@end

#pragma mark - 

@implementation TDPageControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = @[[UIColor blackColor], [UIColor grayColor], [UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor]];
    
    [self configurePageControl];
    [self pageControlValueDidChange];
}

#pragma mark - Configuration

- (void)configurePageControl {
    // The total number of pages that are available is based on how many available colors we have.
    self.pageControl.numberOfPages = [self.colors count];
    self.pageControl.currentPage = 2;
    
    self.pageControl.tintColor = [UIColor td_applicationPurpleColor];
    
    [self.pageControl addTarget:self action:@selector(pageControlValueDidChange) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - Action

- (void)pageControlValueDidChange {
    NSLog(@"The page control changed its current page to %ld.", (long)self.pageControl.currentPage);
    self.colorView.backgroundColor = self.colors[self.pageControl.currentPage];
}



@end
