# DiffByWinMerge

DiffByWinMerge は 直近の変更との Diff を取り、WinMerge で表示する SourceTree 用のカスタム操作バッチファイルです。

## インストール方法

1. このリポジトリをクローンしてください。

2. SourceTree で ツール＞オプション＞カスタム操作を開きます。

3. 追加ボタンを押下します。

4. 以下の通りに入力します。

	* メニュー表示名：直近のDiff を確認する
	* ☑バックグラウンドで実行する
	* 実行するスクリプト：%ThisRepositoryDir%\tools\DiffByWinMerge\ja-JP\DiffByWinMerge.bat
	* パラメータ：$REPO $SHA $FILE 

	![カスタム操作を編集](assets/2023-01-13-20-58-51.png)

5. OKボタンを押下します。

6. OKボタンを押下します。

## 使い方

![使い方](assets/HowToUse.gif)