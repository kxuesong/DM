//
//  H5ViewController.m
//  DM
//
//  Created by tepusoft on 16/1/3.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "H5ViewController.h"

@interface H5ViewController ()<UIWebViewDelegate>

@end

@implementation H5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.delegate = self;
    NSString *urlString ;
    if (_enterType == EnterTypeFraction) {
        urlString = [NSString stringWithFormat:@"http://210.44.64.48%@",@"/dm/f/mobile/shop/shop_index.html"];
    }else{
        urlString = [NSString stringWithFormat:@"http://210.44.64.48%@",_urlString];
    }
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [[NSURLRequest alloc]initWithURL:url];
    [self.webView  loadRequest:request];
    // Do any additional setup after loading the view.
}


#pragma mark - UIWebViewDelegate 
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
