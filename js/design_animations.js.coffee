$ ->

  lis = $('li.primary-menu-li')
  content = $('#content-wrapper')
  about_li = $('li#about')
  design_li = $('li#design')
  design_thumb = $('img.design-thumb')

  # DESIGN ANIMATION
  # This defines the main design animation function.
  # When it's called, it animates the content and as
  # a callback, calles the window.image_animation function,
  # which has as a callback the design_image_bindings function
  window.design_animation = () ->
    content.animate(
      'left': 0
      1000,
      ->
        window.image_animation( design_image_bindings, 'fast' )
    )
    
  # DESIGN IMAGE BINDINGS
  # When you click on one of the main design page
  # images, it makes an AJAX request that (eventually)
  # posts the correct sub_design page.
  # Before it gets to the AJAX request, though, it calls
  # the image_animation, which deanimates the thumbnails
  # and then, as a callback, calls the the sub_design_animation
  design_image_bindings = () ->  
    $('.design-thumb-wrapper').click ->
      img = $(this).children( 'img' )
      $.ajax
        cache: false
        method: 'POST'
        data: {
          "design": "#{img.data( 'design' )}"
          "name": "#{img.data( 'name' )}"
        }
        url: "_design_page.php"
        success: (data) ->
          # SUB_DESIGN ANIMATION
          # This defines the sub design animation function.
          # When it's called, it first deanimates the main design page
          # and then animates the content-wrapper in. As a callback to that
          # animation, it calls the design_back_button bindings,
          # the thumbnail_switch bindings, and finally,
          # it calls the get_design_blurb
          sub_design_animation = () ->
            callback = () ->
              content.html( data )
              content.animate(
                'left': 0
                1000,
                ->
                  design_back_button_bindings()
                  thumbnail_switch_bindings()
                  post_design_blurb( img )
              )
            window.content_deanimate( callback )
          window.image_animation( sub_design_animation, 'fast' )


  # POST DESIGN BLURB FUNCTION
  # This function makes an AJAX request
  # that posts the appropriate design blurb.
  # On success, it also centers the design-blurb p
  post_design_blurb = ( img ) ->
    $.ajax
      cache: false
      method: 'POST'
      data: {
        "design": "#{img.data( 'design' )}"
      }
      url: "blurbs/_#{img.data( 'design' )}.html"
      success: (data) ->
        $('.design-blurb').html( data )
        $('.design-blurb p').css( 'margin-top': -$('.design-blurb p').height() / 2 )


  # THUMBNAIL SWITCH BINDINGS
  # When you hover over the sub_design page thumbnails
  # the main design image switches.
  thumbnail_switch_bindings = () ->
    $('img.design-thumb').hover ->
      $('.main-design-img-wrapper img').attr( 'src', $(this).attr('src') )


  # DESIGN BACK BUTTON BINDINGS
  # When you click on the back button, it causes
  # an AJAX request that posts the main design page.
  design_back_button_bindings = () ->
    $('.design-back-button').click ->
      window.content_deanimate( callback )
    callback = () ->
      $.ajax
        cache: false
        method: 'POST'
        url: "_#{design_li.data( 'page' )}.html"
        success: (data) ->
          $('#content-wrapper').html( data )
          delay 500, window.design_animation
  