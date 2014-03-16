//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "Customer.h"

@implementation Customer

/**
 * マーケティング区分を返す
 * @retuen 該当するマーケティング区分
 */
- (Division)division
{
    if(self.age<=3){
        return DivisionNone;
        
    }else if(self.age<=12){
        return DivisionC;
        
    }else if(self.age<=19){
        return DivisionT;
        
    }else if(self.age<=34){
        if(self.gender==GenderFemale){
            return DivisionF1;
        }else{
            return DivisionM1;
        }
        
    }else if(self.age<=49){
        if(self.gender==GenderFemale){
            return DivisionF2;
        }else{
            return DivisionM2;
        }
        
    }else{
        if(self.gender==GenderFemale){
            return DivisionF3;
        }else{
            return DivisionM3;
        }
    }
}

/**
 * 引数のマーケティング区分に一致する顧客か否かをBOOL型で返す
 * @param division マーケティング区分
 * @return YES:この顧客が引数のマーケティング区分に一致する
 */
- (BOOL)isInDivision:(Division)division
{
    return division==[self division];
}

/**
 * 性別を文字列で返す
 */
- (NSString*)genderString{
    switch (self.gender) {
        case GenderMale:
            return @"男性";
        case GenderFemale:
            return @"女性";
    }
}

/**
 * マーケティング区分を文字列で返す
 */
- (NSString*)divisionString{
    switch ([self division]) {
        case DivisionM1:
            return @"M1層";
        case DivisionM2:
            return @"M2層";
        case DivisionM3:
            return @"M3層";
        case DivisionF1:
            return @"F1層";
        case DivisionF2:
            return @"F2層";
        case DivisionF3:
            return @"F3層";
        case DivisionC:
            return @"C層";
        case DivisionT:
            return @"T層";
        case DivisionNone:
            return @"分類外";
    }
}

@end
