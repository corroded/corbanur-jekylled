#= require vendor/jquery
#= require vendor/enchant
#= require enchantInit
#= require_tree ./scenes
#= require_tree ./models
#

window.onload = =>
  game = new Game(264, 264)
  game.preload 'assets/images/tankbrigade.png', 'assets/images/ranger_f.png'
  game.fps = 30
  game.scale = 1

  game.onload = =>
    gameScene = new Corbanur.Scenes.Game()

    game.pushScene gameScene

  window.scrollTo(0,0)
  game.start()
