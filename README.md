# RSDownloadBreakPoint

![](https://img.shields.io/badge/platform-iOS-red.svg) ![](https://img.shields.io/badge/language-Objective--C-orange.svg) ![](https://img.shields.io/badge/download-2MB-brightgreen.svg
) ![](https://img.shields.io/badge/license-MIT%20License-brightgreen.svg) 

现在不少APP都有加入下载功能，如下载离线数据包、离线书、地图等等，作为下载的必备技能，断点续传正悄然向你走来。Swift、Objective-C两种语言实现。

| 名称 |1.列表页 |2.展示页 |3.下载页 |
| ------------- | ------------- | ------------- | ------------- |
| 截图 | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/17839578.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/46738921.jpg) | ![](http://og1yl0w9z.bkt.clouddn.com/17-7-21/18693127.jpg) |
| 描述 | 通过 storyboard 搭建基本框架 | 下载前页面 | 下载中页面 |


## Advantage 框架的优势
* 1.文件少，逻辑清晰
* 2.不依赖任何其他第三方库
* 3.使用Block方式传递信息，高效便捷
* 4.具备较高自定义性

## Requirements 要求
* iOS 7+
* Xcode 8+


## Usage 使用方法
### 引入头文件
```Objective-C
#import "RSDownloadBreakPoint.h"
```
### 下载方法
OC 实现
```Objective-C
[RSBreakPoint asynDownloadWithUrl:urlStr progressBlock:^(float progress, long long receiveByte, long long allByte) {
    _progressView.progress = progress;
    _progressLabel.text = [NSString stringWithFormat:@"%d%%", (int)(progress*100)];
} successBlock:^(NSString *filePath) {
    NSLog(@"%@", filePath);
} failureBlock:^(NSString *filePath) {
    NSLog(@"%@", filePath);
}];
```
Swift 实现
```Swift
DownloaderManager.shared.download(urlString: model!.urlString, toPath: model!.destinationPath, process: { (progress, sizeString, speedString) in
    cell.progressView?.progress=progress;
    cell.progressLabel?.text=String(format: "%.1f%%",progress*100)
    cell.sizeLabel?.text=sizeString
    cell.speedLabel?.text=speedString
    if(speedString==nil){
        cell.speedLabel?.isHidden=true
    }
    else{
        cell.speedLabel?.isHidden=false
    }
}, completion: {
    sender?.setTitle("完成", for: UIControlState.normal)
    sender?.isEnabled=false
    cell.speedLabel?.isHidden=true
    let alert=UIAlertView.init(title:String(format: "%@下载完成",(model?.name)!), message: nil, delegate: nil, cancelButtonTitle: "确定")
    alert.show()
}, failure: { (error) in
    DownloaderManager.shared.cancelDownloadTaskWithUrlString(urlString: (model?.urlString)!)
    sender?.setTitle("恢复", for: UIControlState.normal)
    cell.speedLabel?.isHidden=true
    let alert=UIAlertView.init(title:"ERROR", message: nil, delegate: nil, cancelButtonTitle: "确定")
    alert.show()
})
```
### 暂停方法
OC：
```Objective-C
[RSBreakPoint pause:urlStr];
```
### 删除方法
OC：先调用一次暂停方法，先暂停，再删除。
```Objective-C
[RSBreakPoint pause:urlStr];
[RSFileManager deleteFile:[NSURL URLWithString:urlStr]];
_progressView.progress = 0.0;
_progressLabel.text = @"0%";
```

使用简单、效率高效、进程安全~~~如果你有更好的建议,希望不吝赐教!


## License 许可证
RSDownloadBreakPoint 使用 MIT 许可证，详情见 LICENSE 文件。


## Contact 联系方式:
* WeChat : WhatsXie
* Email : ReverseScale@iCloud.com
* Blog : https://reversescale.github.io
