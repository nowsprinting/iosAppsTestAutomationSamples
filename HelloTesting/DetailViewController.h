//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) Customer* detailItem;

/** 氏名 */
@property (weak, nonatomic) IBOutlet UITextField *name;

/** メールアドレス */
@property (weak, nonatomic) IBOutlet UITextField *mail;

/** 性別 */
@property (weak, nonatomic) IBOutlet UISegmentedControl *gender;

/** 年齢 */
@property (weak, nonatomic) IBOutlet UIPickerView *age;

/** 性別の変更 */
- (IBAction)changeGender:(id)sender;

@end
