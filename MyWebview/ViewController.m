//
//  ViewController.m
//  MyWebview
//
//  Created by Apple on 15/11/11.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView *web;
    UIButton *btn;
    UIActivityIndicatorView *activity;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-30);
    web=[[UIWebView alloc] initWithFrame:rect];
    web.delegate=self;
    btn= [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width-100)/2, 20, 100, 30)];
    [btn setTitle:@"展示网页" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    //网页分页的方向
    web.paginationMode=UIWebPaginationModeTopToBottom;
   
  
    [self.view addSubview:web];
    [self.view addSubview:btn];
}

-(void)tapped:(UIButton *)sender
{
    [btn removeFromSuperview];
    NSURL *url=[NSURL URLWithString:@"http://www.ebank007.com"];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    
}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    activity=[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    activity.center=self.view.center;
    activity.activityIndicatorViewStyle=UIActivityIndicatorViewStyleGray;
    activity.color=[UIColor redColor];
    [self.view addSubview:activity];
    //[activity startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    NSLog(@"%ld",web.pageCount);//网页数目
    [activity stopAnimating];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"连接错误!");
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    navigationType=UIWebViewNavigationTypeReload;
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
