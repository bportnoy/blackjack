class window.AppView extends Backbone.View

  template: _.template '
    <div class="game-container"></div>
  '

  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.game-container').html new GameView(model: @.model.get 'game').el

