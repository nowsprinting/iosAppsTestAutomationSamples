//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Kiwi.h"
#import "Customer.h"

/** KiwiによるCustomerクラスのSpecサンプル */
SPEC_BEGIN(CustomerSpec)

describe(@"Customer test（顧客クラスのテストケース）", ^{
    __block Customer *sut;
    
    beforeEach(^{
        sut = [[Customer alloc] init];
    });
    
    context(@"Female cases（性別=女性のブロック）", ^{
        beforeEach(^{
            sut.gender = GenderFemale;
        });
        
        context(@"age=3のブロック", ^{
            beforeEach(^{
                sut.age = 3;
            });
            it(@"divisionからはNone（分類外）が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionNone)];
            });
            it(@"divisionStringからは分類外が返るべき", ^{
                [[[sut divisionString] should] equal:@"分類外"];
            });
            describe(@"isInDivision", ^{
                it(@"NoneにはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionNone]) should] equal:theValue(YES)];
                });
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=4のブロック", ^{
            beforeEach(^{
                sut.age = 4;
            });
            it(@"divisionからはC層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionC)];
            });
            it(@"divisionStringからはC層が返るべき", ^{
                [[[sut divisionString] should] equal:@"C層"];
            });
            describe(@"isInDivision", ^{
                it(@"C層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionC]) should] equal:theValue(YES)];
                });
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=12のブロック", ^{
            beforeEach(^{
                sut.age = 12;
            });
            it(@"divisionからはC層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionC)];
            });
            it(@"divisionStringからはC層が返るべき", ^{
                [[[sut divisionString] should] equal:@"C層"];
            });
            describe(@"isInDivision", ^{
                it(@"C層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionC]) should] equal:theValue(YES)];
                });
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=13のブロック", ^{
            beforeEach(^{
                sut.age = 13;
            });
            it(@"divisionからはT層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionT)];
            });
            it(@"divisionStringからはT層が返るべき", ^{
                [[[sut divisionString] should] equal:@"T層"];
            });
            describe(@"isInDivision", ^{
                it(@"T層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionT]) should] equal:theValue(YES)];
                });
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=19のブロック", ^{
            beforeEach(^{
                sut.age = 19;
            });
            it(@"divisionからはT層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionT)];
            });
            it(@"divisionStringからはT層が返るべき", ^{
                [[[sut divisionString] should] equal:@"T層"];
            });
            describe(@"isInDivision", ^{
                it(@"T層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionT]) should] equal:theValue(YES)];
                });
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=20のブロック", ^{
            beforeEach(^{
                sut.age = 20;
            });
            it(@"divisionからはF1層が返るべき", ^{
                KWValue *actual = theValue([sut division]);
                KWValue *expected = theValue(DivisionF1);
                [[actual should] equal:expected];
            });
            it(@"divisionStringからはF1層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F1層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはYESが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionF1]);
                    KWValue *expected = theValue(YES);
                    [[actual should] equal:expected];
                });
                it(@"F2層にはNOが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionF2]);
                    KWValue *expected = theValue(NO);
                    [[actual should] equal:expected];
                });
                it(@"F3層にはNOが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionF3]);
                    KWValue *expected = theValue(NO);
                    [[actual should] equal:expected];
                });
            });
        });
        
        context(@"age=34のブロック", ^{
            beforeEach(^{
                sut.age = 34;
            });
            it(@"divisionからはF1層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionF1)];
            });
            it(@"divisionStringからはF1層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F1層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(YES)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=35のブロック", ^{
            beforeEach(^{
                sut.age = 35;
            });
            it(@"divisionからはF2層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionF2)];
            });
            it(@"divisionStringからはF2層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F2層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(YES)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=49のブロック", ^{
            beforeEach(^{
                sut.age = 49;
            });
            it(@"divisionからはF2層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionF2)];
            });
            it(@"divisionStringからはF2層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F2層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(YES)];
                });
                it(@"F3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=50のブロック", ^{
            beforeEach(^{
                sut.age = 50;
            });
            it(@"divisionからはF3層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionF3)];
            });
            it(@"divisionStringからはF3層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F3層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(YES)];
                });
            });
        });
        
        context(@"age=51のブロック", ^{
            beforeEach(^{
                sut.age = 51;
            });
            it(@"divisionからはF3層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionF3)];
            });
            it(@"divisionStringからはF3層が返るべき", ^{
                [[[sut divisionString] should] equal:@"F3層"];
            });
            describe(@"isInDivision", ^{
                it(@"F1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF1]) should] equal:theValue(NO)];
                });
                it(@"F2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF2]) should] equal:theValue(NO)];
                });
                it(@"F3層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionF3]) should] equal:theValue(YES)];
                });
            });
        });
    });

    context(@"Male cases（性別=男性のブロック）", ^{
        beforeEach(^{
            sut.gender = GenderMale;
        });
        
        context(@"age=3のブロック", ^{
            beforeEach(^{
                sut.age = 3;
            });
            it(@"divisionからはNone（分類外）が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionNone)];
            });
            it(@"divisionStringからは分類外が返るべき", ^{
                [[[sut divisionString] should] equal:@"分類外"];
            });
            describe(@"isInDivision", ^{
                it(@"NoneにはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionNone]) should] equal:theValue(YES)];
                });
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=4のブロック", ^{
            beforeEach(^{
                sut.age = 4;
            });
            it(@"divisionからはC層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionC)];
            });
            it(@"divisionStringからはC層が返るべき", ^{
                [[[sut divisionString] should] equal:@"C層"];
            });
            describe(@"isInDivision", ^{
                it(@"C層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionC]) should] equal:theValue(YES)];
                });
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=12のブロック", ^{
            beforeEach(^{
                sut.age = 12;
            });
            it(@"divisionからはC層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionC)];
            });
            it(@"divisionStringからはC層が返るべき", ^{
                [[[sut divisionString] should] equal:@"C層"];
            });
            describe(@"isInDivision", ^{
                it(@"C層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionC]) should] equal:theValue(YES)];
                });
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=13のブロック", ^{
            beforeEach(^{
                sut.age = 13;
            });
            it(@"divisionからはT層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionT)];
            });
            it(@"divisionStringからはT層が返るべき", ^{
                [[[sut divisionString] should] equal:@"T層"];
            });
            describe(@"isInDivision", ^{
                it(@"T層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionT]) should] equal:theValue(YES)];
                });
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=19のブロック", ^{
            beforeEach(^{
                sut.age = 19;
            });
            it(@"divisionからはT層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionT)];
            });
            it(@"divisionStringからはT層が返るべき", ^{
                [[[sut divisionString] should] equal:@"T層"];
            });
            describe(@"isInDivision", ^{
                it(@"T層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionT]) should] equal:theValue(YES)];
                });
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=20のブロック", ^{
            beforeEach(^{
                sut.age = 20;
            });
            it(@"divisionからはM1層が返るべき", ^{
                KWValue *actual = theValue([sut division]);
                KWValue *expected = theValue(DivisionM1);
                [[actual should] equal:expected];
            });
            it(@"divisionStringからはM1層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M1層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはYESが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionM1]);
                    KWValue *expected = theValue(YES);
                    [[actual should] equal:expected];
                });
                it(@"M2層にはNOが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionM2]);
                    KWValue *expected = theValue(NO);
                    [[actual should] equal:expected];
                });
                it(@"M3層にはNOが返るべき", ^{
                    KWValue *actual = theValue([sut isInDivision:DivisionM3]);
                    KWValue *expected = theValue(NO);
                    [[actual should] equal:expected];
                });
            });
        });
        
        context(@"age=34のブロック", ^{
            beforeEach(^{
                sut.age = 34;
            });
            it(@"divisionからはM1層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionM1)];
            });
            it(@"divisionStringからはM1層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M1層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(YES)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=35のブロック", ^{
            beforeEach(^{
                sut.age = 35;
            });
            it(@"divisionからはM2層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionM2)];
            });
            it(@"divisionStringからはM2層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M2層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(YES)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=49のブロック", ^{
            beforeEach(^{
                sut.age = 49;
            });
            it(@"divisionからはM2層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionM2)];
            });
            it(@"divisionStringからはM2層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M2層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(YES)];
                });
                it(@"M3層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(NO)];
                });
            });
        });
        
        context(@"age=50のブロック", ^{
            beforeEach(^{
                sut.age = 50;
            });
            it(@"divisionからはM3層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionM3)];
            });
            it(@"divisionStringからはM3層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M3層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(YES)];
                });
            });
        });
        
        context(@"age=51のブロック", ^{
            beforeEach(^{
                sut.age = 51;
            });
            it(@"divisionからはM3層が返るべき", ^{
                [[theValue([sut division]) should] equal:theValue(DivisionM3)];
            });
            it(@"divisionStringからはM3層が返るべき", ^{
                [[[sut divisionString] should] equal:@"M3層"];
            });
            describe(@"isInDivision", ^{
                it(@"M1層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM1]) should] equal:theValue(NO)];
                });
                it(@"M2層にはNOが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM2]) should] equal:theValue(NO)];
                });
                it(@"M3層にはYESが返るべき", ^{
                    [[theValue([sut isInDivision:DivisionM3]) should] equal:theValue(YES)];
                });
            });
        });
    });

});

SPEC_END
