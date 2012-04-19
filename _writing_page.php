<div id="writing-page-wrapper">
  <?php
    $title = $_REQUEST['title'];
    $kicker = $_REQUEST['kicker'];
    $link = $_REQUEST['link']
  ?>
  <header class="article-title">
    <hgroup>
      <h3 class="kicker"><?php echo $kicker; ?></h3>
      <h1 class="article-title">
        <?php echo '<a href="' . $link . '">'; ?>
          <?php echo $title ?>
        </a>
      </h1>
  <div id="up" class="control"></div>
  <div class="article-wrapper">
    <div class="article"></div>
  </div>
  <div id="down" class="control"></div>
  <h2 class="article-back-button">Back</h2>