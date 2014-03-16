//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "CustomerDetailView.h"

@implementation CustomerDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/** 顧客情報をセットする */
- (void)setCustomer:(Customer*)customer{
    self.nameLabel.text = customer.name;
    self.mailLabel.text = customer.mail;
    self.genderLabel.text = customer.genderString;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", customer.age];
    self.marketDivisionLabel.text = customer.divisionString;
    
    GravatarAccessor *gravatar = [[GravatarAccessor alloc] initWithMail:customer.mail delegate:self];
    [gravatar requestAvatar];
}


#pragma mark - GravatarAvatarDelegate methods

/** アバター取得完了 */
- (void)responseAvatar:(UIImage*)avatar{
    if([NSThread isMainThread]){
        [self.avatarImage setImage:avatar];
    }else{
        [self.avatarImage performSelectorOnMainThread:@selector(setImage:) withObject:avatar waitUntilDone:NO];
    }
}

/** アバター取得失敗 */
- (void)responseError:(NSString*)message{
    //nop
}

@end
