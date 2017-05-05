//
//  LoginViewController.m
//  First App
//
//  Created by luthertsai on 2017/5/3.
//  Copyright © 2017年 luthertsai. All rights reserved.
//

#import "LoginViewController.h"
#import "Global.h"

#define BACKGROUND_COLOR_01 [UIColor colorWithRed:251/255.0 green:77/255.0 blue:158/255.0 alpha:0.99]
#define BACKGROUND_COLOR_02 [UIColor colorWithRed:248/255.0 green:132/255.0 blue:181/255.0 alpha:1]
#define BACKGROUND_COLOR_03 [UIColor colorWithRed:236/255.0 green:55/255.0 blue:133/255.0 alpha:0.99]
#define BACKGROUND_COLOR_04 [UIColor colorWithRed:236/255.0 green:54/255.0 blue:133/255.0 alpha:0.99]
#define TEXTFIELD_BACKGROUND [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.1]

@interface LoginViewController ()

@end

@implementation LoginViewController
{
    UIButton *_fbLoginButton;
    UIButton *_pixnetLoginButton;
    UIButton *_checkButton;
    UILabel *_legalInfoLabel;
    UILabel *_infoLabel;
    UILabel *_seperateLabel;
    UIView *_seperateLine01;
    UIView *_seperateLine02;
    UIView *_seperateLine03;
    UIView *_textFieldFrame;
    JVFloatLabeledTextView *_userIDInput;
    UITextField *_userPasswordInput;
}
    
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Set up background of Login View
    CAGradientLayer *gradient = [CAGradientLayer layer];
    
    gradient.frame = self.view.bounds;
    gradient.colors = @[(id)BACKGROUND_COLOR_01.CGColor, (id)BACKGROUND_COLOR_02.CGColor, (id)BACKGROUND_COLOR_03.CGColor, (id)BACKGROUND_COLOR_04.CGColor];
    
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    //Add Login Page Info Label
    UILabel *infoLabel = [UILabel new];
    infoLabel.numberOfLines = 2;
    infoLabel.minimumScaleFactor = 0.2;
    infoLabel.adjustsFontSizeToFitWidth = YES;
    [infoLabel setFont:[UIFont systemFontOfSize:15]];
    infoLabel.textAlignment = NSTextAlignmentCenter;
    infoLabel.text = @"請登入你的 PIXstyleMe 帳號或痞客邦帳號，\n完整體驗 搜Beauty 的貼心服務！";
    infoLabel.textColor = [UIColor whiteColor];
    _infoLabel = infoLabel;
    
    //Add Legal Page Info Label
    UILabel *legalInfoLabel = [UILabel new];
    legalInfoLabel.numberOfLines = 1;
    legalInfoLabel.minimumScaleFactor = 0.2;
    [legalInfoLabel setFont:[UIFont systemFontOfSize:12]];
    legalInfoLabel.textAlignment = NSTextAlignmentLeft;
    legalInfoLabel.text = @"我已經閱讀並同意 PIXstyleMe 使用條款";
    legalInfoLabel.textColor = [UIColor whiteColor];
    _legalInfoLabel = legalInfoLabel;
    
    //Add Check Button
    UIButton *checkButton = [UIButton new];
    [checkButton setImage:[UIImage imageNamed:@"btnCheckbox.png"] forState:UIControlStateNormal];
    [checkButton setImage:[UIImage imageNamed:@"btnCheckboxSelected.png"] forState:UIControlStateSelected];
    _checkButton = checkButton;
    
    // Handle clicks on the button
    [_checkButton addTarget:self action:@selector(checkBoxBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    // Add a custom login button to your app
    UIButton *fbLoginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fbLoginButton.backgroundColor=[UIColor whiteColor];
    fbLoginButton.layer.cornerRadius = 3.0;
    [fbLoginButton setTitle: @"使用facebook帳號登入" forState: UIControlStateNormal];
    [fbLoginButton setTitleColor:COLOR_MEDIUM_PINK_TWO forState:UIControlStateNormal];
    [fbLoginButton setImage:[UIImage imageNamed:@"fbiconPink.png"] forState:UIControlStateNormal];
    fbLoginButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    fbLoginButton.titleLabel.minimumScaleFactor = 0.2;
    [fbLoginButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    fbLoginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    fbLoginButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    _fbLoginButton = fbLoginButton;
    
    // 设置isCollectedPersonLbl的Image的约束
    _fbLoginButton.imageView.sd_layout
    .widthIs(30)
    .heightEqualToWidth()
    .leftSpaceToView(_fbLoginButton, 44)
    .centerYEqualToView(_fbLoginButton);
    
    // 设置isCollectedPersonLbl的Label的约束
    _fbLoginButton.titleLabel.sd_layout
    .widthIs(167)
    .heightIs(22)
    .leftSpaceToView(_fbLoginButton.imageView, 0)
    .centerYEqualToView(_fbLoginButton);

    // Handle clicks on the button
    [_fbLoginButton addTarget:self action:@selector(fbLoginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    if ([FBSDKAccessToken currentAccessToken]) {
        //NSLog(@"%@", [FBSDKAccessToken currentAccessToken].tokenString);
        //[_fbLoginButton setTitle: @"從Facebook登出" forState: UIControlStateNormal];
    }
    
    //Add Seperate Label
    UILabel *seperateLabel = [UILabel new];
    seperateLabel.numberOfLines = 2;
    seperateLabel.minimumScaleFactor = 0.2;
    seperateLabel.adjustsFontSizeToFitWidth = YES;
    [seperateLabel setFont:[UIFont systemFontOfSize:16]];
    seperateLabel.textAlignment = NSTextAlignmentCenter;
    seperateLabel.text = @"or";
    seperateLabel.textColor = [UIColor whiteColor];
    _seperateLabel = seperateLabel;
    
    //Add Seperate Line
    UIView *lineView01 = [UIView new];
    lineView01.backgroundColor = [UIColor whiteColor];
    _seperateLine01 = lineView01;
    
    UIView *lineView02 = [UIView new];
    lineView02.backgroundColor = [UIColor whiteColor];
    _seperateLine02 = lineView02;
    
    //Add TextField Frame
    UILabel *textFieldFrame = [UILabel new];
    textFieldFrame.backgroundColor = TEXTFIELD_BACKGROUND;
    textFieldFrame.layer.borderWidth = 1.0f;
    textFieldFrame.layer.borderColor = [UIColor whiteColor].CGColor;
    textFieldFrame.layer.cornerRadius = 3.0f;
    _textFieldFrame = textFieldFrame;
    
    UIView *lineView03 = [UIView new];
    lineView03.backgroundColor = [UIColor whiteColor];
    _seperateLine03 = lineView03;
    
    JVFloatLabeledTextView *userIDInput = [JVFloatLabeledTextView new];
    //NSAttributedString *userIDInputPlaceholder = [[NSAttributedString alloc] initWithString:@"使用者名稱/信箱" attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    //userIDInput.attributedPlaceholder = userIDInputPlaceholder;
    userIDInput.placeholder = @"使用者名稱/信箱";
    userIDInput.keyboardType = UIKeyboardTypeASCIICapable;
    userIDInput.autocorrectionType = UITextAutocorrectionTypeNo;
    userIDInput.contentScaleFactor = 0.2;
    //userIDInput.adjustsFontSizeToFitWidth = YES;
    [userIDInput setFont:[UIFont systemFontOfSize:16]];
    userIDInput.textColor = [UIColor whiteColor];
    userIDInput.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    _userIDInput = userIDInput;
    _userIDInput.delegate = self;

    
    UITextField *userPasswordInput = [UITextField new];
    NSAttributedString *userPasswordInputPlaceholder = [[NSAttributedString alloc] initWithString:@"密碼" attributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    userPasswordInput.attributedPlaceholder = userPasswordInputPlaceholder;
    userPasswordInput.keyboardType = UIKeyboardTypeASCIICapable;
    userPasswordInput.secureTextEntry = YES;
    userPasswordInput.contentScaleFactor = 0.2;
    userPasswordInput.adjustsFontSizeToFitWidth = YES;
    [userPasswordInput setFont:[UIFont systemFontOfSize:16]];
    userPasswordInput.textColor = [UIColor whiteColor];
    _userPasswordInput = userPasswordInput;
    _userPasswordInput.delegate = self;
    
    
    // Add a custom login button to your app
    UIButton *pixnetLoginButton = [UIButton new];
    pixnetLoginButton.backgroundColor=[UIColor whiteColor];
    pixnetLoginButton.layer.cornerRadius = 3.0;
    [pixnetLoginButton setTitle: @"登入" forState: UIControlStateNormal];
    [pixnetLoginButton setTitleColor:COLOR_MEDIUM_PINK_TWO forState:UIControlStateNormal];
    pixnetLoginButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    pixnetLoginButton.titleLabel.minimumScaleFactor = 0.2;
    [pixnetLoginButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    pixnetLoginButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    _pixnetLoginButton = pixnetLoginButton;

    
    [self.view sd_addSubviews:@[_seperateLabel, _fbLoginButton, _infoLabel, _checkButton, _legalInfoLabel, _seperateLine01, _seperateLine02, _textFieldFrame, _seperateLine03, _userIDInput, _userPasswordInput, _pixnetLoginButton]];
    
    _infoLabel.sd_layout
    .widthIs(295)
    .heightIs(36)
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view, 46);
    
    _seperateLabel.sd_layout
    .widthIs(36)
    .heightIs(22)
    .centerXEqualToView(self.view)
    .topSpaceToView(_infoLabel, 127);
    
    _fbLoginButton.sd_layout
    .widthIs(301)
    .heightIs(35)
    .centerXEqualToView(self.view)
    .bottomSpaceToView(_seperateLabel, 18);
    
    _checkButton.sd_layout
    .widthIs(24)
    .heightIs(24)
    .leftEqualToView(_fbLoginButton)
    .bottomSpaceToView(_fbLoginButton, 7);
    
    _legalInfoLabel.sd_layout
    .widthIs(232)
    .heightIs(17)
    .leftSpaceToView(_checkButton, 9)
    .centerYEqualToView(_checkButton);
    
    _seperateLine01.sd_layout
    .widthIs(130)
    .heightIs(2)
    .centerYEqualToView(_seperateLabel)
    .leftEqualToView(_fbLoginButton);
    
    _seperateLine02.sd_layout
    .widthIs(130)
    .heightIs(2)
    .centerYEqualToView(_seperateLabel)
    .rightEqualToView(_fbLoginButton);
    
    _textFieldFrame.sd_layout
    .widthRatioToView(_fbLoginButton, 1.0)
    .heightIs(104)
    .topSpaceToView(_seperateLabel, 18)
    .centerXEqualToView(self.view);
    
    _seperateLine03.sd_layout
    .widthRatioToView(_textFieldFrame, 0.89)
    .heightIs(2)
    .centerYEqualToView(_textFieldFrame)
    .centerXEqualToView(_textFieldFrame);
    
    _userIDInput.sd_layout
    .widthRatioToView(_textFieldFrame, 0.89)
    .heightIs(40)
    .leftEqualToView(_seperateLine03)
    .bottomSpaceToView(_seperateLine03, 5);
    
    _userPasswordInput.sd_layout
    .widthRatioToView(_textFieldFrame, 0.89)
    .heightIs(50)
    .leftEqualToView(_seperateLine03)
    .topSpaceToView(_seperateLine03, 1);
    
    _pixnetLoginButton.sd_layout
    .widthRatioToView(_textFieldFrame, 1.0)
    .heightIs(36)
    .leftEqualToView(_textFieldFrame)
    .topSpaceToView(_textFieldFrame, 12);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    
- (void)checkBoxBtnClicked:(UIButton *)sender {
    [sender setSelected:!sender.selected];
}
    
// Once the button is clicked, show the login dialog
-(void)fbLoginButtonClicked {
        FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
        [login
         logInWithReadPermissions: @[@"public_profile", @"email", @"user_friends"]
         fromViewController:self
         handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
             if (error) {
                 NSLog(@"Process error");
             } else if (result.isCancelled) {
                 NSLog(@"Cancelled");
             } else {
                 NSLog(@"Logged in");
                 [_fbLoginButton setTitle: @"從Facebook登出" forState: UIControlStateNormal];
                 [[self navigationController] popViewControllerAnimated:YES];
             }
         }];
}
    
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

@end
