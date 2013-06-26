Hunanori
==========

js のログなんかいろいろ
AS ではこんなようなのみんな持ってた気がする

**推奨環境:** IE10+

Usage
--------

```coffee
Hunanori.setup("Hunanori.min.js")
```

```coffee
Hunanori.log("ソイヤ！")
#results
#ソイヤ!
```

###デバッグをオフ
```coffee
Hunanori.debug = false
Hunanori.log("ソイヤソイヤ！")
#results...
```

`debug` を false にすると出力されなくなる

###ログレベル

####ピンポイントで指定

```coffee
Hunanori.log("やばお", Hunanori.ERROR)
#Error やばお
```

エラーとして出力される

####全体で設定

```coffee
Hunanori.level = Hunanori.WARNING
Hunanori.log("面舵いっぱい")
Hunanori.log("取舵いっぱい")
#results....
#ワーニング 面舵いっぱい
#ワーニング 取舵いっぱい
```

常に指定したログレベルで出力される。

###インスタンスにも持たせる
```coffee
class Sencho extends Hunanori
  constructor:()->

sencho = new Sencho()
sencho.log("お腹すいた")

#results...
#お腹すいた
```

一見すると `console.log` で良さげだが

```coffee
Hunanori.debug = false

sencho = new Sencho()
sencho.log("お腹すいた")
sencho.log("寝たい")

#results...
```

Hunanori を継承していると、まとめてオン/オフがトグル出来る。

###prefix, separator

```coffee
class Sencho extends Hunanori
  separator: "▂▅▇█▓▒░('ω')░▒▓█▇▅▂うわあああああああ"
  prefix: ":( ﾞﾟ'ωﾟ'）:ウウウオオオアアアーーー！！！"
  constructor:()->

sencho = new Sencho()
sencho.log("航路間違えた")

#results...
#:( ﾞﾟ'ωﾟ'）:ウウウオオオアアアーーー！！！
#航路間違えた
#▂▅▇█▓▒░('ω')░▒▓█▇▅▂うわあああああああ
```

出力したいメッセージの前後に区切り文字などを挟むことが出来る。


残念なところ
-------------

* console.log 諸々な都合上、実行時の行数が Hunanori 内になってしまいます。
* 単純な解決手法としては console.log.bind(console) を即時関数の戻り値としてあげればできますが
  * 区切り文字を入れるとか出来ない
  * タイムスタンプ押すとか出来ない
  * デバッグモードでなければ出力しないなどの制限ができない

と、他にできなくなる事の方が多いので Call Stack を辿って無理やり実行時の行数を出力させてます。
このへんうまいこと解決出来ればもっと良くなると思っています。