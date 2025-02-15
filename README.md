<u><h1>mypkg</h1></u>
このリポジトリはROS2のパッケージで、使用しているデバイスのバッテリー残量を計測してくれます。

<u><h1>ノードについて</h1></u>
ノード名：battery

機能：使用しているデバイスの現在のバッテリーを表示してくれます。

<u><h1>実行例</h1></u>
端末を2つご用意ください。

・端末１
```
＄ros2 run mypkg battery
```

・端末２
```
$ ros2 topic echo /batterycheck

data: 99
---
data: 99
---
data: 99
---
data: 99
---
data: 99
---
data: 99
---
data: 99
---
data: 99
---

```
上図のようにバッテリー残量が確認できます。

<u><h1>注意事項</h1></u>
launchファイルについて：今回は１つのノードしか動かさないためlaunchファイルを実行したり等は必要ないです。

<u><h1>テスト環境</h1></u>
・ubuntu 22.04 LTS
・python 3

<u><h1>参考文献</h1></u>
[PythonにおけるNoneの判定](https://note.nkmk.me/python-none-usage/)


[Pythonで関数を定義・呼び出し（def, return）](https://note.nkmk.me/python-function-def-return/)


[Pythonでシステム情報を取得！psutilでバッテリー状態を確認する方法](https://ameblo.jp/fiender/entry-12880810651.html#:~:text=psutil.sensors_battery%28%29%20%E3%82%92%E4%BD%BF%E3%81%86%E3%81%93%E3%81%A8%E3%81%A7%E3%80%81%E3%83%90%E3%83%83%E3%83%86%E3%83%AA%E3%83%BC%E6%AE%8B%E9%87%8F%E3%82%84%E9%9B%BB%E6%BA%90%E6%8E%A5%E7%B6%9A%E7%8A%B6%E6%B3%81%E3%80%81%E4%BD%BF%E7%94%A8%E5%8F%AF%E8%83%BD%E6%99%82%E9%96%93%E3%81%AA%E3%81%A9%E3%81%AE%E6%83%85%E5%A0%B1%E3%82%92%E5%8F%96%E5%BE%97%E3%81%A7%E3%81%8D%E3%81%BE%E3%81%99%E3%80%82%20%23%20%E3%83%90%E3%83%83%E3%83%86%E3%83%AA%E3%83%BC%E6%83%85%E5%A0%B1%E3%82%92%E5%8F%96%E5%BE%97%20if%20battery%3A%20print%28f%20%22%E3%83%90%E3%83%83%E3%83%86%E3%83%AA%E3%83%BC%E6%AE%8B%E9%87%8F%3A,print%28f%20%22%E9%9B%BB%E6%BA%90%E3%81%AB%E6%8E%A5%E7%B6%9A%E4%B8%AD%3A%20%7B%27%E3%81%AF%E3%81%84%27%20if%20battery.power_plugged%20else%20%27%E3%81%84%E3%81%84%E3%81%88%27%7D%20%22%29)

[grepコマンドの詳細まとめました【Linuxコマンド集】](https://eng-entrance.com/linux-command-grep)
<u><h1>ライセンス</h1></u>
・このソフトウェアパッケージは、３条項BSDライセンスの基、再配布及び使用が許可されます。

・©2024 Haruhiko Kawai
