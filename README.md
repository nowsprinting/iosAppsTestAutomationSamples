#iOSアプリ テスト自動化入門 サンプル
[![Build Status](https://travis-ci.org/nowsprinting/iosAppsTestAutomationSamples.png?branch=master)](https://travis-ci.org/nowsprinting/iosAppsTestAutomationSamples)
[![Coverage Status](https://coveralls.io/repos/nowsprinting/iosAppsTestAutomationSamples/badge.png)](https://coveralls.io/r/nowsprinting/iosAppsTestAutomationSamples)
[![Gitter](https://badges.gitter.im/nowsprinting/iosAppsTestAutomationSamples.png)](https://gitter.im/nowsprinting/iosAppsTestAutomationSamples)


『[iOSアプリ テスト自動化入門](http://www.amazon.co.jp/exec/obidos/ASIN/4798040894/nowsprinting-22/)』のサンプルコードです。



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
