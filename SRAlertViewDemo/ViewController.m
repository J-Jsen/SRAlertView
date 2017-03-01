//
//  ViewController.m
//  SRAlertViewDemo
//
//  Created by 郭伟林 on 16/8/7.
//  Copyright © 2016年 SR. All rights reserved.
//

#import "ViewController.h"
#import "SRAlertView.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, SRAlertViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"SRAlertView";
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.dataSource = self;
    _tableView.delegate   = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"defaultCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"AnimationNone";
            break;
        case 1:
            cell.textLabel.text = @"AnimationZoom";
            break;
        case 2:
            cell.textLabel.text = @"AnimationTopToCenter";
            break;
        case 3:
            cell.textLabel.text = @"AnimationDownToCenter";
            break;
        case 4:
            cell.textLabel.text = @"AnimationLeftToCenter";
            break;
        case 5:
            cell.textLabel.text = @"AnimationRightToCenter";
            break;
        case 6:
            cell.textLabel.text = @"LongMessage";
            break;
        case 7:
            cell.textLabel.text = @"DontBlurBackgroundView";
            break;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    switch (indexPath.row) {
        case 0:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationNone"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:nil
                                    animationStyle:AlertViewAnimationNone
                                      selectAction:^(AlertViewActionType actionType) {
                                          NSLog(@"%zd", actionType);
                                      }];
        }
            break;
        case 1:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationZoom"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationZoom
                                      selectAction:^(AlertViewActionType actionType) {
                                          NSLog(@"%zd", actionType);
                                      }];
        }
            break;
        case 2:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationTopToCenterSpring"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationTopToCenterSpring
                                      selectAction:^(AlertViewActionType actionType) {
                                          NSLog(@"%zd", actionType);
                                      }];
        }
            break;
        case 3:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationDownToCenterSpring"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationDownToCenterSpring
                                          delegate:self];
        }
            break;
        case 4:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationLeftToCenterSpring"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationLeftToCenterSpring
                                          delegate:self];
        }
            break;
        case 5:
        {
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:@"SRAnimationRightToCenterSpring"
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationRightToCenterSpring
                                          delegate:self];
        }
            break;
        case 6:
        {
            NSString *message = @"LongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessageLongMessage";
            [SRAlertView sr_showAlertViewWithTitle:@"SRAlertView"
                                           message:message
                                   leftActionTitle:@"Sure"
                                  rightActionTitle:@"Cancel"
                                    animationStyle:AlertViewAnimationZoom
                                          delegate:self];
        }
            break;
        case 7:
        {
            SRAlertView *alertView = [[SRAlertView alloc] initWithTitle:@"SRAlertView"
                                                                message:@"DontBlurBackgroundView"
                                                        leftActionTitle:@"Sure"
                                                       rightActionTitle:@"Cancel"
                                                         animationStyle:AlertViewAnimationZoom
                                                          delegate:self];
            alertView.blurCurrentBackgroundView = NO;
            [alertView show];
        }
            break;
    }
}

- (void)alertViewDidSelectAction:(AlertViewActionType)actionType {
    
    NSLog(@"%zd", actionType);
}

@end
