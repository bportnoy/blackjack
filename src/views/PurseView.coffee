class window.PurseView extends Backbone.View
  className: 'purse'

  template: _.template '<h4><% if(isPot){ %>In the pot:<% }else{ %>You have<% } %> $<span class="money"></span></h4>'

  initialize: ->
    @model.on 'change', => @render()
    @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model
    @$('.money').text @model.get 'money'
    # @collection
    # @$el.append @collection.map (card) ->
    #   new CardView(model: card).$el
    # @$('.score').text @collection.scores()[0]

