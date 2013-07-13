var Example,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

(function(window) {
  return window.onload = function() {
    var hoge;

    Hunanori.log("loaded");
    Hunanori.isLogStacking = true;
    Hunanori.debug = false;
    Hunanori.stamp = true;
    hoge = new Example();
    Hunanori.separator = "▂▅▇█▓▒░('ω')░▒▓█▇▅▂うわあああああああ";
    Hunanori.log("航路間違えた");
    hoge.abunai();
    Hunanori.prefix = "=͟͟͞͞─＝＿=͟͟͞͞￣三(Г ﾟ 〆ﾟ )Г=͟͟͞͞＿＝=͟͟͞͞─=͟͟͞͞三￣";
    hoge.yabai();
    return console.log(Hunanori.logStack);
  };
})(window);

/*
  Hunanori を継承したインスタンスを作るパターン
*/


Example = (function(_super) {
  __extends(Example, _super);

  function Example() {
    this.log("ソイヤ");
  }

  Example.prototype.abunai = function() {
    return this.warn("waaaaaa");
  };

  Example.prototype.yabai = function() {
    return this.error("うーっ(∩´･ω･｀)∩　　　　豆腐(∩´･ω･｀⊂)　　　　:( ﾞﾟ'ωﾟ'）:ウウウオオオアアアーーー！！！");
  };

  return Example;

})(Hunanori);
