Corbanur.Scenes.Game = Class.create(Scene,

  initialize: ->
    Scene.apply @

    map = new Map(33,33)
    map.image = Game.instance.assets['assets/images/tankbrigade.png']

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

    # # add the ranger
    ranger = new Corbanur.Units.Ranger()

    @addChild ranger
)
