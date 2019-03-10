// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
ready = undefined

// '->' means we are declaring a function and storing it in the 
// variable 'ready'
ready = ->
  // '.sortable' is the class name we provided in the portfolio index
  // We are calling the sortable() function on the sortable div
  $('.sortable').sortable()
  return

// When the page loads ($(document).ready), I want to pass in the ready function
$(document).ready ready