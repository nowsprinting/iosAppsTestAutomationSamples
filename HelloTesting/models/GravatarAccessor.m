//
// 『iOSアプリ テスト自動化入門』サンプルコード
//
//  Copyright (c) 2014 Koji Hasegawa. All rights reserved.
//

#import "GravatarAccessor.h"
#import <CommonCrypto/CommonDigest.h>

/** GravatarAccessorの非公開フィールド/メソッド定義カテゴリ */
@interface GravatarAccessor()

/** gravatar.comとの通信用コネクション */
@property(nonatomic, strong) NSURLConnection *connection;

/** 通知先デリゲート */
@property(nonatomic, weak) id<GravatarAvatarDelegate> delegate;

/** ステータスコード */
@property(nonatomic, assign) NSInteger statusCode;

/** MIMEType */
@property(nonatomic, copy) NSString *MIMEType;

/** レスポンス本体を蓄積する */
@property(nonatomic, strong) NSMutableData *responseAccumulator;

/** 文字列をMD5ハッシュ化して返す非公開メソッド */
- (NSString*)md5from:(NSString*)string;

@end


@implementation GravatarAccessor

/**
 * アバター取得対象メールアドレスと通知先デリゲートを指定して初期化
 */
- (id)initWithMail:(NSString*)mail delegate:(id<GravatarAvatarDelegate>)delegate{
    self = [super init];
    if(self){
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@/avatar/%@", GRAVATAR_SERVER, [self md5from:mail]]];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        self.connection = [NSURLConnection connectionWithRequest:req delegate:self];
        self.delegate = delegate;
        self.responseAccumulator = [[NSMutableData alloc] init];
    }
    return self;
}

/**
 * アバター取得をリクエストする（非同期で取得し、デリゲートに通知する）
 */
- (void)requestAvatar{
    [self.connection start];
}


#pragma mark - NSURLConnectionDataDelegate methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.statusCode = ((NSHTTPURLResponse*)response).statusCode;
    self.MIMEType = response.MIMEType;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.responseAccumulator appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    if(self.statusCode!=200){
        NSString *message = [NSString stringWithFormat:@"Bad statusCode:%zd", self.statusCode];
        [self.delegate responseError:message];
        
    }else if(!([self.MIMEType isEqual:@"image/png"]
               || [self.MIMEType isEqual:@"image/jpeg"])){
        NSString *message = [NSString stringWithFormat:@"Bad content-type:%@", self.MIMEType];
        [self.delegate responseError:message];
        
    }else{
        UIImage *avatar = [UIImage imageWithData:self.responseAccumulator];
        [self.delegate responseAvatar:avatar];
    }
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSString *message = [NSString stringWithFormat:@"Error! domain:%@, code:%zd", error.domain, error.code];
    [self.delegate responseError:message];
}


#pragma mark - private methods

/** 文字列をMD5ハッシュ化して返す非公開メソッド */
- (NSString*)md5from:(NSString*)string{
    const char *ptr = [string UTF8String];
    unsigned char md5Buffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(ptr, (CC_LONG)strlen(ptr), md5Buffer);
    
    NSMutableString *md5 = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i=0; i<CC_MD5_DIGEST_LENGTH; i++){
        [md5 appendFormat:@"%02x", md5Buffer[i]];
    }
    return md5;
}

@end
