Ranger = Class.create(Sprite,

  initialize: ->

    # Call superclass constructor
    Sprite.apply this, [32, 36]
    @image = Game.instance.assets['assets/images/ranger_f.png']
    @animationDuration = 0
    @addEventListener Event.ENTER_FRAME, @updateAnimation

  updateAnimation: (evt) ->
    @animationDuration += evt.elapsed * 0.001
    if @animationDuration >= 0.25
      @frame = (@frame + 1) % 3
      @animationDuration -= 0.25
)
