$ ->
  window.image_animation = ( func, speed ) ->
        
    # Create the empty imgs array
    imgs = []
    
    # Push each jQuery image object into the array
    $('img.design-thumb').each -> imgs.push( $(this) )
      
    # Create an pseudo-random ordering
    ordering = [ 2, 4, 5, 1, 0, 7, 3, 6 ]
    
    # Define a recursive image_toggle function,
    # which will actually do the work
    img_toggle = ( i ) ->
      
      # Grab the ordering with the index that's passed in
      # and toggle it as a slide, slowly, and as the callback
      # either incriment the index and call the function or
      # call the passed-in callback funciton.
      imgs[ordering[i]].toggle(
        'slide'
        speed
        ->
          i++
          if i < imgs.length
            img_toggle( i )
          else
            func()
      )
    
    # actually call the damn thing
    img_toggle( 0 )