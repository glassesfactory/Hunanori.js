Hunanori
==========

js のログなんかいろいろ
AS ではこんなようなのみんな持ってた気がする

Usage
--------

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


後からつける予定の機能
-----------------------

* タイムスタンプ
* ぷろぱちー一覧
