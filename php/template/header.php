<?php
    $DOM = file_get_contents("../../html/header.html");
    $DOM = str_replace("<title></title>", "<title>" . $title . "</title>", $DOM);
    $DOM = str_replace('<meta name="description" content="" />', '<meta name="description" content="' . $description . '" />', $DOM);
    $DOM = str_replace('<meta name="keywords" content="" />', '<meta name="keywords" content="' . $keywords . '" />', $DOM);
    $DOM = str_replace('<link rel="canonical" href="localhost" />', '<link rel="canonical" href="localhost' . $page . '.php" />', $DOM);
    $DOM = str_replace('<meta property="og:title" content="" />', '<meta property="og:title" content="' . $title . '" />', $DOM);
    $DOM = str_replace('<meta property="og:description" content="" />', '<meta property="og:description" content="' . $description . '" />', $DOM);
    $DOM = str_replace('<meta property="og:url" content="localhost" />', '<meta property="og:url" content="localhost' . $page . '.php" />', $DOM);

    if(isset($script)) {
        $DOM = str_replace('<script></script>', '<script src="js/' . $script . '.js"></script>', $DOM);
    } else {
        $DOM = str_replace('<script></script>', '', $DOM);
    }

    if(isset($image)) {
        $DOM = str_replace('<meta property="og:image" content="logo_preview" />', '<meta property="og:image" content="logo_preview' . $image . '" />', $DOM);
    }

    session_start();
    $username = get_session_user();
    session_abort();
    
    echo($DOM);
?>