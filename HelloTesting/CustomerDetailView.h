//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Customer.h"
#import "GravatarAccessor.h"

@interface CustomerDetailView : UIView <GravatarAvatarDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *mailLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *marketDivisionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;

/** 顧客情報をセットする */
- (void)setCustomer:(Customer*)customer;

@end
