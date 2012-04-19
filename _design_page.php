<div id="design-page-wrapper">
  <?php
    $design = $_REQUEST['design'];
    $name = $_REQUEST['name'];
  ?>
  <header class="design-header">
    <hgroup>
      <h1><?php echo $name; ?></h1>
    </hgroup>
  </header>
  <div class="main-design-img-wrapper">
    <img src="images/<?php echo $design; ?>.png" />
  </div>
  <div class="design-blurb"></div>
  <div class="design-thumbs-wrapper">
  <?php
    for( $i = 1; $i <= 3; $i++ ) {
  ?>
        <img class="design-thumb" src="images/<?php echo $design . $i; ?>.png" />
  <?php
    }
  ?>
    <img class="design-thumb" src="images/<?php echo $design; ?>.png">
  </div>
  <h2 class="design-back-button">Back</p>
</div>
