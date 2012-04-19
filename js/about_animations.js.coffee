$ ->
  
  content = $('#content-wrapper')

  # ABOUT ANIMATION 
  window.about_animation = () ->
    p = $('#about-wrapper #p-wrapper')
    p.css( 'margin-top', -(p.height() / 2) )
    content.animate(
      'left': 0,
      1000,
      ->
    )