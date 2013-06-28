Hunanori.setup("Hunanori.js")

spyMethod =()->
  console.log "spy"

describe "Hunanori", ->
  describe "static", ->

    it "shuld out put log", ->
