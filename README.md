#iOSアプリ テスト自動化入門 サンプル
[![Build Status](https://travis-ci.org/nowsprinting/iosAppsTestAutomationSamples.svg?branch=master)](https://travis-ci.org/nowsprinting/iosAppsTestAutomationSamples)
[![Coverage Status](https://coveralls.io/repos/nowsprinting/iosAppsTestAutomationSamples/badge.png?branch=master)](https://coveralls.io/r/nowsprinting/iosAppsTestAutomationSamples?branch=master)
[![Gitter](https://badges.gitter.im/nowsprinting/iosAppsTestAutomationSamples.png)](https://gitter.im/nowsprinting/iosAppsTestAutomationSamples)


書籍『
<a href="http://www.amazon.co.jp/gp/product/4798040894/ref=as_li_ss_tl?ie=UTF8&camp=247&creative=7399&creativeASIN=4798040894&linkCode=as2&tag=nowsprinting-22">iOSアプリ テスト自動化入門</a><img src="http://ir-jp.amazon-adsystem.com/e/ir?t=nowsprinting-22&l=as2&o=9&a=4798040894" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />
』（秀和システム）のサンプルコードです。

<a href="http://www.amazon.co.jp/gp/product/4798040894/ref=as_li_ss_il?ie=UTF8&camp=247&creative=7399&creativeASIN=4798040894&linkCode=as2&tag=nowsprinting-22"><img border="0" src="http://ws-fe.amazon-adsystem.com/widgets/q?_encoding=UTF8&ASIN=4798040894&Format=_SL250_&ID=AsinImage&MarketPlace=JP&ServiceVersion=20070822&WS=1&tag=nowsprinting-22" ></a><img src="http://ir-jp.amazon-adsystem.com/e/ir?t=nowsprinting-22&l=as2&o=9&a=4798040894" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" />


書籍について、また、サンプルコード以外の訂正・変更箇所については、以下のブログエントリを参照してください。

- [iOSアプリのテスト自動化本を執筆しました - やらなイカ？](http://nowsprinting.hatenablog.com/entry/2014/02/12/104959)
- [iOSアプリ テスト自動化入門 のサポート - やらなイカ？](http://nowsprinting.hatenablog.com/entry/2014/03/18/115911)



##セットアップ手順

    $ git clone git@github.com:nowsprinting/iosAppsTestAutomationSamples.git
    $ cd iosAppsTestAutomationSamples/
    $ pod install
    $ open HelloTesting.xcworkspace/

もしくは、このページ右にある"Download ZIP"ボタンでダウンロードしてください。CocoaPodsのインストール手順や使いかたは書籍のAppendixを参照してください。



##Chapterごとの特記事項

###Chapter 2〜4

上記手順でセットアップを行えば、そのまま動作します。ただし、以下については、変更を入れたブランチがありますので参照してください。

- 2.2.1 不具合修正の前後をテストする
- 3.2.5 UIViewの表示テスト


###5.3 Frank

Frankのインストール、`frank setup`、`frank build`を実行してから、`cucumber`コマンドで実行してください。プロジェクトのビルド設定などの詳細は書籍を参照してください。


###7.1 OS X Server/Bots

このサンプルプロジェクトをOS X Server/Botsでビルドする場合、`.gitignore`ファイルの以下の行を削除し、Pods/ディレクトリ下のファイルをリポジトリに追加してください。

    #CocoaPods
    Pods
