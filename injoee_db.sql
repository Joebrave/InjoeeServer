-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2014 年 04 月 15 日 14:42
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `injoee_db`
--
CREATE DATABASE IF NOT EXISTS `injoee_db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `injoee_db`;

-- --------------------------------------------------------

--
-- 表的结构 `games`
--

CREATE TABLE IF NOT EXISTS `games` (
  `game_name` text NOT NULL,
  `game_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `game_type` text NOT NULL,
  `game_category` enum('ZIP','APK','DPK') NOT NULL,
  `game_description` text NOT NULL,
  `game_icon` text NOT NULL,
  `game_package_name` text NOT NULL,
  `game_package_size` float NOT NULL,
  `game_download_url` text NOT NULL,
  `game_obb_package_name` text NOT NULL,
  `game_obb_download_url` text NOT NULL,
  `game_screenshots` text NOT NULL,
  `good_votes` int(11) NOT NULL DEFAULT '0',
  `bad_votes` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `games`
--

INSERT INTO `games` (`game_name`, `game_id`, `game_type`, `game_category`, `game_description`, `game_icon`, `game_package_name`, `game_package_size`, `game_download_url`, `game_obb_package_name`, `game_obb_download_url`, `game_screenshots`, `good_votes`, `bad_votes`) VALUES
('The King of Fighter 96', 1, 'Fighting Game', 'ZIP', 'GAME FEATURES\r\nFrom art direction to gameplay, THE KING OF FIGHTERS Android brings the complete KOF experience to the Android platforms. The gorgeous graphics of the world-famous fighting series have been faithfully recreated, taking full advantage of the latest Android hardware. The use of the Virtual Pad/Joystick perfectly reproduces KOF’s controls, creating a simple, user-friendly play-style to easily perform special moves and combinations.\r\nFive modes of gameplay! \r\n“THE KING OF FIGHTERS Android” features five game modes: “Team Battle” for classic KOF 3-on-3 battles, “Single Battle” for 1-on-1 fights, “Endless” mode for an endurance challenge with just one life, “Challenge” mode where players needs to complete a variety of character-specific tasks, and “Training” mode where players can practice the Virtual Pad-based controls and learn combos.\r\nFighters battle for glory!\r\nThe formidable roster of “THE KING OF FIGHTERS Android” features classic characters, including Kyo Kusanagi, K’, Ash Crimson, and Billy Kane!\r\nUnlock trading cards, illustrations and other bonus content!\r\nVarious bonus content can be unlocked during gameplay and viewed within the game’s “Gallery” mode. Here players will find premium trading cards based on original SNK PLAYMORE illustrations, various art and rough sketches of KOF characters, KOF Team novel stories from the THE KING OF FIGHTERS XIII and many more hidden treasures that fans can’t afford to miss!\r\n\r\nWinner is -- you!', 'http://bcs.duapp.com/injoee/ArcadeGame/KOF96/icon2.png', 'test_pkg_name', 14.5, 'http://game_download_url', '', '', 'http://bcs.duapp.com/injoee/ArcadeGame/KOF96/pic4_1.png,http://bcs.duapp.com/injoee/ArcadeGame/KOF96/pic1_2.png,http://bcs.duapp.com/injoee/ArcadeGame/KOF96/pic3_1.png,http://bcs.duapp.com/injoee/ArcadeGame/KOF96/pic1_1.png', 9, 7),
('Flappy Bird', 2, 'Action', 'APK', 'Android popular game, it is made by a vietaname company!', 'http://bcs.duapp.com/injoee/FreeGame/FlappyBird/20140212010710.png', 'com.flappy', 32.89, 'http://download.flappy.bird.com', 'com.bird.flappy', 'http://obb.flappy.bird.com', 'http://bcs.duapp.com/injoee/FreeGame/FlappyBird/QQ20140212011117.png,http://bcs.duapp.com/injoee/FreeGame/FlappyBird/QQ20140212011033.png,http://bcs.duapp.com/injoee/FreeGame/FlappyBird/QQ20140212011117.png,http://bcs.duapp.com/injoee/FreeGame/FlappyBird/QQ20140212011117.png', 46, 41);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
