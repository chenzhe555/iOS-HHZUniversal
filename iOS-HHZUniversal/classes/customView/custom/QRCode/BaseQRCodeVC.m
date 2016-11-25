//
//  BaseQRCodeVC.m
//  core-ios-oc
//
//  Created by 陈哲#376811578@qq.com on 16/2/22.
//  Copyright © 2016年 陈哲是个好孩子. All rights reserved.
//

#import "BaseQRCodeVC.h"
#import <AVFoundation/AVFoundation.h>
#import "MCQRCenterView.h"

#define kMCQRCodeVCAnimationDuring  2/6.0f

@interface BaseQRCodeVC ()<AVCaptureMetadataOutputObjectsDelegate>
/**
 *  捕捉会话
 */
@property (nonatomic, strong) AVCaptureSession * captureSession;

/**
 *  展示的layer层
 */
@property (nonatomic, strong) AVCaptureVideoPreviewLayer * previewLayer;

/**
 *  扫描的边框
 */
@property (nonatomic, strong) UIView * scanBorderView;

/**
 *  扫描的透明框
 */
@property (nonatomic, strong) MCQRCenterView * centerView;

/**
 *  扫描线
 */
@property (nonatomic, strong) UIView * scanLineView;

/**
 *  描述文字
 */
@property (nonatomic, strong) UILabel * descripLabel;
@end

@implementation BaseQRCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _captureSession = nil;
    _previewLayer = nil;
    [self initQRData];
    [self startScaningQRCode];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 初始化数据
-(void)initQRData
{
    if(_centerClearRec.size.width == 0)
    {
        _centerClearRec = CGRectMake(([UIScreen mainScreen].bounds.size.width - 220)/2, 150, 220, 220);
    }
    if (_bgColor == nil)
    {
        _bgColor = [UIColor greenColor];
    }
}


-(BOOL)startScaningQRCode
{
    NSError * err;
    
    //1.初始化捕捉设备（AVCaptureDevice），类型为AVMediaTypeVideo
    AVCaptureDevice * captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    //2.用captureDevice创建输入流
    AVCaptureDeviceInput * deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&err];
    if (deviceInput == nil)
    {
        NSLog(@"QRCode创建输入流失败\n%@\n",err);
        return NO;
    }
    
    //3.创建媒体数据输出流
    AVCaptureMetadataOutput * captureMetadataOutput = [[AVCaptureMetadataOutput alloc] init];
    
    //4.实例化捕捉会话
    _captureSession = [[AVCaptureSession alloc] init];
    
    //4.1.将输入流添加到会话
    [_captureSession addInput:deviceInput];
    
    //4.2.将媒体输出流添加到会话中
    [_captureSession addOutput:captureMetadataOutput];
    
    //5.创建串行队列，并加媒体输出流添加到队列当中
    dispatch_queue_t dispatchQueue = dispatch_queue_create("MCQRCode", NULL);
    
    //5.1.设置代理
    [captureMetadataOutput setMetadataObjectsDelegate:self queue:dispatchQueue];
    
    //5.2.设置输出媒体数据类型为QRCode
    [captureMetadataOutput setMetadataObjectTypes:@[AVMetadataObjectTypeQRCode]];
    
    //6.实例化预览图层
    _previewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:_captureSession];
    
    //7.设置预览图层填充方式
    [_previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    
    //8.设置图层的frame
    [_previewLayer setFrame:self.view.layer.bounds];
    
    //9.将图层添加到预览view的图层上
    [self.view.layer addSublayer:_previewLayer];
    
    //10.绘制扫描框
    _centerView = [[MCQRCenterView alloc] init];
    _centerView.borderColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:0.5f];
    _centerView.cornerColor = _bgColor;
    _centerView.cornerWidth = 15.0f;
    _centerView.centerClearRect = _centerClearRec;
    
    _centerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _centerView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_centerView];
    
    //11.设置扫描范围
    CGRect clearRect = CGRectMake((_centerView.frame.size.width - _centerView.centerClearRect.size.width)/2, (_centerView.frame.size.height - _centerView.centerClearRect.size.height)/2, _centerView.centerClearRect.size.width, _centerView.centerClearRect.size.height);
    //这个贱人，非得是这样计算出来的(y/sh,x/sw,h/sh,w/sw)
    captureMetadataOutput.rectOfInterest = CGRectMake(clearRect.origin.y/_centerView.frame.size.height, clearRect.origin.x/_centerView.frame.size.width,clearRect.size.height/_centerView.frame.size.height ,clearRect.size.width/_centerView.frame.size.width );
//    NSLog(@"rectOfInterest---%f---%f---%f---%f",captureMetadataOutput.rectOfInterest.origin.x,captureMetadataOutput.rectOfInterest.origin.y,captureMetadataOutput.rectOfInterest.size.width,captureMetadataOutput.rectOfInterest.size.height);
    
    //12.绘制扫描线
    _scanLineView = [[UIView alloc] init];
    _scanLineView.frame = CGRectMake(_centerView.centerClearRect.origin.x + 10, _centerView.centerClearRect.origin.y, _centerView.centerClearRect.size.width - 20, 1);
    _scanLineView.backgroundColor = [UIColor greenColor];
    
    [_centerView addSubview:_scanLineView];
    
    [self startLineScaningAnimation];
    
    //13.描述文字
    _descripLabel = [[UILabel alloc] init];
    _descripLabel.text = @"将二维码放入框内,即可自动扫描";
    _descripLabel.frame = CGRectMake(0, _centerView.centerClearRect.origin.y + _centerView.centerClearRect.size.height + 24, [UIScreen mainScreen].bounds.size.width, 20);
    _descripLabel.font = [UIFont systemFontOfSize:13.0f];
    _descripLabel.textAlignment = NSTextAlignmentCenter;
    _descripLabel.textColor = [UIColor blackColor];
    _descripLabel.backgroundColor = [UIColor clearColor];
    [_centerView addSubview:_descripLabel];
    
    //14.开始扫描
    [_captureSession startRunning];
    
    
    return YES;
}

-(void)stopScaningQRCode
{
    [_captureSession stopRunning];
    _captureSession = nil;
    [_scanLineView.layer removeAllAnimations];
    [_previewLayer removeFromSuperlayer];
}

-(void)handleQRCodeSuccessString:(NSString *)successString
{
    @throw [NSException exceptionWithName:@"MCQRCodeException" reason:@"please implement handleQRCodeSuccessString" userInfo:nil];
}

-(void)openFlashLight:(BOOL)openLight
{
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if ([device hasTorch] && [device hasFlash])
    {
        [device lockForConfiguration:nil];
        if (openLight)
        {
            [device setTorchMode:AVCaptureTorchModeOn];
            [device setFlashMode:AVCaptureFlashModeOn];
        }
        else
        {
            [device setTorchMode:AVCaptureTorchModeOff];
            [device setFlashMode:AVCaptureFlashModeOff];
        }
        [device unlockForConfiguration];
    }
}



-(void)startLineScaningAnimation
{
    //以中间白色区域的高10等份
    CGFloat addHeight = _centerView.centerClearRect.size.height/3;
    NSLog(@"addHeight--%f",addHeight);
    CGFloat baseY = _scanLineView.frame.origin.y;
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    keyAnimation.values = @[@(baseY),@(baseY + addHeight),@(baseY + addHeight*2),@(baseY + addHeight*3),@(baseY + addHeight*2),@(baseY + addHeight),@(baseY)];
    keyAnimation.keyTimes = @[[NSNumber numberWithFloat:0.0f],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*1],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*2],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*3],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*4],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*5],
                              [NSNumber numberWithFloat:kMCQRCodeVCAnimationDuring*6]];
    keyAnimation.repeatCount = MAXFLOAT;
    keyAnimation.autoreverses = YES;
    keyAnimation.calculationMode = kCAAnimationLinear;
    keyAnimation.duration = kMCQRCodeVCAnimationDuring*6;
    [_scanLineView.layer addAnimation:keyAnimation forKey:@"scanAnimation"];
}

#pragma mark 扫描二维码回调
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0)
    {
        AVMetadataMachineReadableCodeObject * metadataObj = [metadataObjects objectAtIndex:0];
        //判断回传的数据类型
        if ([[metadataObj type] isEqualToString:AVMetadataObjectTypeQRCode])
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
                [self handleQRCodeSuccessString:[metadataObj stringValue]];
                [self stopScaningQRCode];
            });
            
        }
    }
}


#pragma mark 生成二维码
-(UIImage *)createQRImageWithString:(NSString *)qrString
{
    if (qrString.length > 0)
    {
        return [self createQRImageWithCIImage:[self createCIImageWithString:qrString] andScale:250.0f];
    }
    return nil;
}

-(CIImage *)createCIImageWithString:(NSString *)qrString
{
    // Need to convert the string to a UTF-8 encoded NSData object
    NSData *stringData = [qrString dataUsingEncoding:NSUTF8StringEncoding];
    // Create the filter
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // Set the message content and error-correction level
    [qrFilter setValue:stringData forKey:@"inputMessage"];
    [qrFilter setValue:@"M" forKey:@"inputCorrectionLevel"];
    // Send the image back
    return qrFilter.outputImage;
}

-(UIImage *)createQRImageWithCIImage:(CIImage *)image andScale:(CGFloat)size
{
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    // create a bitmap image that we'll draw into a bitmap context at the desired size;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    // Create an image with the contents of our bitmap
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    // Cleanup
    CGContextRelease(bitmapRef);
    CGColorSpaceRelease(cs);
    CGImageRelease(bitmapImage);
    UIImage * img = [UIImage imageWithCGImage:scaledImage];
    CGImageRelease(scaledImage);
    return img;
}

@end
