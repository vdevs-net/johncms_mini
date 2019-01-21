<?php
/**
 * @package     JohnCMS
 * @link        http://johncms.com
 * @copyright   Copyright (C) 2008-2011 JohnCMS Community
 * @license     LICENSE.txt (see attached file)
 * @version     VERSION.txt (see attached file)
 * @author      http://johncms.com/about
 */

/**
 * Class CleanUser
 *
 * @package JohnCMS
 * @author  Oleg (AlkatraZ) Kasyanov <dev@mobicms.net>
 * @version v.1.0 2015-01-21
 * @since   build 1647
 */
class CleanUser
{
    public function removeUser($clean_id)
    {
        // Удаляем историю нарушений
        core::$db->exec("DELETE FROM `cms_ban_users` WHERE `user_id` = '" . $clean_id . "'");
        // Удаляем историю IP
        core::$db->exec("DELETE FROM `cms_users_iphistory` WHERE `user_id` = '" . $clean_id . "'");
        // Удаляем пользователя
        core::$db->exec("DELETE FROM `users` WHERE `id` = '" . $clean_id . "' LIMIT 1");
    }

    /**
     * Удаляем почту и контакты
     *
     * @param $clean_id
     */
    public function removeMail($clean_id)
    {
        core::$db->exec("DELETE FROM `cms_mail` WHERE `user_id` = '" . $clean_id . "' OR `from_id` = '" . $clean_id . "'");
        core::$db->exec("DELETE FROM `cms_contact` WHERE `user_id` = '" . $clean_id . "' OR `from_id` = '" . $clean_id . "'");
    }

    public function cleanForum($clean_id)
    {
        // Скрываем темы на форуме
        core::$db->exec("UPDATE `forum` SET `close` = '1', `close_who` = 'SYSTEM' WHERE `type` = 't' AND `user_id` = '" . $clean_id . "'");
        // Скрываем посты на форуме
        core::$db->exec("UPDATE `forum` SET `close` = '1', `close_who` = 'SYSTEM' WHERE `type` = 'm' AND `user_id` = '" . $clean_id . "'");
        // Удаляем метки прочтения на Форуме
        core::$db->exec("DELETE FROM `cms_forum_rdm` WHERE `user_id` = '" . $clean_id . "'");
    }

    /**
     * Удаляем личную гостевую
     *
     * @param $clean_id
     */
    public function removeGuestbook($clean_id)
    {
        core::$db->exec("DELETE FROM `cms_users_guestbook` WHERE `sub_id` = '" . $clean_id . "'");
    }

    /**
     * Удаляем все комментарии пользователя
     *
     * @param $clean_id
     */
    public function cleanComments($clean_id)
    {
        $stmt = core::$db->query("SELECT `name` FROM `users` WHERE `id` = " . $clean_id);
        if ($stmt->rowCount()) {
            $res = $stmt->fetch();

            // Удаляем комментарии из личных гостевых
            core::$db->exec("DELETE FROM `cms_users_guestbook` WHERE `user_id` = '" . $clean_id . "'");
            // Удаляем посты из гостевой
            core::$db->exec("DELETE FROM `guest` WHERE `user_id` = '" . $clean_id . "'");
        }
    }

    /**
     * Рекурсивная функция удаления каталогов с файлами
     *
     * @param $dir
     */
    private function removeDir($dir)
    {
        if ($objs = glob($dir . "/*")) {
            foreach ($objs as $obj) {
                is_dir($obj) ? $this->removeDir($obj) : unlink($obj);
            }
        }
        rmdir($dir);
    }
}