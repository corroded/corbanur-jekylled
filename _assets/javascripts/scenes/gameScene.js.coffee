Corbanur.Scenes.Game = Class.create(Scene,

  initialize: ->
    Scene.apply @

    @TILESIZE = 33
    @MAX_COLS = 8
    @MAX_ROWS = 8

    @VERTICAL_OFFSET = 20
    @HORIZONTAL_OFFSET = 10

    #POINTER STATES
    @PSTATE_DEFAULT = 0
    @PSTATE_SELECTED = 1
    @PSTATE_RELEASE = 2

    @game = Game.instance

    @pointerState = 0

    @units = [[],[],[],[],[],[],[],[]]

    map = new Map(@TILESIZE,@TILESIZE)
    map.image = @game.assets['assets/images/tankbrigade.png']

    mainMap = [
      [4, 4, 4, 4, 4, 4, 4, 4],
      [4, 4, 4, 4, 4, 4, 4, 4],
      [5, 4, 4, 4, 4, 5, 5, 4],
      [5, 4, 4, 4, 4, 5, 5, 4],
      [5, 4, 6, 6, 4, 5, 5, 4],
      [4, 4, 6, 6, 4, 4, 4, 4],
      [4, 4, 6, 6, 4, 4, 4, 4],
      [4, 4, 4, 4, 4, 4, 4, 4]
    ]
    map.loadData mainMap
    @addChild map

    # add the ranger
    @ranger = new Corbanur.Units.Ranger()

    @addChild @ranger

    @addEventListener Event.TOUCH_START, @getTileCoords

    @units[0][0] = @ranger

    @selectedUnit = undefined

  getRowNum: (yCoord)->
    return 7 if yCoord >= 264
    Math.floor((yCoord-@VERTICAL_OFFSET)/@TILESIZE)

  getColumnNum: (xCoord) ->
    return 7 if xCoord >= 264
    Math.floor((xCoord-@HORIZONTAL_OFFSET)/@TILESIZE)

  getTileCoords: (evt) ->
    yTileCoord = @getRowNum evt.y
    xTileCoord = @getColumnNum evt.x

    switch @pointerState
      when @PSTATE_DEFAULT
        if @units[xTileCoord][yTileCoord] != undefined
          @selectedUnit = @units[xTileCoord][yTileCoord]
          @pointerState = @PSTATE_SELECTED
        else
          console.log "NO UNIT"

      when @PSTATE_SELECTED
        if @units[xTileCoord][yTileCoord] == undefined
          @units[xTileCoord][yTileCoord] = @selectedUnit
          @moveUnitTo @selectedUnit, xTileCoord, yTileCoord
          @pointerState = @PSTATE_DEFAULT

  moveUnitTo: (unit, xTileCoord, yTileCoord) ->
    unit.x = xTileCoord * @TILESIZE
    unit.y = yTileCoord * @TILESIZE

)
