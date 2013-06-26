do(window)->
  window.onload =()->
    # Hunanori.strict = false
    Hunanori.log "loaded"
    hoge = new Example()
    Hunanori.debug = true
    Hunanori.stamp = true
    Hunanori.separator = "▂▅▇█▓▒░('ω')░▒▓█▇▅▂うわあああああああ"
    Hunanori.log "航路間違えた"
    hoge.abunai()
    Hunanori.prefix = "=͟͟͞͞─＝＿=͟͟͞͞￣三(Г ﾟ 〆ﾟ )Г=͟͟͞͞＿＝=͟͟͞͞─=͟͟͞͞三￣"
    hoge.yabai()
###
  Hunanori を継承したインスタンスを作るパターン
###
class Example extends Hunanori
  constructor:()->
    #インスタンス自身にもログが持たれる
    @log "ソイヤ"

  abunai:()->
    @warn("waaaaaa")

  yabai:()->
    @error("うーっ(∩´･ω･｀)∩　　　　豆腐(∩´･ω･｀⊂)　　　　:( ﾞﾟ'ωﾟ'）:ウウウオオオアアアーーー！！！")
