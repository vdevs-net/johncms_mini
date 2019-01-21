<?php

/**
 * @package     JohnCMS
 * @link        http://johncms.com
 * @copyright   Copyright (C) 2008-2011 JohnCMS Community
 * @license     LICENSE.txt (see attached file)
 * @version     VERSION.txt (see attached file)
 * @author      http://johncms.com/about
 */

defined('_IN_JOHNCMS') or die('Restricted access');

class counters
{
    /*
    -----------------------------------------------------------------
    Статистика Форума
    -----------------------------------------------------------------
    */
    static function forum()
    {
        $file = ROOTPATH . 'files/cache/count_forum.dat';
        $new = '';
        if (file_exists($file) && filemtime($file) > (time() - 600)) {
            $res = unserialize(file_get_contents($file));
            $top = $res['top'];
            $msg = $res['msg'];
        } else {
            $top = core::$db->query("SELECT COUNT(*) FROM `forum` WHERE `type` = 't' AND `close` != '1'")->fetchColumn();
            $msg = core::$db->query("SELECT COUNT(*) FROM `forum` WHERE `type` = 'm' AND `close` != '1'")->fetchColumn();
            file_put_contents($file, serialize(array('top' => $top, 'msg' => $msg)));
        }
        if (core::$user_id && ($new_msg = self::forum_new()) > 0) {
            $new = '&#160;/&#160;<span class="red"><a href="' . core::$system_set['homeurl'] . '/forum/index.php?act=new">+' . $new_msg . '</a></span>';
        }
        return $top . '&#160;/&#160;' . $msg . $new;
    }

    /*
    -----------------------------------------------------------------
    Счетчик непрочитанных тем на форуме
    -----------------------------------------------------------------
    $mod = 0   Возвращает число непрочитанных тем
    $mod = 1   Выводит ссылки на непрочитанное
    -----------------------------------------------------------------
    */
    static function forum_new($mod = 0)
    {
        if (core::$user_id) {
            $total = core::$db->query("SELECT COUNT(*) FROM `forum`
                LEFT JOIN `cms_forum_rdm` ON `forum`.`id` = `cms_forum_rdm`.`topic_id` AND `cms_forum_rdm`.`user_id` = '" . core::$user_id . "'
                WHERE `forum`.`type`='t'" . (core::$user_rights >= 7 ? "" : " AND `forum`.`close` != '1'") . "
                AND (`cms_forum_rdm`.`topic_id` Is Null
                OR `forum`.`time` > `cms_forum_rdm`.`time`)")->fetchColumn();
            if ($mod) {
                return '<a href="index.php?act=new&amp;do=period">' . core::$lng['show_for_period'] . '</a>' .
                ($total ? '<br/><a href="index.php?act=new">' . core::$lng['unread'] . '</a>&#160;<span class="red">(<b>' . $total . '</b>)</span>' : '');
            } else {
                return $total;
            }
        } else {
            if ($mod) {
                return '<a href="index.php?act=new">' . core::$lng['last_activity'] . '</a>';
            } else {
                return false;
            }
        }
    }

    /*
    -----------------------------------------------------------------
    Статистика гостевой
    -----------------------------------------------------------------
    $mod = 1    колличество новых в гостевой
    $mod = 2    колличество новых в Админ-Клубе
    -----------------------------------------------------------------
    */
    static function guestbook($mod = 0)
    {
        $count = 0;
        switch ($mod) {
            case 1:
                $count = core::$db->query("SELECT COUNT(*) FROM `guest` WHERE `adm`='0' AND `time` > '" . (time() - 86400) . "'")->fetchColumn();
                break;

            case 2:
                if (core::$user_rights >= 1)
                    $count = core::$db->query("SELECT COUNT(*) FROM `guest` WHERE `adm`='1' AND `time` > '" . (time() - 86400) . "'")->fetchColumn();
                break;

            default:
                $count = core::$db->query("SELECT COUNT(*) FROM `guest` WHERE `adm`='0' AND `time` > '" . (time() - 86400) . "'")->fetchColumn();
                if (core::$user_rights >= 1) {
                    $count_adm = core::$db->query("SELECT COUNT(*) FROM `guest` WHERE `adm`='1' AND `time`>'" . (time() - 86400) . "'")->fetchColumn();
                    $count = $count . '&#160;/&#160;<span class="red"><a href="guestbook/index.php?act=ga&amp;do=set">' . $count_adm . '</a></span>';
                }
        }
        return $count;
    }

    /*
    -----------------------------------------------------------------
    Счетчик посетителей онлайн
    -----------------------------------------------------------------
    */
    static function online()
    {
        $file = ROOTPATH . 'files/cache/count_online.dat';
        if (file_exists($file) && filemtime($file) > (time() - 10)) {
            $res = unserialize(file_get_contents($file));
            $users = $res['users'];
            $guests = $res['guests'];
        } else {
            $users = core::$db->query("SELECT COUNT(*) FROM `users` WHERE `lastdate` > '" . (time() - 300) . "'")->fetchColumn();
            $guests = core::$db->query("SELECT COUNT(*) FROM `cms_sessions` WHERE `lastdate` > '" . (time() - 300) . "'")->fetchColumn();
            file_put_contents($file, serialize(array('users' => $users, 'guests' => $guests)));
        }
        return (core::$user_id || core::$system_set['active'] ? '<a href="' . core::$system_set['homeurl'] . '/users/index.php?act=online">' . functions::image('menu_online.png') . $users . ' / ' . $guests . '</a>' : core::$lng['online'] . ': ' . $users . ' / ' . $guests);
    }

    /*
    -----------------------------------------------------------------
    Колличество зарегистрированных пользователей
    -----------------------------------------------------------------
    */
    static function users()
    {
        $file = ROOTPATH . 'files/cache/count_users.dat';
        if (file_exists($file) && filemtime($file) > (time() - 600)) {
            $res = unserialize(file_get_contents($file));
            $total = $res['total'];
            $new = $res['new'];
        } else {
            $total = core::$db->query("SELECT COUNT(*) FROM `users`")->fetchColumn();
            $new = core::$db->query("SELECT COUNT(*) FROM `users` WHERE `datereg` > '" . (time() - 86400) . "'")->fetchColumn();
            file_put_contents($file, serialize(array('total' => $total, 'new' => $new)));
        }
        if ($new) $total .= '&#160;/&#160;<span class="red">+' . $new . '</span>';
        return $total;
    }
}
