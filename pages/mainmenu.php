<?php

/**
 * @package     JohnCMS
 * @link        http://johncms.com
 * @copyright   Copyright (C) 2008-2011 JohnCMS Community
 * @license     LICENSE.txt (see attached file)
 * @version     VERSION.txt (see attached file)
 * @author      http://johncms.com/about
 */

defined('_IN_JOHNCMS') or die('Error: restricted access');

$mp = new mainpage();

/*
-----------------------------------------------------------------
Блок информации
-----------------------------------------------------------------
*/
echo '<div class="phdr"><b>' . $lng['information'] . '</b></div>';
echo $mp->news;
echo '<div class="menu"><a href="news/index.php">' . $lng['news_archive'] . '</a> (' . $mp->newscount . ')</div>' .
    '<div class="menu"><a href="pages/faq.php">' . $lng['information'] . ', FAQ</a></div>';

/*
-----------------------------------------------------------------
Блок общения
-----------------------------------------------------------------
*/
echo '<div class="phdr"><b>' . $lng['dialogue'] . '</b></div>';
// Ссылка на гостевую
if ($set['mod_guest'] || $rights >= 7)
    echo '<div class="menu"><a href="guestbook/index.php">' . $lng['guestbook'] . '</a> (' . counters::guestbook() . ')</div>';
// Ссылка на Форум
if ($set['mod_forum'] || $rights >= 7)
    echo '<div class="menu"><a href="forum/">' . $lng['forum'] . '</a> (' . counters::forum() . ')</div>';

/*
-----------------------------------------------------------------
Блок полезного
-----------------------------------------------------------------
*/    
echo '<div class="phdr"><b>' . $lng['useful'] . '</b></div>';
if ($user_id || $set['active']) {
    echo '<div class="phdr"><b>' . $lng['community'] . '</b></div>' .
        '<div class="menu"><a href="users/index.php">' . $lng['users'] . '</a> (' . counters::users() . ')</div>';
}
echo '<div class="phdr"><a href="http://gazenwagen.com">Gazenwagen</a></div>';
