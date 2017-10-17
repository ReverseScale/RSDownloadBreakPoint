//
//  ViewController.m
//  RSDownloadBreakPoint
//
//  Created by WhatsXie on 2017/7/20.
//  Copyright © 2017年 StevenXie. All rights reserved.
//

#import "ViewController.h"
#import "RSDownloadBreakPoint.h"

@interface ViewController (){
    NSString *urlStr;
}
@property (weak, nonatomic) IBOutlet UILabel *progressLabel;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    urlStr = @"http://dlsw.baidu.com/sw-search-sp/soft/2a/25677/QQ_V4.1.1.1456905733.dmg";
}

- (IBAction)start:(id)sender {
    [RSBreakPoint asynDownloadWithUrl:urlStr progressBlock:^(float progress, long long receiveByte, long long allByte) {
        _progressView.progress = progress;
        _progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)(progress*100)];
    } successBlock:^(NSString *filePath) {
        NSLog(@"%@", filePath);
    } failureBlock:^(NSString *filePath) {
        NSLog(@"%@", filePath);
    }];
}
- (IBAction)pause:(id)sender {
    [RSBreakPoint pause:urlStr];
}
- (IBAction)delete:(id)sender {
    [RSBreakPoint pause:urlStr];
    [RSFileManager deleteFile:[NSURL URLWithString:urlStr]];
    _progressView.progress = 0.0;
    _progressLabel.text = @"0%";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
