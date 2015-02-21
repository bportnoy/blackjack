# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'game', game = new Game()
    @set 'previousGames', []
    (@get 'game').on 'new-game', @newGame, @

  newGame: ->
    # debugger;
    console.log 'ng'
    (@get 'previousGames').push(@get 'game')
    @set 'game', game = new Game()
    (@get 'game').on 'new-game', @newGame, @
    null