# Place all the behaviors and hooks related to the matching controller here.

$ ->
  $('#recipes').imagesLoaded ->
    $('#recipes').masonry
      itemSelector: '.box'
      isFitWidth: true
      
# All this logic will automatically be available in application.js.