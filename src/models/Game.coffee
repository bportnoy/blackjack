class window.Game extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', @stand, @
    @get('playerHand').on 'hit', @checkScore, @
    # @get('dealerHand').on 'bust', 
    @set 'busted', false

  stand: ->
    @get('dealerHand').first().flip()

  bust: ->
    @set 'busted', true
    console.log 'busted'

  checkScore: ->
    if (@get('playerHand').scores()[0]) > 21
      @bust()

  newGame: ->
    @trigger 'new-game'
  # hit: ->