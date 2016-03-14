//
//  LoginViewController.m
//  DynamicSChool
//
//  Created by 小屁孩 on 15/8/21.
//  Copyright (c) 2015年 XS. All rights reserved.
//

#import "LoginViewController.h"
#import "UIViewController+Reminder.h"
#import "BaseNetWorking.h"
#import "AppDelegate.h"
#import "OwnInfoSingleton.h"
#import "BusinessManage.h"

@interface LoginViewController ()<UIScrollViewDelegate>
{
    UITextField *selectTextField;
}
@property (weak, nonatomic) IBOutlet UIView *userNameTextFieldView;

@property (weak, nonatomic) IBOutlet UIView *pwdTextFieldView;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults boolForKey:@"FRIST_USE"]) {
        [defaults setBool:YES forKey:@"FRIST_USE"];
        
        [self addGuideView];
        
    }

    _headImageView.layer.cornerRadius = 45.0;
    _headImageView.layer.masksToBounds = YES;
    _userNameTextFieldView.layer.cornerRadius = 5.0;
    _userNameTextFieldView.layer.borderWidth = 1.0;
    _userNameTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _pwdTextFieldView.layer.cornerRadius = 5.0;
    _pwdTextFieldView.layer.borderWidth = 1.0;
    _pwdTextFieldView.layer.borderColor = [UIColor colorWithRed:164/255.0 green:164/255.0 blue:164/255.0 alpha:1].CGColor;
    _loginButton.layer.cornerRadius = 5.0;
    // Do any additional setup after loading the view.
    
    _userNameTextField.delegate = self;
    _pwdTextfield.delegate = self;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"USER_INFO_ID"]!=nil){
        _userNameTextField.text = [defaults objectForKey:@"USER_INFO_ID"];
        _pwdTextfield.text = [defaults objectForKey:@"USER_INFO_PWD"];
    }
}



-(void)addGuideView
{
    self.navigationController.navigationBarHidden = YES;
    NSArray *indexArray = @[@"引导图_1",@"引导图_2",@"引导图_3",@"引导图_4",@"引导图_5"];
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView.contentSize = CGSizeMake(size.width *5, size.height);
    scrollView.pagingEnabled = YES;
//    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.tag = 666;
    [self.view addSubview:scrollView];
    
    UIPageControl *pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake((size.width-100)/2, size.height-50, 100, 50)];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    pageControl.tag = 555;
    
    for (int i = 0; i< 5; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*size.width, 0, size.width, size.height)];
        imageView.image = [UIImage imageNamed:[indexArray objectAtIndex:i]];
        [scrollView addSubview:imageView];
        if(i == 4){
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(i*size.width+size.width/2-100 , size.height*2/3, 200, 100)];
//            button.backgroundColor = [UIColor redColor];
            [button addTarget:self action:@selector(insertClick) forControlEvents:UIControlEventTouchUpInside];
            [scrollView addSubview:button];
        }
    }
    
    [self.view addSubview:pageControl];
}


-(void)insertClick
{
    [UIView animateWithDuration:0.5 animations:^{
        UIScrollView *scrollView = (UIScrollView *)[self.view viewWithTag:666];
        scrollView.alpha = 0.0;
        UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:555];
        pageControl.alpha = 0.0;
        self.navigationController.navigationBarHidden = NO;
    }];
}
#pragma mark -UITextField Delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    selectTextField = textField;
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



- (IBAction)finishClick:(id)sender {
    if (_userNameTextField.text.length == 0||_pwdTextfield.text.length == 0) {
        [self showAnimationTitle:@"信息不完整"];
    }else
    {
        NSMutableDictionary *dic = [NSMutableDictionary new];
        if (_userNameTextField.text.length == 11) {
            [dic setObject:_userNameTextField.text forKey:@"MOBILE"];
            [dic setObject:@"1" forKey:@"TYPE"];
        }else if (_userNameTextField.text.length ==18)
        {
            [dic setObject:_userNameTextField.text forKey:@"IDCARD"];
            [dic setObject:[NSNumber numberWithInteger:0] forKey:@"TYPE"];
        }else{
            [self showAnimationTitle:@"用户名为手机号或身份证号"];
            return;
        }
        [dic setObject:_pwdTextfield.text forKey:@"PASSWORD"];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginNotification:) name:@"userLogin" object:nil];
        BaseNetWorking *baseNetWorking = [[BaseNetWorking alloc]init];
        [baseNetWorking webserviceRequestWithMetch:@"userLogin" JSONparamenter:dic];
        [self starNetWorking];
    }
    
}

#pragma mark - 自定义方法

// 键盘通知
- (void)keyboardWillShowNotification:(NSNotification *)info
{
    NSDictionary *userInfo = [info userInfo];
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    UIView *surper = [selectTextField superview];
    CGFloat x=(surper.frame.origin.y + surper.frame.size.height)-(self.view.frame.size.height-kbSize.height);
    NSLog(@"%f,%f",(surper.frame.origin.y + surper.frame.size.height),(self.view.frame.size.height-kbSize.height));
    if (x>0) {
        CGRect frame = self.view.frame;
        frame.origin.y = frame.origin.y -x;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
        }];
        self.view.tag = 1;
    }
}
- (void)keyboardWillHideNotification:(NSNotification *)info
{
    if (self.view.tag == 1) {
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        [UIView animateWithDuration:0.5 animations:^{
            self.view.frame = frame;
        }];
    }
}

//网络通知事件
- (void)userLoginNotification:(NSNotification *)notification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"userLogin" object:nil];
    NSLog(@"%@",[notification.object class]);
    if([notification.object isKindOfClass:[NSString class]])
    {
        NSString *stat = notification.object;
        [self stopNetWorking];
        if (stat == nil) {
            [self showAnimationTitle:@"网络连接失败"];
        }
        else if ([stat isEqualToString:@"0"]) {
            [self showAnimationTitle:@"账户不存在,请先注册"];
        }else if ([stat isEqualToString:@"2"]){
            [self showAnimationTitle:@"密码错误"];
        }
    }else if ([notification.object isKindOfClass:[NSArray class]]){
        NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
        [defaults setObject:_userNameTextField.text forKey:@"USER_INFO_ACCOUNT"];
        [defaults setObject:_pwdTextfield.text forKey:@"USER_INFO_PWD"];
        NSDictionary *dic = [notification.object objectAtIndex:0];
        [self setUserInfoWithDictionary:dic];
//        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        appDelegate.window.rootViewController = [storyboard instantiateViewControllerWithIdentifier:@"TabBarController"];
        [appDelegate.window makeKeyAndVisible];

        NSString *string = [defaults objectForKey:@"USER_INFO_ACCOUNT"];
        [BusinessManage judgePower:string];
    }
    
    
}




//设置个人信息
-(void)setUserInfoWithDictionary:(NSDictionary *)dic
{
    NSUserDefaults *defaults =[NSUserDefaults standardUserDefaults];
    [defaults setObject:[dic objectForKey:@"ID"] forKey:@"USER_INFO_ID"];
    //        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *string =[[dic objectForKey:@"USERNAME"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"USERNAME"];
    [defaults setObject:string forKey:@"USER_INFO_USERNAME"];
    
    string =[[dic objectForKey:@"IDCARD"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"IDCARD"];
    [defaults setObject:string forKey:@"USER_INFO_IDCARD"];
    
    string =[[dic objectForKey:@"SEX"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"SEX"];
    [defaults setObject:string forKey:@"USER_INFO_SEX"];
    
    string =[[dic objectForKey:@"REALNAME"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"REALNAME"];
    [defaults setObject:string forKey:@"USER_INFO_REALNAME"];
    
    string =[[dic objectForKey:@"MOBILE"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"MOBILE"];
    [defaults setObject:string forKey:@"USER_INFO_MOBILE"];
    
    string =[[dic objectForKey:@"SHORTMOBILE"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"SHORTMOBILE"];
    [defaults setObject:string forKey:@"USER_INFO_SHORTMOBILE"];
    
    string =[[dic objectForKey:@"IMGPATH"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"IMGPATH"];
    [defaults setObject:string forKey:@"USER_INFO_IMGPATH"];
    
    string =[[dic objectForKey:@"NICKNAME"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"NICKNAME"];
    [defaults setObject:string forKey:@"USER_INFO_NICKNAME"];
    
    string =[[dic objectForKey:@"THEME"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"THEME"];
    [defaults setObject:string forKey:@"USER_INFO_THEME"];
    
    string =[[dic objectForKey:@"POINTS"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"POINTS"];
    [defaults setObject:string forKey:@"USER_INFO_POINTS"];
    
    string =[[dic objectForKey:@"PERSONALITY"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"PERSONALITY"];
    [defaults setObject:string forKey:@"USER_INFO_PERSONALITY"];
    
    string =[[dic objectForKey:@"PROFESSIONAL"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"PROFESSIONAL"];
    [defaults setObject:string  forKey:@"USER_INFO_PROFESSIONAL"];
    
    string =[[dic objectForKey:@"CLASSNAME"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"CLASSNAME"];
    [defaults setObject:string forKey:@"USER_INFO_CLASSNAME"];
    
    string =[[dic objectForKey:@"NOTICETYPE"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"NOTICETYPE"];
    [defaults setObject:string forKey:@"USER_INFO_NOTICETYPE"];
    
    string =[[dic objectForKey:@"COLLEGE"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"COLLEGE"];
    [defaults setObject:string forKey:@"USER_INFO_COLLEGE"];
    
//    string =[[dic objectForKey:@"CREATE_DATE67777"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"CREATE_DATE"];
//    [defaults setObject:string forKey:@"USER_INFO_CREATEDATE"];
    
    NSLog(@"%@",[[dic objectForKey:@"SCHOOL"] class]);
    string =[[dic objectForKey:@"SCHOOL"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"SCHOOL"];
    [defaults setObject:string forKey:@"USER_INFO_SCHOOL"];
    
    string =[[dic objectForKey:@"SCHOOLID"] isKindOfClass:[NSNull class]]? @"":[dic objectForKey:@"SCHOOLID"];
    [defaults setObject:string forKey:@"USER_INFO_SCHOOLID"];
}

#pragma mark - UIScrollerView Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    UIPageControl *pageControl = (UIPageControl *)[self.view viewWithTag:555];
    pageControl.currentPage = scrollView.contentOffset.x/size.width;
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"滑动");
}

@end
