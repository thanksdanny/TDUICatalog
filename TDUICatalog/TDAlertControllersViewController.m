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

// Maintains a reference to the alert action that should be toggled when the text field changes (for the secure text entry alert).
@property (nonatomic, weak) UIAlertAction *secureTextAlertAction;

@end


#pragma mark -

@implementation TDAlertControllersViewController

#pragma mark - UIAlertControllerStyleAlert Style Alerts

- (void)showSimpleAlert {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A message should be a short, complete sentence.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"OK", nil);
    
    // Create the AlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Creat the action
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The simple alert's cancel action occured.");
    }];
    
    // Add the action
    [alertController addAction:cancelAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)showOkayCancelAlert {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A Message should be a short, complete sentnce.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    // Create the AlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showOther {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A Message should be a short, complete sentnce.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitleOne = NSLocalizedString(@"Choice One", nil);
    NSString *otherButtonTitleTwo = NSLocalizedString(@"Choice Two", nil);
    
    // Create the AlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Other\" alert's cancel action occured.");
    }];
    
    UIAlertAction *otherButtonOneAction = [UIAlertAction actionWithTitle:otherButtonTitleOne style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Other\" alert's other button one action occured.");
    }];
    
    UIAlertAction *otherButtonTwoAction = [UIAlertAction actionWithTitle:otherButtonTitleTwo style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Other\" alert's other button one action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherButtonOneAction];
    [alertController addAction:otherButtonTwoAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showTextEntry {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A Message should be a short, complete sentnce.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    // Create the AlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Add the text field for text entry
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // If you need to customize the text field, you can do so here.
    }];
    
    // Create the action.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Text Entry\" alert's cancel action occured.");
    }];
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Text Entry\" alert's other action occured.");
    }];
    
    // Add the action
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showSecureTextEntryAlert {
    NSString *title = NSLocalizedString(@"A Short Title Is Best", nil);
    NSString *message = NSLocalizedString(@"A Message should be a short, complete sentnce.", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"OK", nil);
    
    // Create the AlertController
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // Add the text field for the secure text entry
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        /*
         Listen for changes to the text field's text so that we can toggle the current
         action's enabled property based on whether the user has entered a sufficiently
         secure entry.
         */
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        textField.secureTextEntry = YES;
    }];
    
    // Create the actions
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Secure Text Entry\" alert's cancel action occured.");
        
        // Stop listening for text changed notiicaitons
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Secure Text Entry\" alert's other action occured.");
        
        // Stop listening for text changed notifications.
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
    }];
    
    // The text field initially has no text in the text field, so we'll disable it.
    otherAction.enabled = NO;
    
    // Hold onto the secure text alert action to toggle the enabled/disabled state when the text changed.
    self.secureTextAlertAction = otherAction;
    
    // Add the actions
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark - UIAlertControllerActionSheet Style Alerts
- (void)showOkayCancelActionSheet:(NSIndexPath *)selectedPath {
    NSString *cancelButtonTitle = NSLocalizedString(@"Cancel", nil);
    NSString *destructiveButtonTitle = NSLocalizedString(@"OK", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Okay/Cancel\" alert action sheet's cancel action occured.");
    }];
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Okay/Cancel\" alert action sheet's destructive action occured.");
    }];
    
    // Add the actions
    [alertController addAction:cancelAction];
    [alertController addAction:destructiveAction];
    
    // Configure the alert controller's popover presentation controller if it has one.
    UIPopoverPresentationController *popoverPresentationController = [alertController popoverPresentationController];
    if (popoverPresentationController) {
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:selectedPath];
        popoverPresentationController.sourceRect = selectedCell.frame;
        popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    }
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showOtherActionSheet:(NSIndexPath *)selectPath {
    NSString *destructiveButtonTitle = NSLocalizedString(@"Destructive Choice", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"Safe Choice", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    // Create the actions
    UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:destructiveButtonTitle style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Other\" alert action sheet's destructive action occured.");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"The \"Other\" alert action sheet's other action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:destructiveAction];
    [alertController addAction:otherAction];
    
    // Configure the alert controller's popover presentation controller if it has one.
    // 貌似这配置注释掉也没啥问题出现..研究下
    UIPopoverPresentationController *popoverPresentationController = [alertController popoverPresentationController];
    if (popoverPresentationController) {
        UITableViewCell *selectedCell = [self.tableView cellForRowAtIndexPath:selectPath];
        popoverPresentationController.sourceRect = selectedCell.frame;
        popoverPresentationController.sourceView = self.view;
        popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionUp;
    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - UITextFiledTextDidChangeNotification
// 之前就说为啥没有5个字符限制的效果，原来是忘了写这方法...fuck
- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
    UITextField *textField = notification.object;
    
    // Enforce a minimum length of >= 5 characters for secure text alerts
    self.secureTextAlertAction.enabled = textField.text.length >= 5;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TDAlertControllerSection section = indexPath.section;
    
    if (TDAlertControllerSectionAlert == section) {
        TDAlertControllerAlertRow row = indexPath.row;
        
        switch (row) {
            case TDAlertControllerAlertRowSimple:
                [self showSimpleAlert];
                break;
            case TDAlertControllerAlertRowOkayCancel:
                [self showOkayCancelAlert];
                break;
            case TDAlertControllerAlertRowOther:
                [self showOther];
                break;
            case TDAlertControllerAlertRowTextEntry:
                [self showTextEntry];
                break;
            case TDAlertControllerAlertRowTextEntrySecure:
                [self showSecureTextEntryAlert];
                break;
            default:
                break;
        }
    }
    
    else if (TDAlertControllerSectionActionSheet == section) {
        TDAlertControllerActionSheetRow row = indexPath.row;
        
        switch (row) {
            case TDAlertControllerActionSheetRowOkayCancel:
                [self showOkayCancelActionSheet:indexPath];
                break;
            case TDAlertControllerActionSheetRowOther:
                [self showOtherActionSheet:indexPath];
                break;
            default:
                break;
        }
    }
   
    // 这行什么用..貌似注释掉也一样
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
