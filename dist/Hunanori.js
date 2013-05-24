var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

(function(window) {
  var Hunanori,
    _this = this;

  Hunanori = (function() {
    Hunanori.prototype.separator = null;

    Hunanori.prototype.prefix = null;

    function Hunanori() {
      this.log = __bind(this.log, this);
    }

    Hunanori.prototype.log = function(msg, level) {
      if (!Hunanori.debug) {
        return;
      }
      if (this.prfix) {
        console.log(this.prefix);
      }
      Hunanori.log(msg, level);
      if (this.separator) {
        return console.log(this.separator);
      }
    };

    return Hunanori;

  })();
  /*
  ---------
    meta
  ---------
  */

  Hunanori.version = 0.1;
  Hunanori.name = "Hunanori";
  Hunanori.LOG_LEVELS = ["info", "error", "warning"];
  Hunanori.INFO = Hunanori.LOG_LEVELS[0];
  Hunanori.ERROR = Hunanori.LOG_LEVELS[1];
  Hunanori.WARINING = Hunanori.LOG_LEVELS[2];
  Hunanori.level = "info";
  Hunanori.logger = null;
  Hunanori.prefix = null;
  Hunanori.separator = null;
  Hunanori.log = function(msg, level) {
    if (!Hunanori.debug) {
      return;
    }
    if (Hunanori.prefix) {
      console.log(prefix);
    }
    Hunanori.doLogging(msg, level);
    if (Hunanori.separator) {
      return console.log(Hunanori.separator);
    }
  };
  Hunanori.doLogging = function(msg, level) {
    var logger;

    if (level && Hunanori.level !== level) {
      logger = _createLogger(level);
    } else {
      if (!Hunanori.logger) {
        Hunanori.logger = _createLogger(Hunanori.level);
      }
      logger = Hunanori.logger;
    }
    return logger(msg);
  };
  ({
    _createLogger: function(level) {
      if (__indexOf.call(Hunanori.LOG_LEVELS, level) < 0) {
        throw new Error("log level is undefined.");
      }
      if (level === "info") {
        return console.log;
      } else if (level === "error") {
        return console.error;
      } else if (level === "warning") {
        return console.warn;
      }
    }
  });
  return window.Hunanori = Hunanori;
})(window);
