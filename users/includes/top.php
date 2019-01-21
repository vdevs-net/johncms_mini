<?php

/*
////////////////////////////////////////////////////////////////////////////////
// JohnCMS                Mobile Content Management System                    //
// Project site:          http://johncms.com                                  //
// Support site:          http://gazenwagen.com                               //
////////////////////////////////////////////////////////////////////////////////
// Lead Developer:        Oleg Kasyanov   (AlkatraZ)  alkatraz@gazenwagen.com //
// Development Team:      Eugene Ryabinin (john77)    john77@gazenwagen.com   //
//                        Dmitry Liseenko (FlySelf)   flyself@johncms.com     //
////////////////////////////////////////////////////////////////////////////////
*/

defined('_IN_JOHNCMS') or die('Error: restricted access');
$headmod = 'userstop';
$textl = $lng['users_top'];
require('../incfiles/head.php');

/*
-----------------------------------------------------------------
Функция отображения списков
-----------------------------------------------------------------
*/
function get_top($order = 'postforum') {
    $stmt = core::$db->query("SELECT * FROM `users` WHERE `$order` > 0 ORDER BY `$order` DESC LIMIT 9");

    if ($stmt->rowCount()) {
        $out = '';
        while ($res = $stmt->fetch()) {
            $out .= $i % 2 ? '<div class="list2">' : '<div class="list1">';
            $out .= functions::display_user($res, array ('header' => ('<b>' . $res[$order]) . '</b>')) . '</div>';
            ++$i;
        }
        return $out;
    } else {
        return '<div class="menu"><p>' . $lng['list_empty'] . '</p></div>';
    }
}

/*
-----------------------------------------------------------------
Меню выбора
-----------------------------------------------------------------
*/
$menu = array (
    (!$mod ? '<b>' . $lng['forum'] . '</b>' : '<a href="index.php?act=top">' . $lng['forum'] . '</a>'),
    ($mod == 'guest' ? '<b>' . $lng['guestbook'] . '</b>' : '<a href="index.php?act=top&amp;mod=guest">' . $lng['guestbook'] . '</a>'),
    ($mod == 'comm' ? '<b>' . $lng['comments'] . '</b>' : '<a href="index.php?act=top&amp;mod=comm">' . $lng['comments'] . '</a>')
);
switch ($mod) {
    case 'guest':
        /*
        -----------------------------------------------------------------
        Топ Гостевой
        -----------------------------------------------------------------
        */
        echo '<div class="phdr"><a href="index.php"><b>' . $lng['community'] . '</b></a> | ' . $lng['top_guest'] . '</div>';
        echo '<div class="topmenu">' . functions::display_menu($menu) . '</div>';
        echo get_top('postguest');
        echo '<div class="phdr"><a href="../guestbook/index.php">' . $lng['guestbook'] . '</a></div>';
        break;

    case 'comm':
        /*
        -----------------------------------------------------------------
        Топ комментариев
        -----------------------------------------------------------------
        */
        echo '<div class="phdr"><a href="index.php"><b>' . $lng['community'] . '</b></a> | ' . $lng['top_comm'] . '</div>';
        echo '<div class="topmenu">' . functions::display_menu($menu) . '</div>';
        echo get_top('komm');
        echo '<div class="phdr"><a href="../index.php">' . $lng['homepage'] . '</a></div>';
        break;

    default:
        /*
        -----------------------------------------------------------------
        Топ Форума
        -----------------------------------------------------------------
        */
        echo '<div class="phdr"><a href="index.php"><b>' . $lng['community'] . '</b></a> | ' . $lng['top_forum'] . '</div>';
        echo '<div class="topmenu">' . functions::display_menu($menu) . '</div>';
        echo get_top('postforum');
        echo '<div class="phdr"><a href="../forum/index.php">' . $lng['forum'] . '</a></div>';
}
echo '<p><a href="index.php">' . $lng['back'] . '</a></p>';