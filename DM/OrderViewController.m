//
//  OrderViewController.m
//  DM
//
//  Created by tepusoft on 16/1/11.
//  Copyright © 2016年 tepusoft. All rights reserved.
//

#import "OrderViewController.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>

@interface OrderViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderIDLabel;
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)payButtonClick:(id)sender {
    NSString *partner = @"2088021821771551";
    NSString *seller = @"1797787631@qq.com";
    NSString *privateKey = @"MIICXAIBAAKBgQClkt8kYcn4yLY6ECfsSKGdRmklfqTGXBHxdjh/CL6vvQgMMzQXhTCvBIw0UJvTE86U6m2DFwzNM+h3HrwJ+KKICiujXOd9eieP+Sm0gs+EtZeqWThda7Ni8dPk/ikaKeBAkKbdkAT57vZqnD2i9p99xjjkdyyUsDf7LdGX97nbmQIDAQABAoGASogjtF/kp/3JsbdmEUHcpkx0tnEcwUHevd/mrKCGHduszLkb4N6OvKoCZuZGTqzi2Dvy0gjFNXYBVeXa5W4r0vG3pWDUXjHfBWZ83rQXYmFTnVpg5LpQr+/7VL7hrM2djQHPwWtMWXSvR+aF1Qct3Ux+JwZ0xPd6ReX1JANjw4ECQQDUWzKdNkEWdhlT9tNq+6YnhChjgq+1tZQ9wKAtzo11R9uqzLIOuw7S81Rd5qI4yYH/5owVAoyA3a3DFzKu36upAkEAx5pIQTEBd0kYQPyU17vLHF9p/fxtO+bTpw5yRjx5vgHq+2sVxpLCyuvnXBkQyVWwSw9iQxUh6YELggtvyeQmcQJAOIhazh2OcFNaZM7186owzp5RPkShUGeZomLwgaFWaV2K7kp2MJO924zp7eGjWCjVEfInYsR98SSSyLgZRxLGmQJBAJ2Wg4FkzYF+JjX4tRL2Y0/NTQOH7j4i6eu1DifBy2RmYz2IuDKE4GIRiiI+b/BlRMCeLrhD0PhoN8u+d83v4SECQFplc7ZluOTiwAKo5SUsjfLWP5uQqoNhWdTAOqts9s0xL44ExF1m70DD7HWMWmszhSbOwucKOXrgDWlk4FhhRrU=";
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [self generateTradeNO]; //订单ID（由商家?自?行制定）
    order.productName = @"商品标题"; //商品标题
    order.productDescription = @"商品描述"; //商品描述
    order.amount = [NSString stringWithFormat:@"%.2f",0.01]; //商品价格
    order.notifyURL = @"http://www.xxx.com"; //回调URL
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"30m";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alisdkdemo";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    NSLog(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            //【callback处理支付结果】
            NSLog(@"reslut = %@",resultDic);
        }];
        
//        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }

    
}
- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
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
