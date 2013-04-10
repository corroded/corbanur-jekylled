Corbanur.Scenes.Game = Class.create(Scene,

  initialize: ->
    Scene.apply @

    @TILESIZE = 33
    @MAX_COLS = 8
    @MAX_ROWS = 8

    @VERTICAL_OFFSET = 20
    @HORIZONTAL_OFFSET = 10

    @game = Game.instance

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

  getRowNum: (yCoord)->
    Math.floor((yCoord-@VERTICAL_OFFSET)/@TILESIZE)

  getColumnNum: (xCoord) ->
    Math.floor((xCoord-@HORIZONTAL_OFFSET)/@TILESIZE)

  getTileCoords: (evt) ->
    yTileCoord = @getRowNum evt.y
    xTileCoord = @getColumnNum evt.x

    if @units[xTileCoord][yTileCoord] != undefined
      selectedUnit = @units[xTileCoord][yTileCoord]
      console.log 'selected a unit'
    else
      console.log "NO UNIT"
)
