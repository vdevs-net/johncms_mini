-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th9 18, 2018 lúc 06:17 SA
-- Phiên bản máy phục vụ: 5.7.16-log
-- Phiên bản PHP: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `mini`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_ads`
--

CREATE TABLE `cms_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `view` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `layout` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `count_link` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` text NOT NULL,
  `link` text NOT NULL,
  `to` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `color` varchar(10) NOT NULL DEFAULT '',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `day` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mesto` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `bold` tinyint(1) NOT NULL DEFAULT '0',
  `italic` tinyint(1) NOT NULL DEFAULT '0',
  `underline` tinyint(1) NOT NULL DEFAULT '0',
  `show` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_ban_ip`
--

CREATE TABLE `cms_ban_ip` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip1` bigint(11) NOT NULL DEFAULT '0',
  `ip2` bigint(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '0',
  `link` varchar(100) NOT NULL,
  `who` varchar(25) NOT NULL,
  `reason` text NOT NULL,
  `date` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_ban_users`
--

CREATE TABLE `cms_ban_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `ban_time` int(11) NOT NULL DEFAULT '0',
  `ban_while` int(11) NOT NULL DEFAULT '0',
  `ban_type` tinyint(4) NOT NULL DEFAULT '1',
  `ban_who` varchar(30) NOT NULL DEFAULT '',
  `ban_ref` int(11) NOT NULL DEFAULT '0',
  `ban_reason` text NOT NULL,
  `ban_raz` varchar(30) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_contact`
--

CREATE TABLE `cms_contact` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `from_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT '1',
  `friends` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `ban` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `man` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_forum_files`
--

CREATE TABLE `cms_forum_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `cat` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `subcat` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `post` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `filename` text NOT NULL,
  `filetype` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `dlcount` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `del` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_forum_rdm`
--

CREATE TABLE `cms_forum_rdm` (
  `topic_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cms_forum_rdm`
--

INSERT INTO `cms_forum_rdm` (`topic_id`, `user_id`, `time`) VALUES
(3, 1, 1534133251);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_forum_vote`
--

CREATE TABLE `cms_forum_vote` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `topic` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_forum_vote_users`
--

CREATE TABLE `cms_forum_vote_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(11) NOT NULL DEFAULT '0',
  `topic` int(11) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_mail`
--

CREATE TABLE `cms_mail` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `from_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `read` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `sys` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `delete` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `them` varchar(100) NOT NULL DEFAULT '',
  `spam` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_sessions`
--

CREATE TABLE `cms_sessions` (
  `session_id` char(32) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` varchar(255) NOT NULL DEFAULT '',
  `lastdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `sestime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `movings` smallint(5) UNSIGNED NOT NULL DEFAULT '0',
  `place` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_settings`
--

CREATE TABLE `cms_settings` (
  `key` tinytext NOT NULL,
  `val` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `cms_settings`
--

INSERT INTO `cms_settings` (`key`, `val`) VALUES
('active', '1'),
('admp', 'panel'),
('antiflood', 'a:5:{s:4:\"mode\";i:2;s:3:\"day\";i:10;s:5:\"night\";i:30;s:7:\"dayfrom\";i:10;s:5:\"dayto\";i:22;}'),
('clean_time', '1534664586'),
('copyright', 'Powered by JohnCMS'),
('email', '@'),
('flsz', '4000'),
('gzip', '1'),
('homeurl', 'http://john.pro'),
('lng', 'en'),
('mod_reg', '2'),
('mod_forum', '2'),
('mod_guest', '2'),
('meta_desc', 'Powered by JohnCMS http://johncms.com'),
('meta_key', 'johncms'),
('news', 'a:8:{s:4:\"view\";i:1;s:4:\"size\";i:200;s:8:\"quantity\";i:5;s:4:\"days\";i:3;s:6:\"breaks\";i:1;s:7:\"smileys\";i:1;s:4:\"tags\";i:1;s:3:\"kom\";i:1;}'),
('reg_message', ''),
('setting_mail', 'a:2:{s:11:\"cat_friends\";i:0;s:15:\"message_include\";i:0;}'),
('skindef', 'default'),
('them_message', ''),
('timeshift', '0'),
('site_access', '2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_users_data`
--

CREATE TABLE `cms_users_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `key` varchar(30) NOT NULL DEFAULT '',
  `val` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_users_guestbook`
--

CREATE TABLE `cms_users_guestbook` (
  `id` int(10) UNSIGNED NOT NULL,
  `sub_id` int(10) UNSIGNED NOT NULL,
  `time` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `text` text NOT NULL,
  `reply` text NOT NULL,
  `attributes` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cms_users_iphistory`
--

CREATE TABLE `cms_users_iphistory` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `forum`
--

CREATE TABLE `forum` (
  `id` int(10) UNSIGNED NOT NULL,
  `refid` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `type` char(1) NOT NULL DEFAULT '',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `from` varchar(25) NOT NULL DEFAULT '',
  `realid` int(3) NOT NULL DEFAULT '0',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `soft` text NOT NULL,
  `text` text NOT NULL,
  `close` tinyint(1) NOT NULL DEFAULT '0',
  `close_who` varchar(25) NOT NULL DEFAULT '',
  `vip` tinyint(1) NOT NULL DEFAULT '0',
  `edit` text NOT NULL,
  `tedit` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `kedit` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `curators` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `forum`
--

INSERT INTO `forum` (`id`, `refid`, `type`, `time`, `user_id`, `from`, `realid`, `ip`, `ip_via_proxy`, `soft`, `text`, `close`, `close_who`, `vip`, `edit`, `tedit`, `kedit`, `curators`) VALUES
(1, 0, 'f', 0, 0, '', 1, 0, 0, '\"></textarea><script>alert(\'xss\');</script>', '\"></textarea><script>alert(\'xss\');</script>', 0, '', 0, '0', 0, 0, ''),
(2, 1, 'r', 0, 0, '', 1, 0, 0, '\"></textarea><script>alert(\'xss\');</script>', '\"></textarea><script>alert(\'xss\');</script>', 0, '', 0, '0', 0, 0, ''),
(3, 2, 't', 1534133251, 1, 'admin', 0, 0, 0, '', '\"></textarea><script>alert(\'xss\');</script>', 0, '', 0, '', 0, 0, ''),
(4, 3, 'm', 1534133251, 1, 'admin', 0, 2130706433, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', '\"></textarea><script>alert(\'xss\');</script>', 0, '', 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `guest`
--

CREATE TABLE `guest` (
  `id` int(10) UNSIGNED NOT NULL,
  `adm` tinyint(1) NOT NULL DEFAULT '0',
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `name` varchar(25) NOT NULL DEFAULT '',
  `text` text NOT NULL,
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `browser` tinytext NOT NULL,
  `admin` varchar(25) NOT NULL DEFAULT '',
  `otvet` text NOT NULL,
  `otime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edit_who` varchar(20) NOT NULL DEFAULT '',
  `edit_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `edit_count` tinyint(3) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `avt` varchar(25) NOT NULL DEFAULT '',
  `name` text NOT NULL,
  `text` text NOT NULL,
  `kom` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `time`, `avt`, `name`, `text`, `kom`) VALUES
(1, 1534304362, 'admin', '\"></textarea><script>alert(\'xss\');</script>', '\"></textarea><script>alert(\'xss\');</script>', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(25) NOT NULL DEFAULT '',
  `name_lat` varchar(40) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `rights` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `failed_login` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `imname` varchar(50) NOT NULL DEFAULT '',
  `sex` varchar(2) NOT NULL DEFAULT '',
  `komm` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `postforum` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `postguest` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `yearofbirth` int(4) NOT NULL DEFAULT '0',
  `datereg` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastdate` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `mail` varchar(50) NOT NULL DEFAULT '',
  `icq` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `jabber` varchar(50) NOT NULL DEFAULT '',
  `www` varchar(50) NOT NULL DEFAULT '',
  `about` text NOT NULL,
  `live` varchar(100) NOT NULL DEFAULT '',
  `mibile` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(100) NOT NULL DEFAULT '',
  `ip` bigint(11) NOT NULL DEFAULT '0',
  `ip_via_proxy` bigint(11) NOT NULL DEFAULT '0',
  `browser` text NOT NULL,
  `preg` tinyint(1) NOT NULL DEFAULT '0',
  `regadm` varchar(25) NOT NULL DEFAULT '',
  `mailvis` tinyint(1) NOT NULL DEFAULT '0',
  `dayb` int(2) NOT NULL DEFAULT '0',
  `monthb` int(2) NOT NULL DEFAULT '0',
  `sestime` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `total_on_site` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `lastpost` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `rest_code` varchar(32) NOT NULL DEFAULT '',
  `rest_time` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `movings` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `place` varchar(30) NOT NULL DEFAULT '',
  `set_user` text NOT NULL,
  `set_forum` text NOT NULL,
  `set_mail` text NOT NULL,
  `comm_count` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `comm_old` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `smileys` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `name_lat`, `password`, `rights`, `failed_login`, `imname`, `sex`, `komm`, `postforum`, `postguest`, `yearofbirth`, `datereg`, `lastdate`, `mail`, `icq`, `skype`, `jabber`, `www`, `about`, `live`, `mibile`, `status`, `ip`, `ip_via_proxy`, `browser`, `preg`, `regadm`, `mailvis`, `dayb`, `monthb`, `sestime`, `total_on_site`, `lastpost`, `rest_code`, `rest_time`, `movings`, `place`, `set_user`, `set_forum`, `set_mail`, `comm_count`, `comm_old`, `smileys`) VALUES
(1, 'admin', 'admin', '14e1b600b1fd579f47433b88e8d85291', 9, 0, '', 'm', 0, 1, 0, 0, 1533654435, 1534664596, '@', 0, '', '', 'http://john.pro', '', '', '', '', 2130706433, 0, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:61.0) Gecko/20100101 Firefox/61.0', 1, '', 0, 0, 0, 1534664586, 4133, 1534304362, '', 0, 2, 'mainpage', '', '', '', 0, 0, '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `cms_ads`
--
ALTER TABLE `cms_ads`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cms_ban_ip`
--
ALTER TABLE `cms_ban_ip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ip1` (`ip1`),
  ADD UNIQUE KEY `ip2` (`ip2`);

--
-- Chỉ mục cho bảng `cms_ban_users`
--
ALTER TABLE `cms_ban_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `ban_time` (`ban_time`);

--
-- Chỉ mục cho bảng `cms_contact`
--
ALTER TABLE `cms_contact`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_user` (`user_id`,`from_id`),
  ADD KEY `time` (`time`),
  ADD KEY `ban` (`ban`);

--
-- Chỉ mục cho bảng `cms_forum_files`
--
ALTER TABLE `cms_forum_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat` (`cat`),
  ADD KEY `subcat` (`subcat`),
  ADD KEY `topic` (`topic`),
  ADD KEY `post` (`post`);

--
-- Chỉ mục cho bảng `cms_forum_rdm`
--
ALTER TABLE `cms_forum_rdm`
  ADD PRIMARY KEY (`topic_id`,`user_id`),
  ADD KEY `time` (`time`);

--
-- Chỉ mục cho bảng `cms_forum_vote`
--
ALTER TABLE `cms_forum_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `topic` (`topic`);

--
-- Chỉ mục cho bảng `cms_forum_vote_users`
--
ALTER TABLE `cms_forum_vote_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic` (`topic`);

--
-- Chỉ mục cho bảng `cms_mail`
--
ALTER TABLE `cms_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `time` (`time`),
  ADD KEY `read` (`read`),
  ADD KEY `sys` (`sys`),
  ADD KEY `delete` (`delete`);

--
-- Chỉ mục cho bảng `cms_sessions`
--
ALTER TABLE `cms_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `lastdate` (`lastdate`),
  ADD KEY `place` (`place`(10));

--
-- Chỉ mục cho bảng `cms_settings`
--
ALTER TABLE `cms_settings`
  ADD PRIMARY KEY (`key`(30));

--
-- Chỉ mục cho bảng `cms_users_data`
--
ALTER TABLE `cms_users_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `key` (`key`);

--
-- Chỉ mục cho bảng `cms_users_guestbook`
--
ALTER TABLE `cms_users_guestbook`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `cms_users_iphistory`
--
ALTER TABLE `cms_users_iphistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_ip` (`ip`);

--
-- Chỉ mục cho bảng `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refid` (`refid`),
  ADD KEY `type` (`type`),
  ADD KEY `time` (`time`),
  ADD KEY `close` (`close`),
  ADD KEY `user_id` (`user_id`);
ALTER TABLE `forum` ADD FULLTEXT KEY `text` (`text`);

--
-- Chỉ mục cho bảng `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`id`),
  ADD KEY `time` (`time`),
  ADD KEY `ip` (`ip`),
  ADD KEY `adm` (`adm`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name_lat` (`name_lat`),
  ADD KEY `lastdate` (`lastdate`),
  ADD KEY `place` (`place`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `cms_ads`
--
ALTER TABLE `cms_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_ban_ip`
--
ALTER TABLE `cms_ban_ip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_ban_users`
--
ALTER TABLE `cms_ban_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_contact`
--
ALTER TABLE `cms_contact`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_forum_files`
--
ALTER TABLE `cms_forum_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_forum_vote`
--
ALTER TABLE `cms_forum_vote`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_forum_vote_users`
--
ALTER TABLE `cms_forum_vote_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_mail`
--
ALTER TABLE `cms_mail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_users_data`
--
ALTER TABLE `cms_users_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_users_guestbook`
--
ALTER TABLE `cms_users_guestbook`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `cms_users_iphistory`
--
ALTER TABLE `cms_users_iphistory`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `forum`
--
ALTER TABLE `forum`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT cho bảng `guest`
--
ALTER TABLE `guest`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
