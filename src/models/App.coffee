# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'game', game = new Game(deck:@get 'deck')
    @set 'previousGames', []
    (@get 'game').on 'new-game', @newGame, @

  newGame: ->
    (@get 'previousGames').push(@get 'game')
    @set 'game', game = new Game()
    (@get 'game').on 'new-game', @newGame, @
    null