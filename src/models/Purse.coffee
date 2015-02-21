class window.Purse extends Backbone.Model
  
  initialize: (amount,isPot) ->
    @set
      money: 100
      isPot: isPot

  addMoney: (amount) ->
    @set 'money' , @get 'money' + amount

  removeMoney: (amount) ->
    @set 'money' , @get 'money' - amount
    unless isPot
      if @get 'money' < 0 then trigger 'bankrupt'