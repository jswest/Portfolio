$ ->
  content = $('#content-wrapper')
  
  window.delay = ( ms, func ) ->
    setTimeout( func, ms )
  
  
  # CONTENT DEANIMATE  
  window.content_deanimate = ( callback ) ->
    content.animate(
      'left': -content.width(),
      1000,
      ->
        callback()
    )