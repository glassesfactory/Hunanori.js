do(window)->
  class Hunanori
    separator: null
    prefix: null
    constructor:()->

    log:(msg, level)=>
      if not Hunanori.debug
        return
      if @.prfix
        console.log @.prefix
      Hunanori.log(msg, level)
      if @.separator
        console.log @.separator

    warn:(msg)=>
      @log(msg, Hunanori.WARINING)

    error:(msg)=>
      @log(msg, Hunanori.ERROR)

  ###
  ---------
    meta
  ---------
  ###
  Hunanori.version = 0.1
  Hunanori.name = "Hunanori"
  Hunanori.LOG_LEVELS = ["info", "error", "warning"]
  Hunanori.INFO = Hunanori.LOG_LEVELS[0]
  Hunanori.ERROR = Hunanori.LOG_LEVELS[1]
  Hunanori.WARINING = Hunanori.LOG_LEVELS[2]

  Hunanori.debug = true
  Hunanori.level = "info"
  Hunanori.logger = null
  Hunanori.prefix = null
  Hunanori.separator = null


  Hunanori.log =(msg, level)=>
    if not Hunanori.debug
      return
    if Hunanori.prefix
      console.log prefix
    Hunanori.doLogging(msg, level)
    if Hunanori.separator
      console.log Hunanori.separator

  Hunanori.warn =(msg)=>
    Hunanori.log(msg, Hunanori.WARINING)

  Hunanori.error =(msg)=>
    Hunanori.log(msg, Hunanori.ERROR)

  Hunanori.doLogging =(msg, level)->
    if level and Hunanori.level isnt level
      logger = _createLogger(level)
    else
      if not Hunanori.logger
        Hunanori.logger = _createLogger(Hunanori.level)
      logger = Hunanori.logger
    logger(msg)

  _createLogger:(level)->
    if level not in Hunanori.LOG_LEVELS
      throw new Error("log level is undefined.")

    if level is "info"
      return console.log
    else if level is "error"
      return console.error
    else if level is "warning"
      return console.warn

  window.Hunanori = Hunanori
