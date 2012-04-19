$ ->
  content = $('#content-wrapper')
  nav = $('nav#primary-menu-wrapper')
  
  intro_animation = () ->
    content.animate(
      'left': '0',
      1000,
      ->
        nav.animate
          'top': '0',
          1000
    )
  
  intro_animation()
    