<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title><?php echo $title; ?></title>

    <?php // echo Asset::css('main.css'); ?>
</head>
<body>
    <div id="wrapper">
        <h1><?php echo $title; ?></h1>

        <div id="content">
            <?php echo $content; ?>
        </div>
    </div>
</body>
</html>