# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerPurse', purse = new Purse 100
    (@get 'playerPurse').isPot = false
    @set 'pot', pot = new Purse 0
    (@get 'pot').isPot = true;
    @set 'game', game = new Game(
      deck: @get 'deck'
      playerPurse: @get 'playerPurse'
      pot: @get 'pot')
    @set 'previousGames', []
    (@get 'game').on 'new-game', @newGame, @
    (@get 'game').on 'change:winner' , @disburseWinnings , @


  newGame: ->
    (@get 'previousGames').push(@get 'game')
    if @get('deck').length < 10
      @set 'deck', deck = new Deck()
      console.log 'shuffling deck'
    @set 'game', game = new Game(
      deck: @get 'deck'
      playerPurse: @get 'playerPurse'
      pot: @get 'pot')
    (@get 'game').on 'new-game', @newGame, @
    (@get 'game').on 'change:winner' , @disburseWinnings , @
    null

  disburseWinnings: ->
    pot = @get 'pot'
    purse = @get 'playerPurse'
    winnings = parseInt(pot.total())
    currentPurse = parseInt(purse.total())
    switch (@get 'game').get 'winner'
      when "player"
        winnings = winnings * 2
        currentPurse += winnings
        console.log currentPurse
        purse.set 'money', currentPurse
      when "draw"
        currentPurse += winnings
        purse.set 'money', currentPurse
    pot.set 'money' , 0

