class window.GameView extends Backbone.View
  
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="new-game-button" disabled>New Game</button>
    <h3 class="game-status">Hit or stand?</h3>
    <div class="player-purse-container"></div>
    <div class="pot-container"></div>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('playerHand').stand()
    'click .new-game-button': -> @model.newGame()

  initialize: ->
    @render()
    @model.on 'change:busted', ->
      @$el.css 'background-color', 'red'
      @disableButtons()
    , @

    @model.on 'change:winner', ->
       switch @model.get 'winner'
         when 'player' then @win()
         when 'dealer' then @lose()
         when 'draw' then @draw()
       @disableButtons()
     , @

   win: ->
     @$('.game-status').css 'color', 'green'
     @$('.game-status').text 'You win! Play again?'

   lose: ->
     @$('.game-status').css 'color', 'red'
     @$('.game-status').text 'Sorry, you lose. Play again?'

   draw: ->
     @$('.game-status').css 'color', 'blue'
     @$('.game-status').text 'It\'s a draw! Play again?'

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-purse-container').html new PurseView(model: @model.get 'playerPurse').el
    @$('.pot-container').html new PurseView(model: @model.get 'pot').el
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @el

  disableButtons: ->
    @$('.hit-button').prop('disabled',true)
    @$('.stand-button').prop('disabled',true)
    @$('.new-game-button').prop('disabled',false)