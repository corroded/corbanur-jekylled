#= require vendor/jquery
#= require vendor/enchant
#= require enchantInit
#= require_tree ./models
#
game = new Game(320, 320)
game.preload 'assets/images/tankbrigade.png', 'assets/images/ranger_f.png'
game.onload = ->
  scene = new Scene()
  map = new Map(33,33)
  map.image = game.assets['assets/images/tankbrigade.png']

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
  scene.addChild map

  ranger = new Ranger()

  scene.addChild ranger

  game.pushScene scene

game.start()
