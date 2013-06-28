var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

(function(window) {
  var Hunanori, _createLogger, _getFilename, _getStack,
    _this = this;

  Hunanori = (function() {
    Hunanori.prototype.separator = null;

    Hunanori.prototype.prefix = null;

    function Hunanori() {
      this.error = __bind(this.error, this);
      this.warn = __bind(this.warn, this);
    }

    Hunanori.prototype.log = function(msg, level) {
      return Hunanori.log(msg, level);
    };

    Hunanori.prototype.warn = function(msg) {
      return this.log(msg, Hunanori.WARINING);
    };

    Hunanori.prototype.error = function(msg) {
      return this.log(msg, Hunanori.ERROR);
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
  Hunanori.debug = true;
  Hunanori.level = "info";
  Hunanori.strict = true;
  Hunanori.logger = null;
  Hunanori.prefix = null;
  Hunanori.separator = null;
  Hunanori.stamp = false;
  Hunanori.dd = new Date();
  Hunanori.fileName = "hunanori.min.js";
  Hunanori.setup = function(fileName) {
    return Hunanori.fileName = fileName;
  };
  Hunanori.log = function(msg, level) {
    var fileName, stack;

    if (!Hunanori.debug) {
      return;
    }
    if (Hunanori.strict) {
      stack = _getStack();
      fileName = _getFilename(stack);
    }
    if (Hunanori.prefix) {
      console.log(Hunanori.prefix);
    }
    Hunanori.doLogging(msg, level, fileName);
    if (Hunanori.separator) {
      console.log(Hunanori.separator);
    }
  };
  Hunanori.warn = function(msg) {
    return Hunanori.log(msg, Hunanori.WARINING);
  };
  Hunanori.error = function(msg) {
    return Hunanori.log(msg, Hunanori.ERROR);
  };
  Hunanori.doLogging = function(msg, level, fileName) {
    var args, logger;

    if (level && Hunanori.level !== level) {
      logger = _createLogger(level);
    } else {
      if (!Hunanori.logger) {
        Hunanori.logger = _createLogger(Hunanori.level);
      }
      logger = Hunanori.logger;
    }
    if (Hunanori.stamp) {
      msg += "  [" + Hunanori.dd.toString() + "]";
    }
    if (Hunanori.strict) {
      args = [fileName, msg];
    } else {
      args = [msg];
    }
    if (logger.apply) {
      logger.apply(console, args);
    } else {
      args = Array.prototype.slice.apply(args).join(' ');
      logger(args);
    }
  };
  _createLogger = function(level) {
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
  };
  _getFilename = function(stack) {
    var fileName, match, reg, str;

    while (stack.length > 0) {
      str = stack.shift();
      if (str.indexOf('.js') < 0) {
        continue;
      }
      reg = new RegExp(Hunanori.fileName, "i");
      if (str.match(/.js/i) && !str.match(reg)) {
        match = str.match(/\w+.js:\d+/);
        fileName = match[0];
        return fileName + "=> ";
      }
    }
  };
  _getStack = function() {
    var caller, e, stack;

    try {
      stack = new Error().stack.split('\n');
      return stack;
    } catch (_error) {
      e = _error;
      if (e.hasOwnProperty("stack")) {
        return e.stack.split('\n');
      } else {
        stack = [];
        caller = arguments.callee;
        while (caller) {
          stack.push(caller.toString());
          caller = caller.caller;
          console.log(caller);
        }
        return stack;
      }
    }
  };
  return window.Hunanori = Hunanori;
})(window);
