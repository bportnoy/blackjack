class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', @stand, @
    @get('playerHand').on 'hit', @checkScore, @
    @get('dealerHand').on 'game-end', @gameEnd, @
    # @get('dealerHand').on 'bust', 
    @set 'busted', false
    @set 'winner', null

  stand: ->
    @get('dealerHand').dealOut();

  bust: ->
    @set 'busted', true
    console.log 'busted'

  checkScore: ->
    if (@get('playerHand').scores()[0]) > 21
      @bust()

  gameEnd: ->
    console.log 'gE'
    playerScore = @get('playerHand').scores()[0]
    dealerScore = @get('dealerHand').scores()[0]
    if dealerScore > 21
      @set 'winner','player'
    else if dealerScore < playerScore
      @set 'winner','player'
    else if dealerScore == playerScore
      @set 'winner','draw'
    else @set 'winner','dealer'
    @trigger 'game-end'
    null

  newGame: ->
    @trigger 'new-game'
  # hit: ->