$ ->
  content = $('#content-wrapper')
  writing_li = $('li#writing')
  writing_menu = $('ul#writing-menu')
  p = 0
  
  up_and_down_bindings = () ->
    wrapper = $('.article-wrapper')
    wh = wrapper.height()
    a = $('.article')
    h = a.height()
    slide = () ->
      a.animate(
        'margin-top': p
      )
    slideup = () ->
      console.log "slideup called"
      p += wh
      slide()
    slidedown = () ->
      console.log "slidedown called"
      p -= wh
      slide()
    bounceup = () ->
      console.log "bounceup called"
      a.animate(
        'margin-top': 100
        ->
          a.animate(
            'margin-top': 0
            ->
              p = 0
          )
      )
    bouncedown = () ->
      console.log "bouncedown called"
      a.animate(
        'margin-top': -h - 100
        ->
          a.animate(
            'margin-top': -h
            ->
              p = -wh
          )
      )
      
    $('.control').click ->
      console.log "pre-p = #{p}"
      if $(this).attr( 'id' ) is 'up'
        if p < 0 and p > -h + 1
          slideup()
        else
          bounceup()
      else if $(this).attr( 'id' ) is 'down'
        if p < -h
          bouncedown()
        else
          slidedown()
      else
        console.log "something has gone horribly wrong"
      console.log "post-p = #{p}"

        
  
  writing_back_button_bindings = () ->
    console.log "writing back button bindings"
    $('.article-back-button').click ->
      console.log "click"
      window.content_deanimate( callback )
    callback = () ->
      $.ajax
        cache: false
        method: 'POST'
        url: "_#{writing_li.data( 'page' )}.html"
        success: (data) ->
          $('#content-wrapper').html( data )
          delay 500, window.writing_animation
  
  sub_writing_bindings = () ->
    writing_menu_lis = $('li.writing-menu-li')
    writing_menu_lis.click ->
      article_title = $(this).data( 'article-name' )
      article_link = $(this).data( 'article-link' )
      article_kicker = $(this).data( 'article-kicker' )
      article_slug = $(this).data( 'article-slug' )
      $.ajax
        cache: false
        method: 'POST'
        data: {
          "title": "#{article_title}"
          "link": "#{article_link}"
          "kicker": "#{article_kicker}"
          "slug": "#{article_slug}"
        }
        url: "_writing_page.php"
        success: ( data ) ->
          callback = () ->  
            content.html( data )
            $.ajax
              cache: false
              method: 'POST'
              data: { "slug": "#{article_slug}" }
              url: "articles/_#{article_slug}.html"
              success: ( data ) ->
                $('.article').html(data)
                animate_writing_page = () ->
                  content.animate(
                    'left': 0,
                    1000,
                    ->
                      writing_back_button_bindings()
                      up_and_down_bindings()
                  )
                delay 500, animate_writing_page
                
          content_deanimate( callback )
  
  
  window.writing_animation = () ->
    content.animate(
      'left': 0,
      1000,
      ->
        sub_writing_bindings()
    )
