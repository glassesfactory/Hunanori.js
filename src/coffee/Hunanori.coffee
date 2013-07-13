do(window)->
  class Hunanori
    separator: null
    prefix: null
    constructor:()->

    log:(msg, level)->
      Hunanori.log(msg, level)

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
  Hunanori.strict  = true
  Hunanori.logger = null
  Hunanori.prefix = null
  Hunanori.separator = null
  Hunanori.stamp = false
  Hunanori.isLogStacking = false
  Hunanori.logStack = []
  Hunanori.maxLogStack = 20
  Hunanori.dd = new Date()
  Hunanori.fileName = "hunanori.min.js"

  Hunanori.setup =(fileName)->
    Hunanori.fileName = fileName

  Hunanori.log =(msg, level)=>
    # if not Hunanori.debug
    #   return
    if Hunanori.strict
      stack = _getStack()
      fileName = _getFilename(stack)

    if Hunanori.prefix and Hunanori.debug
      console.log Hunanori.prefix
    logedMsg = Hunanori.doLogging(msg, level, fileName)
    if Hunanori.isLogStacking
      if Hunanori.logStack.length >= Hunanori.maxLogStack
        Hunanori.logStack.shift()
      Hunanori.logStack.push logedMsg
    if Hunanori.separator and Hunanori.debug
      console.log Hunanori.separator
    return

  Hunanori.warn =(msg)=>
    Hunanori.log(msg, Hunanori.WARINING)

  Hunanori.error =(msg)=>
    Hunanori.log(msg, Hunanori.ERROR)

  Hunanori.doLogging =(msg, level, fileName)=>
    if level and Hunanori.level isnt level
      logger = _createLogger(level)
    else
      if not Hunanori.logger
        Hunanori.logger = _createLogger(Hunanori.level)
      logger = Hunanori.logger
    msgObj = {
      "fileName":fileName.replace('=> ', '')
      "msg":msg
    }
    if Hunanori.stamp
      time = Hunanori.dd.toString()
      msg += "    [" + time + "]"
      msgObj["loged_at"] = time

    if Hunanori.strict
      # Chrome と Firefox だけ…
      # args = ["%c"+fileName, "color:red;font-weight:bold;", msg]
      args = [fileName, msg]
    else
      args = [msg]
    if not Hunanori.debug
      return msgObj
    if logger.apply
      logger.apply(console, args)
    else
      args = Array.prototype.slice.apply(args).join(' ')
      logger(args)
    return msgObj

  _createLogger=(level)->
    if level not in Hunanori.LOG_LEVELS
      throw new Error("log level is undefined.")

    if level is "info"
      return console.log
    else if level is "error"
      return console.error
    else if level is "warning"
      return console.warn


  _getFilename=(stack)->
    while stack.length > 0
      str = stack.shift()
      if str.indexOf('.js') < 0
        continue
      reg = new RegExp(Hunanori.fileName, "i")
      if str.match(/.js/i) and not str.match(reg)
        match = str.match(/\w+.js:\d+/)
        fileName = match[0]
        return fileName + "=> "
    return


  _getStack =()->
    try
      stack = new Error().stack.split('\n')
      return stack
    catch e
      if e.hasOwnProperty("stack")
        return e.stack.split('\n')
      else
        stack = []
        caller = arguments.callee
        while caller
          stack.push caller.toString()
          caller = caller.caller
          console.log caller
        return stack
    return

  window.Hunanori = Hunanori
