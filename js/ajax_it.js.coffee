$ ->
  
  lis = $('li.primary-menu-li')
  content = $('#content-wrapper')
  about_li = $('li#about')
  design_li = $('li#design')
  writing_li = $('li#writing')
  design_thumb = $('img.design-thumb')
    
        
  # ON ABOUT CLICK
  about_li.click ->
    unless about_li.hasClass( 'current' )
      callback = () ->
        $.ajax
          cache: false
          method: 'POST'
          url: "_#{$(about_li).data( 'page' )}.html"
          success: ( data ) ->
            $('#content-wrapper').html( data )
            window.delay( 500, window.about_animation )
            lis.removeClass( 'current' )
            about_li.addClass( 'current' )
      content_deanimate( callback )


  # ON DESIGN CLICK
  design_li.click ->
    unless design_li.hasClass('current')  
      callback = () ->
        $.ajax
          cache: false
          method: 'POST'
          url: "_#{design_li.data( 'page' )}.html"
          success: (data) ->
            $('#content-wrapper').html( data )
            window.delay( 500, window.design_animation )
            lis.removeClass( 'current' )
            design_li.addClass( 'current' )
      content_deanimate( callback )
      
  
  # ON WRITING CLICK
  writing_li.click ->
    unless writing_li.hasClass('current')
      callback = () ->
        $.ajax
          cache: false
          method: 'POST'
          url: "_#{writing_li.data( 'page' )}.html"
          success: (data) ->
            content.html( data )
            window.delay( 500, window.writing_animation )
            lis.removeClass( 'current' )
            writing_li.addClass( 'current' )
      content_deanimate( callback )
          
          
          
          
          
          

          
      
    
        
      