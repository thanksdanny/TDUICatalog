//
//  TDProgressViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/26/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDProgressViewController.h"
#import "UIColor+TDApplicationSpecific.h"

/*!
 The KVO context for `ProgressViewController` instances. This provides a stable
 address to use as the `context` parameter for KVO observation methods.
 */
static void *TDProgressViewControllerContext = &TDProgressViewControllerContext;

@interface TDProgressViewController ()

@property (weak, nonatomic) IBOutlet UIProgressView *defaultStyleProgressview;
@property (weak, nonatomic) IBOutlet UIProgressView *barStyleProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *tintedProgressView;
@property (weak, nonatomic) IBOutletCollection(UIProgressView) NSArray *progressViews;

/*!
 An `NSProgress` object who's `fractionCompleted` is observed using KVO to
 update the `UIProgressView`s' `progress` properties.
 */
@property (nonatomic, strong) NSProgress *progress;

/*!
 A repeating timer that, when fired, updates the `NSProgress` object's
 `completedUnitCount` property.
 */
@property (nonatomic, strong) NSTimer *updateTimer;

@end

#pragma mark - 

@implementation TDProgressViewController

#pragma mark - Initialization

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self != nil) {
        self.progress = [NSProgress progressWithTotalUnitCount:10];
        [self.progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:TDProgressViewControllerContext];
    }
    return self;
}

- (void)dealloc {
    [self.progress removeObserver:self forKeyPath:@"fractionCompleted"];
}

#pragma mark - Configuration

- (void)configureDefaultStyleProgressView {
    self.defaultStyleProgressview.progressViewStyle = UIProgressViewStyleDefault;
}

- (void)configureBarStyleProgressView {
    self.barStyleProgressView.progressViewStyle = UIProgressViewStyleBar;
}

- (void)configureTintedStyleProgressView {
    self.tintedProgressView.progressViewStyle = UIProgressViewStyleDefault;
    
    self.tintedProgressView.trackTintColor = [UIColor td_applicationBlueColor];
    self.tintedProgressView.progressTintColor = [UIColor td_applicationPurpleColor];
}

#pragma mark - UIViewCongroller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureDefaultStyleProgressView];
    [self configureBarStyleProgressView];
    [self configureTintedStyleProgressView];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Reset the completed progress of the `UIProgressView`s.
    for (UIProgressView *progressView in self.progressViews) {
        [progressView setProgress:self.progress.fractionCompleted animated:YES];
    }
    
    /*
     Reset the `completedUnitCount` of the `NSProgress` object and create
     a repeating timer to increment it over time.
     */
    self.progress.completedUnitCount = 0;
    self.updateTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerDidFire) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    // Stop the timer from firing.
    [self.updateTimer invalidate];
}

#pragma mark - Key Value Observing (KVO)
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    // Check if this is KVO notification for our `NSProgress` object
    if (context == TDProgressViewControllerContext && object == self.progress && [keyPath isEqualToString:@"fractionCompleted"]) {
        // Update the progress views.
        for (UIProgressView *progressView in self.progressViews) {
            [progressView setProgress:self.progress.fractionCompleted animated:YES];
        }
    } else {
        [self.updateTimer invalidate];
    }
}

#pragma mark - Convenience 

- (void)timerDidFire {
    /*
     Update the `completedUnitCount` of the `NSProgress` object if it's
     not completed. Otherwise, stop the timer.
     */
    if (self.progress.completedUnitCount < self.progress.totalUnitCount) {
        self.progress.completedUnitCount += 1;
    } else {
        [self.updateTimer invalidate];
    }
}


@end
