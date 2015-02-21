class window.GameView extends Backbone.View
  
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button><button class="new-game-button">New Game</button>
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
        when 'player' then @$el.css 'background-color', 'green'
        when 'dealer' then @$el.css 'background-color', 'red'
        when 'draw' then @$el.css 'background-color', 'blue'
      @render()
      @disableButtons()
    , @

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
    @el

  disableButtons: ->
    @$('.hit-button').prop('disabled',true)
    @$('.stand-button').prop('disabled',true)