//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface PreviewViewController : UIViewController

@property (strong, nonatomic) Customer* detailItem;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end
