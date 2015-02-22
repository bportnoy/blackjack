class window.Purse extends Backbone.Model
  
  initialize: (amount, @isPot) ->
    @set 'money', amount
    # @set 'isPot', pot

  addMoney: (amount) ->
    @set 'money' , @get 'money' + amount

  removeMoney: (amount) ->
    @set 'money' , @get 'money' - amount
    unless isPot
      if @get 'money' < 0 then trigger 'bankrupt'