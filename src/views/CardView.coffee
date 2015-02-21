class window.CardView extends Backbone.View
  className: 'card'

  # template: _.template '<%= rankName %> of <%= suitName %>'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png" class="cardimg">'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.html '<img src="img/card-back.png" class="cardimg">' unless @model.get 'revealed'

