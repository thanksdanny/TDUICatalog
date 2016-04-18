//
//  TDAlertControllersViewController.m
//  TDUICatalog
//
//  Created by Danny Ho on 4/18/16.
//  Copyright © 2016 thanksdanny. All rights reserved.
//

#import "TDAlertControllersViewController.h"

// Corresponds to the section index of the table view (whether we want to show an alert or action sheet style).
typedef NS_ENUM(NSInteger, TDAlertControllerSection) {
    TDAlertControllerSectionAlert = 0,
    TDAlertControllerSectionActionSheet
};

// Corresponds to the row in the alert style section.
typedef NS_ENUM(NSInteger, TDAlertControllerAlertRow) {
    TDAlertControllerAlertRowSimple = 0,
    TDAlertControllerAlertRowOkayCancel,
    TDAlertControllerAlertRowOther,
    TDAlertControllerAlertRowTextEntry,
    TDAlertControllerAlertRowTextEntrySecure
};

// Corresponds to the row in the action sheet style section.
typedef NS_ENUM(NSInteger, TDAlertControllerActionSheetRow) {
    TDAlertControllerActionSheetRowOkayCancel = 0,
    TDAlertControllerActionSheetRowOther
};


@interface TDAlertControllersViewController () <UITextFieldDelegate>

@end


#pragma mark -

@implementation TDAlertControllersViewController

#pragma mark - UIAlertControllerStyleAlert Style Alerts

- (void)showSimpleAlert {
    
}

- (void)showOkayCancel {
    
}

- (void)showOther {
    
}

- (void)showTextEntry {
    
}

- (void)showTextEntrySecure {
    
}


#pragma mark - UIAlertControllerActionSheet Style Alerts
- (void)showOkayCancelActionSheet:(NSIndexPath *)selectPath {
    
}

- (void)showOtherActionSheet:(NSIndexPath *)selectPath {
    
}

#pragma mark - UITextFiledTextDidChangeNotification
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
