//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <GHUnit/GHUnit.h>
#import "CustomerDetailView.h"
#import "Customer.h"

//UIViewの表示テストを行なう場合にはGHViewTestCaseを継承します
@interface CustomerDetailViewTest : GHViewTestCase

@end

@implementation CustomerDetailViewTest

- (void)testView{
    //Viewを構築
    UINib* nib = [UINib nibWithNibName:@"CustomerDetailView" bundle:nil];
    NSArray* array = [nib instantiateWithOwner:nil options:nil];
    CustomerDetailView *sut = [array objectAtIndex:0];
    
    //表示する顧客オブジェクトをセット
    Customer *customer = [[Customer alloc] init];
    customer.name   = @"岩田 貫一";
    customer.mail   = @"myemailaddress@example.com";
    customer.gender = GenderMale;
    customer.age    = 33;
    [sut setCustomer:customer];
    
    //Viewと「期待される画像」との比較・検証を行なう
    GHVerifyView(sut);
}

@end
