class window.Purse extends Backbone.Model
  
  initialize: (amount, @isPot) ->
    @set 'money', amount
    # @set 'isPot', pot

  addMoney: (amount) ->
    debugger
    current = parseInt @get 'money'
    current += parseInt amount
    @set 'money' , current

  removeMoney: (amount) ->
    current = parseInt @get 'money'
    current -= parseInt amount
    @set 'money' , current
    unless @isPot
      if @get 'money' < 0 then trigger 'bankrupt'