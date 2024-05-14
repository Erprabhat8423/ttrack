-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 11, 2024 at 10:58 PM
-- Server version: 5.7.44
-- PHP Version: 8.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `salesport_kanha`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_notifications`
--

CREATE TABLE `activity_notifications` (
  `id` int(11) NOT NULL,
  `reg_id` varchar(222) NOT NULL,
  `heading` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `message` text CHARACTER SET utf8,
  `type` varchar(111) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `admin_app_tokens`
--

CREATE TABLE `admin_app_tokens` (
  `id` int(11) NOT NULL,
  `device_id` varchar(100) DEFAULT NULL,
  `fcm_token` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_app_tokens`
--

INSERT INTO `admin_app_tokens` (`id`, `device_id`, `fcm_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(32, '01342ecbc271c483', 'c0keB0zvSF-dmgxS0ZURTB:APA91bGe3TIP99jHPgXUSecOhPkbKug5q17yoNawI6ZvbAxCLfwdi-HbUU_2GV-Jen7feFhamlsu2keiGO1k3ngBWDXH-XpNGnwyJvdW8dFH3S9bRHjwFAwwv-OGIPPE-W6FP_tw3TF7', '2021-02-04 14:40:40', '2021-02-04 14:40:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('08d6b127c0de651f536302bf33ffdb6c850d209e', '2024-04-20 21:02:25.535655', 241),
('2f77929194fe5e986a696f2c7ae0266be7351d18', '2024-04-20 21:09:53.584287', 242),
('50d5306916910366e1872d4db4cb0c1c42b7bbcb', '2024-05-06 10:18:40.897558', 232),
('69fc2faa195f6a739d32d1596ef0d1e6fec9a467', '2024-04-01 16:10:06.805138', 215),
('72253155319826cfd205c5c6131a4f10c4e9c977', '2023-11-25 12:44:38.674555', 208),
('93bdd00993b67837f4d871608b9c54e007207404', '2024-04-20 19:34:02.937373', 240),
('b690676302d6bf468bffde247af3289db30f2060', '2024-04-18 17:16:40.409081', 235),
('c6b9c0f14c55f40115f7ababbeb6e5b3c6d8b31b', '2024-04-20 21:19:21.093590', 243),
('cbc932c8878cf4a00e6fd20044aad51c9f886807', '2024-04-01 15:58:55.862724', 213),
('cce8909a5a6c809693593af988fb3420a66523ae', '2024-04-20 19:29:33.631913', 239),
('e33e181dd341c7ffb622537b598b55861934ad70', '2024-04-20 21:28:16.604474', 245);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$iz554JAEiohS$S+sr9m++j7NwJoADo+wslLM1Zz+f5G80XrQtGkxd+c4=', '2020-10-12 12:57:08.308154', 1, 'admin@gmail.com', '', '', 'admin@gmail.com', 1, 1, '2020-08-20 09:29:12.273026');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `loader` text,
  `page_limit` int(11) DEFAULT '10',
  `org_name` varchar(255) DEFAULT NULL,
  `org_code` varchar(6) DEFAULT NULL,
  `google_app_key` varchar(500) DEFAULT NULL,
  `firebase_server_key` text,
  `order_timing` varchar(50) DEFAULT NULL,
  `user_tracking_time` varchar(50) DEFAULT NULL,
  `travel_amount` int(11) DEFAULT NULL,
  `office_start_time` varchar(10) NOT NULL DEFAULT '08:00:00',
  `office_end_time` varchar(10) NOT NULL DEFAULT '20:00:00',
  `org_latitude` varchar(50) DEFAULT NULL,
  `org_longitude` varchar(50) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `date_frequency` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `configuration`
--

INSERT INTO `configuration` (`id`, `logo`, `loader`, `page_limit`, `org_name`, `org_code`, `google_app_key`, `firebase_server_key`, `order_timing`, `user_tracking_time`, `travel_amount`, `office_start_time`, `office_end_time`, `org_latitude`, `org_longitude`, `is_active`, `date_frequency`, `created_at`, `updated_at`, `user_name`) VALUES
(1, 'media/logo/logo_balinee%20logo.PNG', NULL, 20, 'TTrack', 'SAJ000', 'AIzaSyCJ0F6hcIXBQIJ84HRMUjCcooIz9pTq23I', 'AAAARcej1hc:APA91bEATzCzKomVGjA0thhQJLC2Uu2bKslV67xpOVP05OXZow7fHS5a3HsT3XIlYBet25nW8Y62f2GH1-PDkOPudLK9WvdcNME2q_nOM5NzGkUH7cbX8hqXJpNAdYsQ2jrGZPqVKzmc', '14:00:00', '15', 5, '09:30:00', '17:30:00', '25.454669', '78.541039', 1, 1, '2020-08-26 06:13:01', '2020-08-26 06:13:01', 'TRK');

-- --------------------------------------------------------

--
-- Table structure for table `contract_type`
--

CREATE TABLE `contract_type` (
  `id` int(11) NOT NULL,
  `contract_type` varchar(250) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contract_type`
--

INSERT INTO `contract_type` (`id`, `contract_type`, `created_at`, `updated_at`, `status`) VALUES
(3, 'Onroll', '2022-05-09 00:00:00', '2022-05-09 05:46:50', 1),
(5, 'Consultant', '2023-09-13 00:00:00', '2023-09-13 07:02:23', 1),
(6, 'Third Party', '2024-04-10 00:00:00', '2024-04-09 20:43:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-08-20 07:06:28.751870'),
(2, 'auth', '0001_initial', '2020-08-20 07:06:28.849013'),
(3, 'admin', '0001_initial', '2020-08-20 07:06:29.128337'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-08-20 07:06:29.194926'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-20 07:06:29.206667'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-08-20 07:06:29.270828'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-08-20 07:06:29.286666'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-08-20 07:06:29.302484'),
(9, 'auth', '0004_alter_user_username_opts', '2020-08-20 07:06:29.315355'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-08-20 07:06:29.346227'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-08-20 07:06:29.348589'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-08-20 07:06:29.359502'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-08-20 07:06:29.372892'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-08-20 07:06:29.388799'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-08-20 07:06:29.406571'),
(16, 'auth', '0011_update_proxy_permissions', '2020-08-20 07:06:29.417891'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-08-20 07:06:29.434129'),
(18, 'sessions', '0001_initial', '2020-08-20 07:06:29.452426'),
(19, 'developer_console', '0001_initial', '2020-08-26 07:16:49.502911'),
(20, 'src', '0001_initial', '2020-10-27 04:08:46.788575'),
(21, 'authtoken', '0001_initial', '2020-10-27 04:08:46.845523');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0hsgumnm2fqv5w82bpgafxitazgscogz', '.eJyVU8uO0zAU_ZXIC1Zp1DSPttmBQGJBxQiJFaqiG_s2MRPbke0MU0b9d5xHO00oFHbJPQ8fnWu_kBxaW-WtQZ1zRjISEv96VgB9RNkB7DvIUgVUSat5EXSUYERNsFMM63cjd2JQgamcegVRRBNIMImjdRyvGSDbpGEUsw0t3Ge8DCHcRLA8HOIQomKVQBrSdZrSDV1RWHWmBo3hSub43HB9JNnSJ0KxtkZDsm8vRKBs3UlflBt4b7wH1IL3Aqc1bdHBA9H95CN5BxJK9HqNo9VcPrqp0TTT_ei0P_kX5w-iqdUR0RtUbmrvW59FM_uuG2fvTyTvgddH7621rkWQ1OXCRmk7VbKOtIALaaEH0sxr5_ZU3XcTA-2-38SnbGvQ_CdY1-5NWz2h_Cni0NAnhKfb4eoOuYivV-E07N_W8Dvz6gAuGT7PY31tqBJcli6SxB9Qzzc3wi7XCE-S7cBY1P91RT7rEuRY1ewwNYFu9_dR1ZzBcaasztPboiHmTCP64UK8Zv_bxh7cCZTPL_aws-aMuW72PjnAk9Lc9g91f_WSueQ2t1ygsSCanGThOozSZbrdpkG4TbdpnJx-AV74nQg:1ry7SZ:pqjEqJUWOLAlGJyhMZBGLYIi94_BkrY1HjVuUKZI55I', '2024-05-04 15:26:39.766111'),
('6aa4eyvjqu8ap1kpch1j1c7xul4d9q2k', '.eJyVU02P0zAQ_StRDpzaqM43vYFA4kDFiitaRRN72piN7cp2VpRV_zuTpO02oVC42W_eex6_sV_CCjrfVJ1DW0kRrkMWLq6xGvgT6r4gvoPemYgb7a2so54Snaou2hiB7fsTd2LQgGtIHUOS8AwyzNKkSNNCAIoyZ0kqSl7TMl0xYGUCq-02ZZDUcQY540We85LHHGIyVUZ0Lbpw_e0lVKg7cv1qCAjeBA9olXROGk0819V9eSTSpjqRN6Bhh8GgIVor9ROhzvK1HaDj43Fxcf6o9q05IAajilB_3_osmtn3OZD9YiL5ALI9BO-8p8RAc-oL98b6qVL0pCVcSEs7kmZeG5pJc99NjbT7fhOfXdeClT_BU7o3be2E8qcWx4Q-Izzfbq7tKxfx9ShII_5tDL8zrw6QWuCPqfMGnEf7XyP-YnegT1edjdlMSrfv_8m0UsBhpmzO6G3R2OZMowZwqV57_1viD3QCl_OHOWa-P9com8dFuIVnY6UfPhptK4fDx6qklr7yUqHzoPZVuGYFi99meclWURGv4qI4_gKF-X6P:1rvOJf:ynp5uTT8s6iOwmxsE4QlRSKBeI0gVltowFctXt-pG_M', '2024-04-27 02:50:11.458725'),
('8wk8pc8ag8j0kuyo7k5h7eafeohiyssr', '.eJyVU0uP0zAQ_itRDpzaaJ1Xo95YgcSBihUrTmgVTWy3MetHsJ2Fsup_Z_JotwllCzd7voc_z9jPYQmtr8vWcVsKFq5DEi7OaxXQR647gH0DvTMRNdpbUUUdJRpRF20M4_J25E4ManA1qmNIEppBxrM0WaXpigFnRU6SlBW0wmV6Q4AUCdxstymBpIozyAld5TktaEwhRlNlWCu5C9dfn0PFdYuunw0WgjfBHbdKOCeMRp5rqw4eiLgpR_IGNOx40GuQJoV-xKqzdG370uHhsDg5v1eNNHvOg0GFVX_d-iia2Xd9QPvFRPIOhNwHb73HjoGmmIs3xvqpknWkJZxISzuQZl4bnEl93U0NtOt-p8vfgwS7D-6laKZWrgeWrgNm4kmIXYs88Qs8jga331vuZqHshPO3Cw79_cjh6fLVZIecxOeDRA37tyH-yTw7QGjGf85jfWmoUULvMJLmP0DO5z7CmGuEJ8k24Dy3__XAPtkd6LFVs8PMBLrcvw9GCgb7mbI-Vi-LhpgzjeqLS_WS_bWJ3eEJVMy_xTCz5ohhbx4W4RaejBW-_-a4LR3vv3UptPClFwrfD6imDNdkRTKS5yQrojSP04TEh9-ADat2:1s4f4I:_IwoKcBOFPOC3Nw2WnM-LSuqW0_SH_a0axwLb3IFU5Y', '2024-05-22 16:32:38.474099'),
('atw24traosxhqm4dzeu6zblu641yenie', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MTQ5MjA0NzEuOTA2NDc0Nn0:1s3d9b:pKJsALDyB_GQsMGsCY9-rZWPRT2p2hVMNQm9ulRjMTE', '2024-05-19 20:17:51.926544'),
('df0hwdxq72gzbkc3gjxofdp2mwdzqjc6', '.eJyVU8uO0zAU_ZUoC1ZtNInTpO0OBBILKkZIrNAourHdxIwfwXYGyqj_zs2jnSYUCrv4noePznWewwJaXxet47YQLNyGcbi4nJVAH7nuAPYVdGUiarS3oow6SjSiLtoZxuWbkTsxqMHVqE6AELqCFV-lJE_TnAFn6ywmKVvTEj_TuxjiNYG7_T6NgZTJCrKY5llG1zShkKCpMqyV3IXbL8-h4rpF108GB8Gr4J5bJZwTRiPPtWUHD0Q8FCN5BxoqHvQapEmhH3HqLN3afnR8OC7Ozu9UI82B82BQ4dTftj6JZvZdD2i_mEjegpCH4LX32Bhoirl4Y6yfKllHWsKZtLQDaea1w53Ut93UQLvtN_GpWglW_ASP7eLxW8vdzNdOOH_KOFT0gcPT9XSyQ87iy12ghv3bHn5nXlwgNOM_5rE-N9QooSuMpPl3kPPVjTDmGuFJsh04z-1_vZGPtgI9VjW7zEyg6_29N1IwOMyU9Wl6XTTEnGlUP1yql-x_29g93kDF_GUPO2tOGHbzsAj38GSs8P2fisfC8f7PLIQWvvBC4fsB1RThNs5jkiUbskkikpB0k-bHX0-Zlis:1ryDHk:vM-yREhkc_2VH-v5nByRjxs9S3U_Evf27q7daXuY6sU', '2024-05-04 21:39:52.406233'),
('eivr1c2dgb385utpbq4mm7sq651k03zx', '.eJyVU0uP0zAQ_itRDpzaqGme6g0EEgcqVqw4oVU0sd3GrB_BdhbKqv-dyaPdxhQKN3u-hz_P2M9hBZ1rqs4yU3EabsI4XFzWaiCPTPUA_QpqryOilTO8jnpKNKE22mrKxJuJOzNowDaoXkOSkAwylqVJkaYFBUbLPE5SWpIal-kqhrhMYLXbpTEk9TqDPCZFnpOSrAms0VRq2glmw82X51Ay1aHrJ42F4FVwx4zk1nKtkGe7uodHIm6qibwFBXsWDBqkCa4esWoN2ZihdHw4Ls7O72Qr9IGxYFRh1d22Pok8-74PaL-YSd4CF4fgtXPYMVAEc7FWGzdX0p60hDNpaUaS57XFmTS33eRIu-13vvw9CDCH4F7wdm5lB2Bpe8ATz0LsO-Txn-BwNLj91jHrhTIzzp8uOPb3A4On61cTPXIWXw4SNfTfhvg78-IArij74cf63BItudpjJMW-g_DnPsGYa4JnybZgHTP_9cA-mj2oqVXeYXoGXe_fey04hYOnbE7V66IxpqeRQ3EpX7L_bWJ3eALh_rcYZ9aeMOzNwyLcwZM23A3fHLeVZcO3rrjirnJc4vsB2VbhJi7iLEmyVVlERZbGZZ4efwGANKuC:1s5N0x:4jmXkvqDQz_t9mLHQCkgPXmBwK3aXa1CuzzUxoy8yXk', '2024-05-24 15:28:07.936370'),
('gqjuxkpza8zngxf17l2txkd1lv3dseql', '.eJyVVEuP0zAQ_iuRD5zSqM6rVW4gkDhQsULihKpoYruJ2cQOtrNsWfW_M3m0NKFQuMXzPebTjJ0XkkPnqryzwuSSk4xQ4l_XCmCPQvUA_wqq1AHTyhlZBD0lmFAb7DQX9ZuJOzOowFaoDiGKWAKJSOJoE8cbDoJvUxrFfMsK_IzXFOg2gvXhEFOIijCBlLJNmrItCxmEvakV1kqtcvHcSnMk2donjeZdLSzJvryQRqgOO33SWPBeeQ_CNHIQoNZ2RQ-PRDzkE3kHCkrhDRqk1VI9YtUalpmhdNqf_Ivzu6at9VEIb1Rh1d23PosW9v1s0N6fSd6CrI_ea-dwiqAY5hKtNm6u5D1pBRfSyoykhdcO91Tdd2tG2n2_mU_Z1WDkD3A4XTx-64Rd-JoZ508ZxxF9EPB0O13dIxfx9S5Qw_9tD78zrxpIxcXzMtbnlulGqhIjKfEd6uXqJhhzTfAs2Q6sE-a_7shHU4KaRrVopmfQ7fm917XkcFwoq3P1tmiMudA0Q3HV_Mr-t409YAcmlzd73Fl7xnA2e58c4Ekb6YaXur96ylJJlzvZ4P2Bps1JRjc0SsOEJtsA_xPrlJ5-Aoy3nSk:1ryCBS:ID6k22h8J6bWXH3EO5D8svRw52KLLXRh_NHpmHAUwK0', '2024-05-04 20:29:18.376498'),
('ihryyysnqa1xusampc8jvtfuwp2xwlye', '.eJyVVEuP0zAQ_itRDpzaqGkejXoDgcSBihUrTmgVTWw3MetHsJ2Fsup_Z_JotzGFwi2e7-HPM3aewxI615SdZabkNNyGcbi4rFVAHpnqAfoVVK0jopUzvIp6SjShNtppysSbiTszaMA2qF5DkpAMMpalySZNNxQYLfI4SWlBKvxMVzHERQKr_T6NIanWGeQx2eQ5KciawBpNpaadYDbcfnkOJVMdun7SWAheBXfMSG4t1wp5tqt6eCTiopzIO1BQs2DQIE1w9YhVa8jWDKXjw3Fxdn4nW6EPjAWjCqvutvVJ5Nn3fUD7xUzyFrg4BK-dw46BIpiLtdq4uZL2pCWcSUszkjyvHc6kue0mR9ptv_Ph70GAOQT3grdzKzsAS9sDnngWou6Qx3-Cw9Hg8lvHrBfKzDh_OuDY3w8Mnq4fTfTIWXw5SNTQfxvi78yLDbii7Icf63NLtOSqxkiKfQfhz32CMdcEz5LtwDpm_uuCfTQ1qKlV3mZ6Bl3v33stOIWDp2xO1euiMaankUNxKV-y_21id7gD4f6zGGfWnjDszcMi3MOTNtwNzxyXpWXDsy654q50XOL9AdmW4TbexNmqSOI8iVY5_j2S4y_UdKs4:1s4JTf:H94W1OLzTpjPKpgR2MyWSKU59YQ4UgG-1yhhkchwh04', '2024-05-21 17:29:23.112641'),
('ltwb8bli23zpf1i3bthpshnvl6to4mz4', '.eJyVU8uO0zAU_ZUoC1ZtNHk1pjsQSCyoGCGxQqPoxnYTM34E2xkoo_47N4-WJhQKu_ieh4_OdZ7DEjrflJ3jthQs3IZxuLqcVUAfue4B9gV0bSJqtLeiinpKNKEu2hnG5euJOzNowDWoTiBNaQ45z7O0yLKCAWdkE6cZI7TCz-wuhpikcLffZzGkVZLDJqbFZkMJTSgkaKoM6yR34fbzc6i47tD1o8FB8CK451YJ54TRyHNd1cMjEQ_lRN6BhpoHgwZpUuhHnDpLt3YYHR-Oq7PzW9VKc-A8GFU49betT6KFfd8D2q9mkjcg5CF45T02BppiLt4a6-dK1pPWcCat7UhaeO1wJ81tNzXSbvvNfOpOghU_wGO7ePzacbfwtTPOnzKOFb3n8HQ9neyRs_hyF6hh_7aH35kXFwjN-PdlrE8tNUroGiNp_g3kcnUTjLkmeJZsB85z-19v5IOtQU9VLS4zM-h6f--MFAwOC2Vzml4XjTEXGjUM1-pX9r9t7B5voGL5ssedtScMu3lYhXt4Mlb44U_FY-n48GeWQgtfeqHw_YBqy3AbF3FaEFKQlxHJSJ7kx5-6j5YL:1ryskf:MFgYE9OEYK9f9EVuSmJXJtThaV4Jxn33ha4Iulo_Oec', '2024-05-06 17:56:29.851864'),
('lznyizfdlz5gkr988emftz3zhp7ob7tz', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MTQ5MjA0NzEuODg1NDY1NH0:1s3d9b:VigZZMCLCtTjstEXjNrAtb1Qmid3Kv0tljgmpRW58vI', '2024-05-19 20:17:51.902378'),
('m12dlhmn49k12fzyo4aa08ixznh6dp35', '.eJyVU11v0zAU_StRHnhqo7pJk9K3IZB4WMWExBOaohvbTcxiO7OdQZn637n5aGm8so63-J4PH53rPIc5tK7KW8tNLli4CUk4O58VQB-46gD2A1SpI6qVM6KIOko0ojbaasbrDyN3YlCBrVC9hDimK1jxVRJnSZIx4Gydkjhha1rgZ7IgQNYxLHa7hEBcLFeQEpqlKV3TJYUlmkrN2prbcPP9OZRctej6VeMgeBfccSOFtUIr5Nm26OCBiId8JG9BQcmDXoO0WqgHnFpDN6YfHe4Ps5PzJ9nUes95MKhw6q5bH0WefdcD2s8mko8g6n1w4xw2BopiLt5o46ZK1pHmcCLNzUDyvLa4k-q6mxxo1_0mPmVbgxG_wWG7eHxsufV8zYTzr4xDRbccni6nqzvkJD7fBWrY2_bwknl2gVCM__JjfWuolkKVGEnxn1D7qxthzDXCk2RbsI6b_3ojX0wJaqzKu0xPoMv9fda1YLD3lNVxelk0xPQ0sh_O5d_sr23sDm-gwn_Zw86aI4bd3M_CHTxpI1z_p-Ixt7z_M3OhhMudkPh-QDZ5uCEZibPsfUySKEnJIl3Ehz9PjpYf:1ryqHq:a_kGRhgWd85Kx1PVfG5fSf45uvpl8Zkjj1zofiQxEH0', '2024-05-06 15:18:34.763694'),
('o72q7biamkn553w1k2h5mx86e3gruspg', '.eJyVU0uP0zAQ_itRDpzaKm6SJuoNBBIHKlasOKFVNLHdxKxjB9tZKKv-dyaPdhtTKNzs-R7-PGM_hwV0ri46y00hWLgNSbi4rJVAH7nqAfYVVKVXVCtnRLnqKasJtaudZly-mbgzgxpsjeo1xDFNIeVpEmdJkjHgLN-QOGE5LXGZRARIHkO03ycE4nKdwobQbLOhOV1TWKNpo1knuQ23X57DhqsOXT9pLASvgjtuGmGt0Ap5tit7eCTippjIO1BQ8WDQIE0K9YhVa-jWDKXjw3Fxdn7XtFIfOA9GFVbdbeuTyLPv-4D2i5nkLQh5CF47hx0DRTEXb7VxcyXrSUs4k5ZmJHleO5xJfdutGWm3_c6XvwcJ5hDcS9HOrewALG0PeOJZiKpDnvgJDkeD228dt14oM-P86YJjfz9weLp-NdkjZ_HlIFHD_m2IvzMvDhCK8R9-rM8t1Y1QFUZS_DtIf-4TjLkmeJZsB9Zx818P7KOpQE2t8g7TM-h6_95rKRgcPGV9ql4XjTE9TTMUl81L9r9N7A5PoML_FuPM2hOGvXlYhHt40ka44ZvjtrB8-NaFUMIVTjT4fqBpi3BLMpKShCRRvoqjOIvi_PgLf4arbw:1s4Yd6:UpDj4RExv-8NMIpjt8ESTjp0koianlwtgi6PvIBmsEo', '2024-05-22 09:40:08.325820'),
('qppfk4xetp23kgrtorglqss9xhwygx8r', '.eJyVU0uP0zAQ_itRDpzaqHk1VW8gkDhQsWLFCa2iie0mZv0ItrNQVv3vTB7tNqZQuNnzPfx5xn4OS-hcU3aWmZLTcBvG4eKyVgF5ZKoH6FdQtY6IVs7wKuop0YTaaKcpE28m7sygAdugOoE0JTnkLM_SIssKCoxu1nGa0Q2pcJmtYog3Kaz2-yyGtEpyWMekWK_JhiQEEjSVmnaC2XD75TmUTHXo-kljIXgV3DEjubVcK-TZrurhkYibciLvQEHNgkGDNMHVI1atIVszlI4Px8XZ-Z1shT4wFowqrLrb1ieRZ9_3Ae0XM8lb4OIQvHYOOwaKYC7WauPmStqTlnAmLc1I8rx2OJPmtpscabf9zpe_BwHmENwL3s6t7AAsbQ944lmIukMe_wkOR4Pbbx2zXigz4_zpgmN_PzB4un410SNn8eUgUUP_bYi_My8O4IqyH36szy3RkqsaIyn2HYQ_9wnGXBM8S7YD65j5rwf20dSgplZ5h-kZdL1_77XgFA6esjlVr4vGmJ5GDsWlfMn-t4nd4QmE-99inFl7wrA3D4twD0_acDd8c9yWlg3fuuSKu9Jxie8HZFuG27iI8zQpinUaFXlRZKvi-AuAaquG:1s5L6r:nPIYlIW3lCj7NpIbaob5ka47TQR0Qay7nE_mxh6Ay9w', '2024-05-24 13:26:05.231479'),
('rbbq0459pghbgl47ow9byyj6cil89niv', '.eJyVU0uP0zAQ_itRDpzaqM6rUW8gkDhQsWLFCa2iie02ZmM72M5CWfW_M3m025hC4WbP9_DnGfs5LKFzddlZbkrBwk1IwsVlrQL6yFUPsK-g9jqiWjkjqqinRBNqo61mvHkzcWcGNdga1TEkCc0g41marNN0zYCzIidJygpa4TJdESBFAqvdLiWQVHEGOaHrPKcFjSnEaCo16xpuw82X51By1aHrJ42F4FVwx40U1gqtkGe7qodHIm7KibwFBXseDBqkNUI9YtUaujFD6fhwXJyd38m20QfOg1GFVXfb-iTy7Ps-oP1iJnkLojkEr53DjoGimIu32ri5kvWkJZxJSzOSPK8tzqS-7SZH2m2_8-XvoQFzCO4b0c6t7AAsbQ944lmIfYc88RMcjga33zpuvVBmxvnTBcf-fuDwdP1qTY-cxZeDRA37tyH-zrw4QCjGf_ixPrdUS6H2GEnx79D4c59gzDXBs2RbsI6b_3pgH80e1NQq7zA9g673771uBIODp6xP1euiMaankUNxKV-y_21id3gCFf63GGfWnjDszcMi3MGTNsIN3xy3peXDty6FEq50QuL7AdmW4YasSUbytFgVEYmzfEWS4y9_7qty:1s4eiW:WbeHTrtg8-cOMQvMLapZkz6RWYKoIdSQ4iFxXMozisM', '2024-05-22 16:10:08.187368'),
('rvtj2ttydxo0mex8dexzkj4dwc10wrb8', '.eJyVU8uO0zAU_ZXIC1Zp1LyaNDsQSCyoGCGxQlV0Y7uJGT8i2xmmjPrvOI92mlAo7JJ7Hj46135BJXS2KTtDdckIKlCI_OtZBfiRyh4g30HWKsBKWs2qoKcEE2qCnSKUv5u4M4MGTOPUEcQxTiGlaRJnSZIRoCTfhHFCcly5z2QdQpjHsD4ckhDiKkphE-Jss8E5jjBEvamhxjAlS_rcMn1ExdpHQpGOU4OKby9IUNm5k74oN_DeeA9UCzYInNZ0VQ-PRPdTTuQdSKipN2gcjTP56KZG40IPo9P-5F-cP4iWqyOl3qhyU3vf-ixa2PfdOHt_JnkPjB-9t9a6FkFil4u2Stu5kvSkFVxIKz2SFl47t6fmvpsYaff9Zj51x0Gzn2Bduzdt9Yzyp4hjQ58oPN0Ox3vkIr5ehdOQf1vD78yrA5gk9HkZ62uLlWCydpEk_QF8ubkJdrkmeJZsB8ZS_V9X5LOuQU5VLQ5TM-h2fx8VZwSOC2Vznt4WjTEXGjEMV-I1-9829uBOwGx5scedtWfMdbP30QGelGZ2eKj7q5fMJLOlZYIaC6ItURFmYZymSR5nQbbNt9soOf0CXxGdDA:1rxttF:HG_JVxs96dBOx28G9RifmsmluBUjquZBbXCih4jgKHc', '2024-05-04 00:57:17.813344'),
('um9do52b1sp58yvj9oitckibvpdvtw6r', 'eyJfc2Vzc2lvbl9pbml0X3RpbWVzdGFtcF8iOjE3MTM5NTA4MDUuMDM0NjQwOH0:1rzYtq:qk1hCSCcz1nqe5QLRrBieh2gC-Jelpe7nL45j1p4AX8', '2024-05-08 14:56:46.463950'),
('vuw05org8iauyq1okhu9vxjizevqq1c5', '.eJyVU0uP0zAQ_itRDpzaqHl3e1sEEgcqVqw4oVU0sd3EbGwH21koq_53Jo92G1O2cLPne_jzjP3sF9DZuugM0wWn_sYP_cV5rQTyyGQP0G8gKxUQJa3mZdBTggk1wVZR1ryduDODGkyN6gjimKSQsjSJ8yTJKTC6zsI4oWtS4jJZhRCuY1jtdkkIcRmlkIUkzzKyJhGBCE2Fol3DjL_5-uwLJjt0_ayw4L3x7pgW3BiuJPJMV_bwSMRNMZG3IKFi3qBBWsPlI1aNJhs9lA4Ph8XJ-b1oG7VnzBtVWLXXrY8ix77vA9ovZpJ3wJu9d2stdgwkwVysVdrOlbQnLeFEWuqR5HhtcSb1dTcx0q77nS5_Dw3ovXff8HZuZQZgaXrAEc9CVB3y-C-wOBrcfu-YcULpGedvFxz7-5HB0-WrNT1yEp8PEjX034b4J_PsAC4p--nG-tISJbisMJJkP6Bx5z7BmGuCZ8m2YCzT__XAPukK5NQq5zA1gy7374NqOIW9o6yP1cuiMaajEUNxKV6yvzaxOzyBcPdbjDNrjxj25mHh7-BJaW6Hb47bwrDhWxdccltYLvD9gGgLfxPmYZJkaZSnQRzd3KzCw2_U9atJ:1s1ijj:Vds9tp57_6wa00X5OSExwpKXiA8o7G1owHj5YAmFzw0', '2024-05-14 13:51:15.417174'),
('w8eqhnurh1g7o9bmqjff4yc1svedfobm', '.eJyVU0uP0zAQ_itRDpzaqHlHvYFA4kDFihUntIomtpuYdexgOwtl1f_O5NFuYwqFmz3fw59n7Ge_hN42ZW-YLjn1t37ory5rFZBHJgeAfgVZq4AoaTWvgoESzKgJdooy8WbmLgwaMA2qI4hjkkLK0iTOkySnwGiRhXFCC1LhMtmEEBYxbPb7JIS4ilLIQpJnGSlIRCBC01bRXjDjb788-y2TPbp-UljwXnl3TLfcGK4k8kxfDfBExE05k3cgoWbeqEGa4PIRq0aTrR5Lx4fj6uz8ru2EOjDmTSqs2tvWJ5FjP_QB7VcLyVvg4uC9thY7BpJgLtYpbZdKOpDWcCat9URyvHY4k-a2WzvRbvudL38PAvTBuxe8W1qZEVibAXDEixB1jzz-EyyOBrffemacUHrB-dMFp_5-YPB0_WpiQM7iy0Gihv7bEH9nXhzAJWU_3FifO6JaLmuMJNl3EO7cZxhzzfAi2Q6MZfq_HthHXYOcW-UcphbQ9f69V4JTODjK5lS9LppiOpp2LK7bl-x_m9gdnkC4-y2mmXUnDHvzsPL38KQ0t-M3x21p2PitSy65LS1v8f1A25X-NszDdFNEWVIESVrkWXT8BdULq1E:1s4JLM:lXrs_sdhIWkA__8GU89iHBoYRl-2zHsa_uKiGPngoo0', '2024-05-21 17:20:48.612540'),
('xigv2h23qsm0ots5djinc3eklwxmhnk7', '.eJyVU11PwjAU_SvLHnyChbExCG8aTXyQSEx8MmS5a8tW6VrSdigS_rt3HyCbKPq23vPRk3O7nRtDYbO4MEzHnLpT13d7p7MEyIrJEqCvIFPlESWt5olXUrwGNd5MUSZuGm7LIAOToXoIQUBGMGKjMBiH4ZgCo5PID0I6IQl-hgMf_EkAg-Uy9CFIhiOIfDKOIjIhQwJDNM0VLQQz7vRl5-ZMFuj6pHDgXDlzpnNuDFcSeaZISrgm4iFuyDOQkDKn0iBNcLnCqdFkqqvRfrHvHZ3v8rVQW8acWoVTe9n6IOrYlz2gfa8luQUuts61tdgYSIK52Fpp21bSktSHI6mva1LHa4Y7yS675TXtsl_LJy0EaP4BFts9a6tblJ8i1g09MNicDydK5Cg-XQVq6N_W8J15cgGXlL13Yz2vicq5TDGSZG8guptrYMzVwK1kMzCW6X89kUedgmyq6lymWtD5_u6V4BS2HWV2mJ4X1TE7mrwa9vOv7L9tbI43EN592PXO1gcMu1n03CVslOa2-lEX-0_Ab4dj:1ry5SK:SdZaivpvs-6o5hGM9TuQlpm_jVd_VE0oSd5sCxz1GVQ', '2024-05-04 13:18:16.809169');

-- --------------------------------------------------------

--
-- Table structure for table `financial_monthly`
--

CREATE TABLE `financial_monthly` (
  `id` int(11) NOT NULL,
  `fy_id` int(11) DEFAULT NULL,
  `month` varchar(20) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `month_year` varchar(20) DEFAULT NULL,
  `lead_target` int(11) DEFAULT '0',
  `revenue_target` decimal(10,2) DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_monthly`
--

INSERT INTO `financial_monthly` (`id`, `fy_id`, `month`, `year`, `month_year`, `lead_target`, `revenue_target`) VALUES
(1, 1, 'APR', 24, 'APR-24', 50, 170000.00),
(2, 1, 'MAY', 24, 'MAY-24', 50, 170000.00),
(3, 1, 'JUN', 24, 'JUN-24', 50, 170000.00),
(4, 1, 'JUL', 24, 'JUL-24', 50, 170000.00),
(5, 1, 'AUG', 24, 'AUG-24', 50, 170000.00),
(6, 1, 'SEP', 24, 'SEP-24', 50, 170000.00),
(7, 1, 'OCT', 24, 'OCT-24', 50, 170000.00),
(8, 1, 'NOV', 24, 'NOV-24', 50, 170000.00),
(9, 1, 'DEC', 24, 'DEC-24', 50, 170000.00),
(10, 1, 'JAN', 25, 'JAN-25', 50, 170000.00),
(11, 1, 'FEB', 25, 'FEB-25', 50, 170000.00),
(12, 1, 'MAR', 25, 'MAR-25', 50, 170000.00),
(13, 2, 'APR', 25, 'APR-25', 70, 1900000.00),
(14, 2, 'MAY', 25, 'MAY-25', 70, 1900000.00),
(15, 2, 'JUN', 25, 'JUN-25', 70, 1900000.00),
(16, 2, 'JUL', 25, 'JUL-25', 70, 1900000.00),
(17, 2, 'AUG', 25, 'AUG-25', 70, 1900000.00),
(18, 2, 'SEP', 25, 'SEP-25', 70, 1900000.00),
(19, 2, 'OCT', 25, 'OCT-25', 0, 0.00),
(20, 2, 'NOV', 25, 'NOV-25', 0, 0.00),
(21, 2, 'DEC', 25, 'DEC-25', 0, 0.00),
(22, 2, 'JAN', 26, 'JAN-26', 0, 0.00),
(23, 2, 'FEB', 26, 'FEB-26', 0, 0.00),
(24, 2, 'MAR', 26, 'MAR-26', 0, 0.00),
(25, 3, 'APR', 24, 'APR-24', 50, 150000.00),
(26, 3, 'MAY', 24, 'MAY-24', 50, 150000.00),
(27, 3, 'JUN', 24, 'JUN-24', 50, 150000.00),
(28, 3, 'JUL', 24, 'JUL-24', 50, 150000.00),
(29, 3, 'AUG', 24, 'AUG-24', 50, 150000.00),
(30, 3, 'SEP', 24, 'SEP-24', 50, 150000.00),
(31, 3, 'OCT', 24, 'OCT-24', 50, 150000.00),
(32, 3, 'NOV', 24, 'NOV-24', 50, 150000.00),
(33, 3, 'DEC', 24, 'DEC-24', 50, 150000.00),
(34, 3, 'JAN', 25, 'JAN-25', 50, 150000.00),
(35, 3, 'FEB', 25, 'FEB-25', 50, 150000.00),
(36, 3, 'MAR', 25, 'MAR-25', 50, 150000.00),
(37, 4, 'APR', 24, 'APR-24', 50, 100.00),
(38, 4, 'MAY', 24, 'MAY-24', 50, 100.00),
(39, 4, 'JUN', 24, 'JUN-24', 50, 100.00),
(40, 4, 'JUL', 24, 'JUL-24', 50, 100.00),
(41, 4, 'AUG', 24, 'AUG-24', 50, 100.00),
(42, 4, 'SEP', 24, 'SEP-24', 50, 100.00),
(43, 4, 'OCT', 24, 'OCT-24', 50, 100.00),
(44, 4, 'NOV', 24, 'NOV-24', 50, 100.00),
(45, 4, 'DEC', 24, 'DEC-24', 50, 100.00),
(46, 4, 'JAN', 25, 'JAN-25', 50, 100.00),
(47, 4, 'FEB', 25, 'FEB-25', 50, 100.00),
(48, 4, 'MAR', 25, 'MAR-25', 50, 100.00),
(49, 5, 'APR', 24, 'APR-24', 10, 100000.00),
(50, 5, 'MAY', 24, 'MAY-24', 10, 100000.00),
(51, 5, 'JUN', 24, 'JUN-24', 10, 100000.00),
(52, 5, 'JUL', 24, 'JUL-24', 10, 100000.00),
(53, 5, 'AUG', 24, 'AUG-24', 10, 100000.00),
(54, 5, 'SEP', 24, 'SEP-24', 10, 100000.00),
(55, 5, 'OCT', 24, 'OCT-24', 10, 100000.00),
(56, 5, 'NOV', 24, 'NOV-24', 10, 100000.00),
(57, 5, 'DEC', 24, 'DEC-24', 10, 100000.00),
(58, 5, 'JAN', 25, 'JAN-25', 10, 100000.00),
(59, 5, 'FEB', 25, 'FEB-25', 10, 100000.00),
(60, 5, 'MAR', 25, 'MAR-25', 10, 100000.00),
(61, 6, 'APR', 24, 'APR-24', 5, 100.00),
(62, 6, 'MAY', 24, 'MAY-24', 5, 100.00),
(63, 6, 'JUN', 24, 'JUN-24', 5, 100.00),
(64, 6, 'JUL', 24, 'JUL-24', 5, 100.00),
(65, 6, 'AUG', 24, 'AUG-24', 5, 100.00),
(66, 6, 'SEP', 24, 'SEP-24', 5, 100.00),
(67, 6, 'OCT', 24, 'OCT-24', 5, 100.00),
(68, 6, 'NOV', 24, 'NOV-24', 5, 100.00),
(69, 6, 'DEC', 24, 'DEC-24', 5, 100.00),
(70, 6, 'JAN', 25, 'JAN-25', 5, 100.00),
(71, 6, 'FEB', 25, 'FEB-25', 5, 100.00),
(72, 6, 'MAR', 25, 'MAR-25', 5, 100.00),
(73, 7, 'APR', 25, 'APR-25', 0, 0.00),
(74, 7, 'MAY', 25, 'MAY-25', 0, 0.00),
(75, 7, 'JUN', 25, 'JUN-25', 0, 0.00),
(76, 7, 'JUL', 25, 'JUL-25', 0, 0.00),
(77, 7, 'AUG', 25, 'AUG-25', 0, 0.00),
(78, 7, 'SEP', 25, 'SEP-25', 0, 0.00),
(79, 7, 'OCT', 25, 'OCT-25', 0, 0.00),
(80, 7, 'NOV', 25, 'NOV-25', 0, 0.00),
(81, 7, 'DEC', 25, 'DEC-25', 0, 0.00),
(82, 7, 'JAN', 26, 'JAN-26', 0, 0.00),
(83, 7, 'FEB', 26, 'FEB-26', 0, 0.00),
(84, 7, 'MAR', 26, 'MAR-26', 0, 0.00);

-- --------------------------------------------------------

--
-- Table structure for table `financial_year_data`
--

CREATE TABLE `financial_year_data` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `FY_id` int(11) DEFAULT NULL,
  `currency` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `financial_year_data`
--

INSERT INTO `financial_year_data` (`id`, `user_id`, `FY_id`, `currency`) VALUES
(1, 232, 2, 119),
(2, 232, 4, 3),
(3, 234, 2, 1),
(4, 231, 2, 68),
(5, 64, 2, 119),
(6, 247, 2, 119),
(7, 247, 4, 68);

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int(11) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `icon`, `status`) VALUES
(18, 'verified.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `spemployeesalarydata`
--

CREATE TABLE `spemployeesalarydata` (
  `id` int(11) NOT NULL,
  `employee_basic_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employeehrap` float(10,2) NOT NULL DEFAULT '0.00',
  `days_in_month` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `employee_code` varchar(50) NOT NULL,
  `employee_name` varchar(100) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `emp_email` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(25) NOT NULL,
  `date_of_joining` date NOT NULL,
  `pf_no` varchar(50) DEFAULT NULL,
  `uan` bigint(20) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `account_no` varchar(100) DEFAULT NULL,
  `ifsc_code` varchar(15) DEFAULT NULL,
  `esi_no` bigint(20) DEFAULT NULL,
  `addhar_name` varchar(100) NOT NULL,
  `aadhar_no` bigint(20) DEFAULT NULL,
  `pay_date` date NOT NULL,
  `pay_days` int(11) NOT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `state_name` varchar(100) DEFAULT NULL,
  `department_name` varchar(100) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `ern_basic` float(10,2) NOT NULL DEFAULT '0.00',
  `ern_hra` float(10,2) NOT NULL DEFAULT '0.00',
  `ern_spl` float(10,2) NOT NULL DEFAULT '0.00',
  `grosssalary` float(10,2) NOT NULL DEFAULT '0.00',
  `emp_pf` float(10,2) NOT NULL DEFAULT '0.00',
  `emp_esi` float(10,2) NOT NULL DEFAULT '0.00',
  `itax` float(10,2) NOT NULL DEFAULT '0.00',
  `grossded` float(10,2) NOT NULL DEFAULT '0.00',
  `net_pay` float(10,2) NOT NULL DEFAULT '0.00',
  `empr_pf` float(10,2) NOT NULL DEFAULT '0.00',
  `fpf` float(10,2) NOT NULL DEFAULT '0.00',
  `empr_esi` float(10,2) NOT NULL DEFAULT '0.00',
  `total` float(10,2) NOT NULL DEFAULT '0.00',
  `generated_month` date DEFAULT NULL,
  `generated_to` date DEFAULT NULL,
  `generated_from` date DEFAULT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `spemployeesalarydata`
--

INSERT INTO `spemployeesalarydata` (`id`, `employee_basic_mt`, `employeehrap`, `days_in_month`, `user_id`, `employee_code`, `employee_name`, `father_name`, `emp_email`, `dob`, `gender`, `date_of_joining`, `pf_no`, `uan`, `pan_no`, `account_no`, `ifsc_code`, `esi_no`, `addhar_name`, `aadhar_no`, `pay_date`, `pay_days`, `bank_name`, `location_name`, `state_name`, `department_name`, `role_name`, `ern_basic`, `ern_hra`, `ern_spl`, `grosssalary`, `emp_pf`, `emp_esi`, `itax`, `grossded`, `net_pay`, `empr_pf`, `fpf`, `empr_esi`, `total`, `generated_month`, `generated_to`, `generated_from`, `organization_id`, `created_at`, `updated_at`) VALUES
(571, 26180.00, 50.00, 30, 64, 'KMT001', 'Nitin Jaiswal', 'demo', 'jyoti@gmail.com', '2023-09-06', 'male', '2023-09-06', '12234545454555', 12234545454555, 'BUYPM41415', '56757657657', '6575675', 1223454545, 'Nitin Jaiswal', 657657657567, '2023-09-30', 4, 'ALLAHABAD BANK', NULL, NULL, 'Human Resources', ' HR Manager', 3490.68, 1745.34, 0.00, 5236.02, 418.88, 39.27, 0.00, 458.15, 4777.87, 128.11, 290.77, 170.17, 589.05, '2023-09-01', '2023-09-01', '2023-09-13', 3, '2023-09-13 06:16:57', '2023-09-13 06:16:57'),
(572, 0.00, 0.00, 30, 196, 'KMT002', 'Prasant Singh', 'demo', 'demo@gmail.com', '2023-09-03', 'male', '2023-09-05', NULL, NULL, NULL, '56757657658', '6575679', NULL, 'Prasant Singh', NULL, '2023-09-30', 3, 'HDFC', NULL, NULL, 'Maintenance and support ', 'Manager', 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '2023-09-01', '2023-09-01', '2023-09-13', 3, '2023-09-13 06:16:58', '2023-09-13 06:16:58');

-- --------------------------------------------------------

--
-- Table structure for table `sp_activity_logs`
--

CREATE TABLE `sp_activity_logs` (
  `id` int(11) NOT NULL,
  `module` varchar(100) DEFAULT NULL,
  `sub_module` varchar(100) DEFAULT NULL,
  `heading` text NOT NULL,
  `activity` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(150) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `platform` varchar(50) NOT NULL COMMENT '1=>web,2=>app,3=>system',
  `platform_icon` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_activity_logs`
--

INSERT INTO `sp_activity_logs` (`id`, `module`, `sub_module`, `heading`, `activity`, `user_id`, `user_name`, `icon`, `platform`, `platform_icon`, `created_at`, `updated_at`) VALUES
(1, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 03:28 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 09:58:02', '2024-04-12 09:58:02'),
(2, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 03:49 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 10:19:00', '2024-04-12 10:19:00'),
(3, 'Leave Management', 'Leave Request', 'New holiday has been created.', 'New holiday has been created by Sort String Solution on 12/04/2024 | 03:52 PM', 1, 'Sort String Solution', 'add.png', '2', 'web.png', '2024-04-12 10:22:21', '2024-04-12 10:22:21'),
(4, 'Leave Management', 'Leave Request', 'New holiday has been created.', 'New holiday has been created by Sort String Solution on 12/04/2024 | 03:54 PM', 1, 'Sort String Solution', 'add.png', '2', 'web.png', '2024-04-12 10:24:26', '2024-04-12 10:24:26'),
(5, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 03:56 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 10:26:50', '2024-04-12 10:26:50'),
(6, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 04:01 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 10:31:35', '2024-04-12 10:31:35'),
(7, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 04:24 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 10:54:08', '2024-04-12 10:54:08'),
(8, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 04:37 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 11:07:46', '2024-04-12 11:07:46'),
(9, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 232, 'Rahul  Chauhan', 'markedAtten.png', '2', 'app.png', '2024-04-12 11:15:25', '2024-04-12 11:15:25'),
(10, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 12/04/2024 | 04:53 PM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-04-12 11:23:05', '2024-04-12 11:23:05'),
(11, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 04:55 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 11:25:18', '2024-04-12 11:25:18'),
(12, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 12/04/2024 | 05:13 PM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-04-12 11:43:39', '2024-04-12 11:43:39'),
(13, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 05:20 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 11:50:51', '2024-04-12 11:50:51'),
(14, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:23 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 11:53:35', '2024-04-12 11:53:35'),
(15, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 05:24 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 11:54:19', '2024-04-12 11:54:19'),
(16, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:31 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:01:42', '2024-04-12 12:01:42'),
(17, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:35 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:05:53', '2024-04-12 12:05:53'),
(18, 'Leave Management', 'Leave Request', 'New Leave Request has been initiated', 'New Leave Request has been initiated by Rahul  Chauhan on 12/04/2024 | 05:40 PM', 232, 'Rahul  Chauhan', 'add.png', '2', 'app.png', '2024-04-12 12:10:13', '2024-04-12 12:10:13'),
(19, 'Login', 'Login', 'Abhishek Kumar Mishra has been logged In', 'Abhishek Kumar Mishra has been logged In on 12/04/2024 | 05:44 PM', 230, 'Abhishek Kumar Mishra', 'noti.png', '2', 'mobile.png', '2024-04-12 12:14:47', '2024-04-12 12:14:47'),
(20, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:44 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:14:55', '2024-04-12 12:14:55'),
(21, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:50 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:20:58', '2024-04-12 12:20:58'),
(22, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 05:55 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:25:21', '2024-04-12 12:25:21'),
(23, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by Rahul  Chauhan on 12/04/2024 | 06:02 PM', 232, 'Rahul  Chauhan', 'UserCredentialChange.png', '2', 'app.png', '2024-04-12 12:32:21', '2024-04-12 12:32:21'),
(24, 'Login', 'Login', 'Abhishek Kumar Mishra has been logged In', 'Abhishek Kumar Mishra has been logged In on 12/04/2024 | 06:04 PM', 230, 'Abhishek Kumar Mishra', 'noti.png', '2', 'mobile.png', '2024-04-12 12:34:39', '2024-04-12 12:34:39'),
(25, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 06:05 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 12:35:30', '2024-04-12 12:35:30'),
(26, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 06:59 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 13:29:12', '2024-04-12 13:29:12'),
(27, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 07:11 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 13:41:58', '2024-04-12 13:41:58'),
(28, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 07:11 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 13:41:59', '2024-04-12 13:41:59'),
(29, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by DEMO  NAME on 12/04/2024 | 07:16 PM', 206, 'DEMO  NAME', 'userTag.png', '2', 'app.png', '2024-04-12 13:47:00', '2024-04-12 13:47:00'),
(30, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 08:20 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 14:50:47', '2024-04-12 14:50:47'),
(31, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 08:28 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 14:58:24', '2024-04-12 14:58:24'),
(32, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 08:29 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 14:59:11', '2024-04-12 14:59:11'),
(33, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 08:58 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 15:28:23', '2024-04-12 15:28:23'),
(34, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 09:26 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 15:56:27', '2024-04-12 15:56:27'),
(35, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 09:28 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 15:58:21', '2024-04-12 15:58:21'),
(36, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 09:33 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 16:03:38', '2024-04-12 16:03:38'),
(37, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 09:43 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 16:13:02', '2024-04-12 16:13:02'),
(38, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 12/04/2024 | 09:51 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 16:21:49', '2024-04-12 16:21:49'),
(39, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 12/04/2024 | 10:42 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-12 17:12:01', '2024-04-12 17:12:01'),
(40, 'Login', 'Login', 'Abhishek Kumar Mishra has been logged In', 'Abhishek Kumar Mishra has been logged In on 12/04/2024 | 10:51 PM', 230, 'Abhishek Kumar Mishra', 'noti.png', '2', 'mobile.png', '2024-04-12 17:21:13', '2024-04-12 17:21:13'),
(41, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 10:53 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 17:23:15', '2024-04-12 17:23:15'),
(42, 'Login', 'Login', 'DEMO  NAME has been logged In', 'DEMO  NAME has been logged In on 12/04/2024 | 10:57 PM', 206, 'DEMO  NAME', 'noti.png', '2', 'mobile.png', '2024-04-12 17:27:50', '2024-04-12 17:27:50'),
(43, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by DEMO  NAME on 12/04/2024 | 10:59 PM', 206, 'DEMO  NAME', 'UserCredentialChange.png', '2', 'app.png', '2024-04-12 17:29:23', '2024-04-12 17:29:23'),
(44, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 13/04/2024 | 12:23 AM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-12 18:53:19', '2024-04-12 18:53:19'),
(45, 'Login', 'Login', 'Rishabh  Singh has been logged In', 'Rishabh  Singh has been logged In on 14/04/2024 | 10:23 AM', 231, 'Rishabh  Singh', 'noti.png', '2', 'mobile.png', '2024-04-14 04:53:20', '2024-04-14 04:53:20'),
(46, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 14/04/2024 | 11:20 AM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-14 05:50:23', '2024-04-14 05:50:23'),
(47, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 14/04/2024 | 11:21 AM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-14 05:51:20', '2024-04-14 05:51:20'),
(48, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 232, 'Rahul  Chauhan', 'markedAtten.png', '2', 'app.png', '2024-04-14 05:58:11', '2024-04-14 05:58:11'),
(49, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 14/04/2024 | 11:36 AM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-04-14 06:06:06', '2024-04-14 06:06:06'),
(50, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 14/04/2024 | 03:42 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-14 10:12:23', '2024-04-14 10:12:23'),
(51, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 15/04/2024 | 10:27 AM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-15 04:57:18', '2024-04-15 04:57:18'),
(52, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 11:38 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 06:08:06', '2024-04-15 06:08:06'),
(53, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 15/04/2024 | 12:04 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-15 06:34:52', '2024-04-15 06:34:52'),
(54, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 15/04/2024 | 04:19 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-15 10:49:21', '2024-04-15 10:49:21'),
(55, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 04:20 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 10:50:06', '2024-04-15 10:50:06'),
(56, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by play  Store on 15/04/2024 | 04:25 PM', 64, 'play  Store', 'userTag.png', '2', 'app.png', '2024-04-15 10:55:58', '2024-04-15 10:55:58'),
(57, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 04:51 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 11:21:24', '2024-04-15 11:21:24'),
(58, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by play  Store on 15/04/2024 | 05:06 PM', 64, 'play  Store', 'userTag.png', '2', 'app.png', '2024-04-15 11:36:22', '2024-04-15 11:36:22'),
(59, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by play  Store on 15/04/2024 | 05:23 PM', 64, 'play  Store', 'userTag.png', '2', 'app.png', '2024-04-15 11:53:26', '2024-04-15 11:53:26'),
(60, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by play  Store on 15/04/2024 | 05:26 PM', 64, 'play  Store', 'userTag.png', '2', 'app.png', '2024-04-15 11:56:33', '2024-04-15 11:56:33'),
(61, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 15/04/2024 | 05:33 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-15 12:03:39', '2024-04-15 12:03:39'),
(62, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 05:39 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 12:09:49', '2024-04-15 12:09:49'),
(63, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 05:42 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 12:12:36', '2024-04-15 12:12:36'),
(64, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 06:59 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 13:29:57', '2024-04-15 13:29:57'),
(65, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 07:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 13:32:25', '2024-04-15 13:32:25'),
(66, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 07:06 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 13:36:13', '2024-04-15 13:36:13'),
(67, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 07:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 13:39:23', '2024-04-15 13:39:23'),
(68, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:43 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:13:33', '2024-04-15 17:13:33'),
(69, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:46 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:16:42', '2024-04-15 17:16:42'),
(70, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:47 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:17:19', '2024-04-15 17:17:19'),
(71, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:51 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:21:18', '2024-04-15 17:21:18'),
(72, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:58 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:28:00', '2024-04-15 17:28:00'),
(73, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 10:58 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 17:28:19', '2024-04-15 17:28:19'),
(74, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 15/04/2024 | 11:40 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 18:10:48', '2024-04-15 18:10:48'),
(75, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:00 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 18:30:44', '2024-04-15 18:30:44'),
(76, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:23 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 19:53:38', '2024-04-15 19:53:38'),
(77, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:32 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:02:11', '2024-04-15 20:02:11'),
(78, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:08 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:38:04', '2024-04-15 20:38:04'),
(79, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:10 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:40:53', '2024-04-15 20:40:53'),
(80, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:12 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:42:06', '2024-04-15 20:42:06'),
(81, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:12 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:42:22', '2024-04-15 20:42:22'),
(82, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:12 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:42:50', '2024-04-15 20:42:50'),
(83, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:15 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:45:23', '2024-04-15 20:45:23'),
(84, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:15 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:45:32', '2024-04-15 20:45:32'),
(85, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:17 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-15 20:47:24', '2024-04-15 20:47:24'),
(86, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:36 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:06:19', '2024-04-16 00:06:19'),
(87, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:41 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:11:43', '2024-04-16 00:11:43'),
(88, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:00 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:30:26', '2024-04-16 00:30:26'),
(89, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:03 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:33:06', '2024-04-16 00:33:06'),
(90, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:05 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:35:15', '2024-04-16 00:35:15'),
(91, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:12 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:42:16', '2024-04-16 00:42:16'),
(92, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:17 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:47:05', '2024-04-16 00:47:05'),
(93, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:17 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:47:05', '2024-04-16 00:47:05'),
(94, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:18 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 00:48:15', '2024-04-16 00:48:15'),
(95, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:31 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 01:01:32', '2024-04-16 01:01:32'),
(96, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 07:39 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 02:09:51', '2024-04-16 02:09:51'),
(97, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 07:40 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 02:10:07', '2024-04-16 02:10:07'),
(98, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 07:40 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 02:10:45', '2024-04-16 02:10:45'),
(99, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 07:46 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 02:16:32', '2024-04-16 02:16:32'),
(100, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 08:42 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 03:12:03', '2024-04-16 03:12:03'),
(101, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 08:58 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 03:28:23', '2024-04-16 03:28:23'),
(102, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 09:22 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 03:52:45', '2024-04-16 03:52:45'),
(103, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 09:24 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 03:54:36', '2024-04-16 03:54:36'),
(104, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 09:39 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 04:09:54', '2024-04-16 04:09:54'),
(105, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 09:50 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 04:20:06', '2024-04-16 04:20:06'),
(106, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:22 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 04:52:17', '2024-04-16 04:52:17'),
(107, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 16/04/2024 | 10:42 AM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-16 05:12:03', '2024-04-16 05:12:03'),
(108, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:53 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:23:50', '2024-04-16 05:23:50'),
(109, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:55 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:25:48', '2024-04-16 05:25:48'),
(110, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:56 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:26:01', '2024-04-16 05:26:01'),
(111, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:56 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:26:43', '2024-04-16 05:26:43'),
(112, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 10:57 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:27:18', '2024-04-16 05:27:18'),
(113, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:04 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:34:02', '2024-04-16 05:34:02'),
(114, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:15 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:45:33', '2024-04-16 05:45:33'),
(115, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:16 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:46:02', '2024-04-16 05:46:02'),
(116, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:20 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:50:54', '2024-04-16 05:50:54'),
(117, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:22 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:52:35', '2024-04-16 05:52:35'),
(118, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:27 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:57:15', '2024-04-16 05:57:15'),
(119, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:27 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:57:32', '2024-04-16 05:57:32'),
(120, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:28 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:58:05', '2024-04-16 05:58:05'),
(121, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:28 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:58:15', '2024-04-16 05:58:15'),
(122, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:29 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 05:59:24', '2024-04-16 05:59:24'),
(123, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:32 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:02:41', '2024-04-16 06:02:41'),
(124, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:33 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:03:39', '2024-04-16 06:03:39'),
(125, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:34 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:04:39', '2024-04-16 06:04:39'),
(126, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:39 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:09:48', '2024-04-16 06:09:48'),
(127, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:41 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:11:52', '2024-04-16 06:11:52'),
(128, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:44 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:14:25', '2024-04-16 06:14:25'),
(129, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:51 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:21:10', '2024-04-16 06:21:10'),
(130, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:51 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:21:20', '2024-04-16 06:21:20'),
(131, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:54 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:24:55', '2024-04-16 06:24:55'),
(132, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:56 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:26:46', '2024-04-16 06:26:46'),
(133, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:57 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:27:56', '2024-04-16 06:27:56'),
(134, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by play  Store on 16/04/2024 | 11:59 AM', 64, 'play  Store', 'userTag.png', '2', 'app.png', '2024-04-16 06:29:46', '2024-04-16 06:29:46'),
(135, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:59 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:29:59', '2024-04-16 06:29:59'),
(136, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:32:21', '2024-04-16 06:32:21'),
(137, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:32:59', '2024-04-16 06:32:59'),
(138, 'Login', 'Login', 'Rishabh  Singh has been logged In', 'Rishabh  Singh has been logged In on 16/04/2024 | 12:14 PM', 231, 'Rishabh  Singh', 'noti.png', '2', 'mobile.png', '2024-04-16 06:44:24', '2024-04-16 06:44:24'),
(139, 'Users Management', 'Users', 'test  user Block', 'test  user Block by Sort String Solution on 16/04/2024 | 12:17 PM', 1, 'Sort String Solution', 'icon', '1', 'platform_icon', '2024-04-16 06:47:17', '2024-04-16 06:47:17'),
(140, 'Users Management', 'Users', 'test  user Unblock', 'test  user Unblock by Sort String Solution on 16/04/2024 | 12:17 PM', 1, 'Sort String Solution', 'icon', '1', 'platform_icon', '2024-04-16 06:47:19', '2024-04-16 06:47:19'),
(141, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:21 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 06:51:19', '2024-04-16 06:51:19'),
(142, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:31 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:01:19', '2024-04-16 07:01:19'),
(143, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:31 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:01:57', '2024-04-16 07:01:57'),
(144, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:34 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:04:51', '2024-04-16 07:04:51'),
(145, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:36 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:06:19', '2024-04-16 07:06:19'),
(146, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:39 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:09:33', '2024-04-16 07:09:33'),
(147, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 231, 'Rishabh  Singh', 'markedAtten.png', '2', 'app.png', '2024-04-16 07:11:07', '2024-04-16 07:11:07'),
(148, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:41 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:11:20', '2024-04-16 07:11:20'),
(149, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:41 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:11:35', '2024-04-16 07:11:35'),
(150, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:42 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:12:22', '2024-04-16 07:12:22'),
(151, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:43 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:13:56', '2024-04-16 07:13:56'),
(152, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:44 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:14:36', '2024-04-16 07:14:36'),
(153, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:45 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:16:00', '2024-04-16 07:16:00'),
(154, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:46 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:16:48', '2024-04-16 07:16:48'),
(155, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:58 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:28:20', '2024-04-16 07:28:20'),
(156, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 12:59 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:29:33', '2024-04-16 07:29:33'),
(157, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:00 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:30:24', '2024-04-16 07:30:24'),
(158, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:32:27', '2024-04-16 07:32:27'),
(159, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:03 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:33:15', '2024-04-16 07:33:15'),
(160, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:04 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:34:40', '2024-04-16 07:34:40'),
(161, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:05 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:35:26', '2024-04-16 07:35:26'),
(162, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:39:57', '2024-04-16 07:39:57'),
(163, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:20 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:50:25', '2024-04-16 07:50:25'),
(164, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:21 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:51:55', '2024-04-16 07:51:55'),
(165, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:22 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:52:01', '2024-04-16 07:52:01'),
(166, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:22 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:52:49', '2024-04-16 07:52:49'),
(167, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:24 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:54:39', '2024-04-16 07:54:39'),
(168, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:25 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:55:45', '2024-04-16 07:55:45'),
(169, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:26 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:56:11', '2024-04-16 07:56:11'),
(170, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:26 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:56:47', '2024-04-16 07:56:47'),
(171, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:27 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 07:57:55', '2024-04-16 07:57:55'),
(172, 'User Attendance', 'User Attendance', 'Attendance', 'Day end', 231, 'Rishabh  Singh', 'markedAtten.png', '2', 'app.png', '2024-04-16 08:00:28', '2024-04-16 08:00:28'),
(173, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 01:39 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 08:09:02', '2024-04-16 08:09:02'),
(174, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 08:32:48', '2024-04-16 08:32:48'),
(175, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 08:39:11', '2024-04-16 08:39:11'),
(176, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 08:39:57', '2024-04-16 08:39:57'),
(177, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:14 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 08:44:17', '2024-04-16 08:44:17'),
(178, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 02:57 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 09:27:33', '2024-04-16 09:27:33'),
(179, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 16/04/2024 | 02:59 PM', 232, 'Rahul  Chauhan', 'noti.png', '2', 'mobile.png', '2024-04-16 09:29:51', '2024-04-16 09:29:51'),
(180, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 04:07 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 10:37:44', '2024-04-16 10:37:44'),
(181, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 04:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 10:39:15', '2024-04-16 10:39:15'),
(182, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 04:32 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:02:59', '2024-04-16 11:02:59'),
(183, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 04:44 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:14:53', '2024-04-16 11:14:53'),
(184, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:02 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:32:48', '2024-04-16 11:32:48'),
(185, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:04 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:34:40', '2024-04-16 11:34:40'),
(186, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:05 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:35:23', '2024-04-16 11:35:23'),
(187, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:06 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:36:30', '2024-04-16 11:36:30'),
(188, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:08 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:38:14', '2024-04-16 11:38:14'),
(189, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:08 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:38:52', '2024-04-16 11:38:52'),
(190, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:10 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:40:09', '2024-04-16 11:40:09'),
(191, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:21 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:51:47', '2024-04-16 11:51:47'),
(192, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:24 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:54:47', '2024-04-16 11:54:47'),
(193, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:29 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 11:59:52', '2024-04-16 11:59:52'),
(194, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:45 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:15:46', '2024-04-16 12:15:46'),
(195, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:51 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:21:39', '2024-04-16 12:21:39'),
(196, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 05:58 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:28:46', '2024-04-16 12:28:46'),
(197, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:05 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:35:30', '2024-04-16 12:35:30'),
(198, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:06 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:36:39', '2024-04-16 12:36:39'),
(199, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:07 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:37:45', '2024-04-16 12:37:45'),
(200, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 12:39:28', '2024-04-16 12:39:28'),
(201, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:50 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 13:20:20', '2024-04-16 13:20:20'),
(202, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:52 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 13:22:36', '2024-04-16 13:22:36'),
(203, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 06:54 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 13:24:08', '2024-04-16 13:24:08'),
(204, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 16/04/2024 | 11:07 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-16 17:37:26', '2024-04-16 17:37:26'),
(205, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 17/04/2024 | 06:48 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 01:18:23', '2024-04-17 01:18:23'),
(206, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 17/04/2024 | 03:51 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 10:21:37', '2024-04-17 10:21:37'),
(207, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:00 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 18:30:19', '2024-04-17 18:30:19'),
(208, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:10 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 18:40:36', '2024-04-17 18:40:36'),
(209, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:10 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 18:40:56', '2024-04-17 18:40:56'),
(210, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:12 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 18:42:30', '2024-04-17 18:42:30'),
(211, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:22 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 18:52:17', '2024-04-17 18:52:17'),
(212, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:36 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 19:06:43', '2024-04-17 19:06:43'),
(213, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 12:36 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-17 19:06:53', '2024-04-17 19:06:53'),
(214, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 09:36 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 04:06:54', '2024-04-18 04:06:54'),
(215, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 10:04 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 04:34:37', '2024-04-18 04:34:37'),
(216, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 10:06 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 04:36:23', '2024-04-18 04:36:23'),
(217, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 10:17 AM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 04:47:01', '2024-04-18 04:47:01'),
(218, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:15 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 09:45:41', '2024-04-18 09:45:41'),
(219, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:16 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 09:46:17', '2024-04-18 09:46:17'),
(220, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:18 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 09:48:21', '2024-04-18 09:48:21'),
(221, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:19 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 09:49:35', '2024-04-18 09:49:35'),
(222, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:23 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 09:53:08', '2024-04-18 09:53:08'),
(223, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:36 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:06:12', '2024-04-18 10:06:12'),
(224, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:44 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:14:54', '2024-04-18 10:14:54'),
(225, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 03:57 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:27:11', '2024-04-18 10:27:11'),
(226, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:07 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:37:26', '2024-04-18 10:37:26'),
(227, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:09 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:39:01', '2024-04-18 10:39:01'),
(228, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:11 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:41:35', '2024-04-18 10:41:35'),
(229, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:19 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 10:49:17', '2024-04-18 10:49:17'),
(230, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:44 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 11:14:36', '2024-04-18 11:14:36'),
(231, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:53 PM', 64, 'play  Store', 'noti.png', '2', 'mobile.png', '2024-04-18 11:23:22', '2024-04-18 11:23:22'),
(232, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 18/04/2024 | 04:57 PM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-18 11:27:12', '2024-04-18 11:27:12');
INSERT INTO `sp_activity_logs` (`id`, `module`, `sub_module`, `heading`, `activity`, `user_id`, `user_name`, `icon`, `platform`, `platform_icon`, `created_at`, `updated_at`) VALUES
(233, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 04:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-18 11:29:59', '2024-04-18 11:29:59'),
(234, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 05:05 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-18 11:35:22', '2024-04-18 11:35:22'),
(235, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 05:10 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-18 11:40:37', '2024-04-18 11:40:37'),
(236, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 05:11 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-18 11:41:05', '2024-04-18 11:41:05'),
(237, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 18/04/2024 | 07:06 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-18 13:36:16', '2024-04-18 13:36:16'),
(238, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 64, 'play  Store', 'markedAtten.png', '2', 'app.png', '2024-04-18 13:44:03', '2024-04-18 13:44:03'),
(239, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 12:07 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 06:37:53', '2024-04-19 06:37:53'),
(240, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 01:13 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 07:43:02', '2024-04-19 07:43:02'),
(241, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 01:14 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 07:44:37', '2024-04-19 07:44:37'),
(242, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 01:14 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 07:44:54', '2024-04-19 07:44:54'),
(243, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 01:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 08:29:16', '2024-04-19 08:29:16'),
(244, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 01:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 08:29:18', '2024-04-19 08:29:18'),
(245, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:03 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 08:33:28', '2024-04-19 08:33:28'),
(246, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:09 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 08:39:19', '2024-04-19 08:39:19'),
(247, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:34 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:04:51', '2024-04-19 09:04:51'),
(248, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:41 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:11:55', '2024-04-19 09:11:55'),
(249, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:51 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:21:04', '2024-04-19 09:21:04'),
(250, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:54 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:24:22', '2024-04-19 09:24:22'),
(251, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 02:58 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:28:36', '2024-04-19 09:28:36'),
(252, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:00 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:30:05', '2024-04-19 09:30:05'),
(253, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:03 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:33:23', '2024-04-19 09:33:23'),
(254, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:04 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 09:34:23', '2024-04-19 09:34:23'),
(255, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:31 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:01:53', '2024-04-19 10:01:53'),
(256, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:32 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:02:51', '2024-04-19 10:02:51'),
(257, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:34 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:04:54', '2024-04-19 10:04:54'),
(258, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 03:39 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:09:35', '2024-04-19 10:09:35'),
(259, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:24 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:54:26', '2024-04-19 10:54:26'),
(260, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:29 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 10:59:12', '2024-04-19 10:59:12'),
(261, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:30 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:00:52', '2024-04-19 11:00:52'),
(262, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:47 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:17:13', '2024-04-19 11:17:13'),
(263, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:48 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:18:17', '2024-04-19 11:18:17'),
(264, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:52 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:22:42', '2024-04-19 11:22:42'),
(265, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:54 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:24:58', '2024-04-19 11:24:58'),
(266, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:55 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:25:10', '2024-04-19 11:25:10'),
(267, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:56 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:26:38', '2024-04-19 11:26:38'),
(268, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:57 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:27:37', '2024-04-19 11:27:37'),
(269, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 04:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:29:16', '2024-04-19 11:29:16'),
(270, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:01 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:31:54', '2024-04-19 11:31:54'),
(271, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:02 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:32:30', '2024-04-19 11:32:30'),
(272, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:03 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:33:10', '2024-04-19 11:33:10'),
(273, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:08 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:38:36', '2024-04-19 11:38:36'),
(274, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:08 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:38:37', '2024-04-19 11:38:37'),
(275, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:12 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:42:17', '2024-04-19 11:42:17'),
(276, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:15 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:45:48', '2024-04-19 11:45:48'),
(277, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:19 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:49:48', '2024-04-19 11:49:48'),
(278, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:23 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 11:53:07', '2024-04-19 11:53:07'),
(279, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:31 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:01:09', '2024-04-19 12:01:09'),
(280, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:38 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:08:31', '2024-04-19 12:08:31'),
(281, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:39 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:09:29', '2024-04-19 12:09:29'),
(282, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:45 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:15:27', '2024-04-19 12:15:27'),
(283, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:46 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:17:00', '2024-04-19 12:17:00'),
(284, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 05:56 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:26:00', '2024-04-19 12:26:00'),
(285, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 19/04/2024 | 05:57 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-19 12:27:30', '2024-04-19 12:27:30'),
(286, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:00 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:30:41', '2024-04-19 12:30:41'),
(287, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:02 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:32:31', '2024-04-19 12:32:31'),
(288, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:03 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:33:10', '2024-04-19 12:33:10'),
(289, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:04 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:34:17', '2024-04-19 12:34:17'),
(290, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:04 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:34:50', '2024-04-19 12:34:50'),
(291, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:06 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:36:26', '2024-04-19 12:36:26'),
(292, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:06 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:36:48', '2024-04-19 12:36:48'),
(293, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:09 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:39:39', '2024-04-19 12:39:39'),
(294, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:09 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:39:42', '2024-04-19 12:39:42'),
(295, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:10 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:40:12', '2024-04-19 12:40:12'),
(296, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 64, 'play  Store', 'markedAtten.png', '2', 'app.png', '2024-04-19 12:44:28', '2024-04-19 12:44:28'),
(297, 'User Attendance', 'User Attendance', 'Attendance', 'Day end', 64, 'play  Store', 'markedAtten.png', '2', 'app.png', '2024-04-19 12:46:22', '2024-04-19 12:46:22'),
(298, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:18 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 12:48:30', '2024-04-19 12:48:30'),
(299, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 06:30 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 13:00:58', '2024-04-19 13:00:58'),
(300, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 19/04/2024 | 08:25 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-19 14:55:27', '2024-04-19 14:55:27'),
(301, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 20/04/2024 | 08:58 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-20 03:28:16', '2024-04-20 03:28:16'),
(302, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 20/04/2024 | 10:00 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-20 04:30:17', '2024-04-20 04:30:17'),
(303, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 20/04/2024 | 11:09 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-20 05:39:18', '2024-04-20 05:39:18'),
(304, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 20/04/2024 | 11:11 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-20 05:41:06', '2024-04-20 05:41:06'),
(305, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 20/04/2024 | 01:11 PM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-20 07:41:44', '2024-04-20 07:41:44'),
(306, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 20/04/2024 | 03:15 PM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-20 09:45:14', '2024-04-20 09:45:14'),
(307, 'Login', 'Login', 'test  employee has been logged In', 'test  employee has been logged In on 20/04/2024 | 03:15 PM', 233, 'test  employee', 'login.png', '2', 'app.png', '2024-04-20 09:45:38', '2024-04-20 09:45:38'),
(308, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by test  employee on 20/04/2024 | 03:16 PM', 233, 'test  employee', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 09:46:33', '2024-04-20 09:46:33'),
(309, 'User Management', 'Regularization', 'Regularization Request has been forwarded', 'Regularization Request has been forwarded by Sort String Solution on 20/04/2024 | 03:18 PM. test', 1, 'Sort String Solution', 'forwaord.png', '1', 'web.png', '2024-04-20 09:48:49', '2024-04-20 09:48:49'),
(310, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 03:19 PM. Approved', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(311, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:37 PM. dfkdcjhaiouwerdlx', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:07:46', '2024-04-20 12:07:46'),
(312, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:38 PM. dfjxhcjgarsd', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:08:19', '2024-04-20 12:08:19'),
(313, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:55 PM. xfjkdgldm', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:25:22', '2024-04-20 12:25:22'),
(314, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:57 PM. nfgxdkjlx', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(315, 'User Management', 'regularization', 'Regularization Request has been declined', 'Regularization Request has been declined by Sort String Solution on 20/04/2024 | 05:57 PM. sknfdzsdl', 1, 'Sort String Solution', 'declined.svg', '1', 'web.png', '2024-04-20 12:27:52', '2024-04-20 12:27:52'),
(316, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:58 PM. sjgndfkslm', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(317, 'User Management', 'regularization', 'Regularization Request has been declined', 'Regularization Request has been declined by Sort String Solution on 20/04/2024 | 05:58 PM. skzdglfcmx,', 1, 'Sort String Solution', 'declined.svg', '1', 'web.png', '2024-04-20 12:28:10', '2024-04-20 12:28:10'),
(318, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by test  employee on 20/04/2024 | 05:59 PM', 233, 'test  employee', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 12:29:33', '2024-04-20 12:29:33'),
(319, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 05:59 PM. brsidhyf8xo', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(320, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by test  employee on 20/04/2024 | 06:00 PM', 233, 'test  employee', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 12:30:59', '2024-04-20 12:30:59'),
(321, 'User Management', 'regularization', 'Regularization Request has been declined', 'Regularization Request has been declined by Sort String Solution on 20/04/2024 | 06:01 PM. iygefy8wd', 1, 'Sort String Solution', 'declined.svg', '1', 'web.png', '2024-04-20 12:31:12', '2024-04-20 12:31:12'),
(322, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by test  employee on 20/04/2024 | 06:02 PM', 233, 'test  employee', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 12:32:55', '2024-04-20 12:32:55'),
(323, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by test  employee on 20/04/2024 | 06:03 PM', 233, 'test  employee', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 12:33:36', '2024-04-20 12:33:36'),
(324, 'Login', 'Login', 'test  employee has been logged In', 'test  employee has been logged In on 20/04/2024 | 06:47 PM', 233, 'test  employee', 'login.png', '2', 'app.png', '2024-04-20 13:17:24', '2024-04-20 13:17:24'),
(325, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 20/04/2024 | 06:47 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-20 13:17:49', '2024-04-20 13:17:49'),
(326, 'Regularization', 'Regularization request', 'Regularization request has been generated', 'Regularization request has been generated by Rahul  Chauhan on 20/04/2024 | 06:52 PM', 232, 'Rahul  Chauhan', 'UserCredentialChange.png', '2', 'app.png', '2024-04-20 13:22:25', '2024-04-20 13:22:25'),
(327, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 20/04/2024 | 06:54 PM. bjdfjyfgxuytr', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(328, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 21/04/2024 | 04:44 PM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-21 11:14:29', '2024-04-21 11:14:29'),
(329, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 21/04/2024 | 04:47 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-21 11:17:06', '2024-04-21 11:17:06'),
(330, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 22/04/2024 | 09:24 AM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-22 03:54:52', '2024-04-22 03:54:52'),
(331, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 22/04/2024 | 10:04 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-22 04:34:53', '2024-04-22 04:34:53'),
(332, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 22/04/2024 | 11:57 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-22 06:27:33', '2024-04-22 06:27:33'),
(333, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 22/04/2024 | 11:58 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-22 06:28:35', '2024-04-22 06:28:35'),
(334, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 232, 'Rahul  Chauhan', 'markedAtten.png', '2', 'app.png', '2024-04-22 06:29:27', '2024-04-22 06:29:27'),
(335, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 22/04/2024 | 12:22 PM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-04-22 06:52:53', '2024-04-22 06:52:53'),
(336, 'User Management', 'Regularization', 'Regularization Request has been approved', 'Regularization Request has been approved by Sort String Solution on 22/04/2024 | 12:42 PM. fiwfhoiew', 1, 'Sort String Solution', 'approved.svg', '1', 'web.png', '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(337, 'User Management', 'regularization', 'Regularization Request has been declined', 'Regularization Request has been declined by Sort String Solution on 22/04/2024 | 12:42 PM. sfnef\n', 1, 'Sort String Solution', 'declined.svg', '1', 'web.png', '2024-04-22 07:12:58', '2024-04-22 07:12:58'),
(338, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 22/04/2024 | 06:16 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-22 12:46:26', '2024-04-22 12:46:26'),
(339, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 22/04/2024 | 07:51 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-22 14:21:55', '2024-04-22 14:21:55'),
(340, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:30 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:00:03', '2024-04-23 05:00:03'),
(341, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:33 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:03:45', '2024-04-23 05:03:45'),
(342, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:42 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:12:32', '2024-04-23 05:12:32'),
(343, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:43 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:13:20', '2024-04-23 05:13:20'),
(344, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:43 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:13:34', '2024-04-23 05:13:34'),
(345, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:43 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:13:42', '2024-04-23 05:13:42'),
(346, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:43 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:13:50', '2024-04-23 05:13:50'),
(347, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:45 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:15:51', '2024-04-23 05:15:51'),
(348, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:46 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:16:09', '2024-04-23 05:16:09'),
(349, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:48 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:18:06', '2024-04-23 05:18:06'),
(350, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 10:53 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 05:23:29', '2024-04-23 05:23:29'),
(351, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 11:50 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 06:20:47', '2024-04-23 06:20:47'),
(352, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 11:50 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 06:20:48', '2024-04-23 06:20:48'),
(353, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 11:51 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 06:21:01', '2024-04-23 06:21:01'),
(354, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 23/04/2024 | 12:25 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-23 06:55:12', '2024-04-23 06:55:12'),
(355, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 23/04/2024 | 12:28 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-23 06:58:33', '2024-04-23 06:58:33'),
(356, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 12:37 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:07:49', '2024-04-23 07:07:49'),
(357, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 12:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:29:28', '2024-04-23 07:29:28'),
(358, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 01:00 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:30:04', '2024-04-23 07:30:04'),
(359, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 01:13 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:43:16', '2024-04-23 07:43:16'),
(360, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 01:13 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:43:17', '2024-04-23 07:43:17'),
(361, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 23/04/2024 | 01:13 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-23 07:43:35', '2024-04-23 07:43:35'),
(362, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 01:55 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:25:14', '2024-04-24 08:25:14'),
(363, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 01:55 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:25:41', '2024-04-24 08:25:41'),
(364, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 01:56 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:26:20', '2024-04-24 08:26:20'),
(365, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 01:59 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:29:41', '2024-04-24 08:29:41'),
(366, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 02:00 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:30:03', '2024-04-24 08:30:03'),
(367, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 02:02 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 08:32:06', '2024-04-24 08:32:06'),
(368, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 04:15 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 10:45:34', '2024-04-24 10:45:34'),
(369, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 05:25 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 11:55:07', '2024-04-24 11:55:07'),
(370, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 06:28 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 12:58:59', '2024-04-24 12:58:59'),
(371, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 06:30 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 13:00:22', '2024-04-24 13:00:22'),
(372, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 06:31 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 13:01:57', '2024-04-24 13:01:57'),
(373, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 07:02 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 13:32:34', '2024-04-24 13:32:34'),
(374, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 10:32 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 17:02:15', '2024-04-24 17:02:15'),
(375, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 24/04/2024 | 10:52 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-24 17:22:12', '2024-04-24 17:22:12'),
(376, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 10:03 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 04:33:16', '2024-04-25 04:33:16'),
(377, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 10:17 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 04:47:56', '2024-04-25 04:47:56'),
(378, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 10:21 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 04:51:24', '2024-04-25 04:51:24'),
(379, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 10:53 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 05:23:35', '2024-04-25 05:23:35'),
(380, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 10:57 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 05:27:03', '2024-04-25 05:27:03'),
(381, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 07:41 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 14:11:50', '2024-04-25 14:11:50'),
(382, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 07:52 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 14:22:45', '2024-04-25 14:22:45'),
(383, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 08:11 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 14:41:52', '2024-04-25 14:41:52'),
(384, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 08:17 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 14:47:01', '2024-04-25 14:47:01'),
(385, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 25/04/2024 | 08:18 PM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-25 14:48:10', '2024-04-25 14:48:10'),
(386, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 26/04/2024 | 06:56 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-26 01:26:16', '2024-04-26 01:26:16'),
(387, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 26/04/2024 | 09:49 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-26 04:19:30', '2024-04-26 04:19:30'),
(388, 'User Management', 'User Management', 'User credentials updated', 'User credentials updated by Sort String Solution on 26/04/2024 | 09:50 AM', 1, 'Sort String Solution', 'updateVehiclePass.png', '1', 'web.png', '2024-04-26 04:20:13', '2024-04-26 04:20:13'),
(389, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 26/04/2024 | 09:50 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-26 04:20:34', '2024-04-26 04:20:34'),
(390, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 28/04/2024 | 11:24 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-28 05:54:47', '2024-04-28 05:54:47'),
(391, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 28/04/2024 | 11:26 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-28 05:56:19', '2024-04-28 05:56:19'),
(392, 'Login', 'Login', 'play  Store has been logged In', 'play  Store has been logged In on 30/04/2024 | 11:46 AM', 64, 'play  Store', 'login.png', '2', 'app.png', '2024-04-30 06:16:04', '2024-04-30 06:16:04'),
(393, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 30/04/2024 | 12:03 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-30 06:33:58', '2024-04-30 06:33:58'),
(394, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 30/04/2024 | 01:09 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-30 07:39:38', '2024-04-30 07:39:38'),
(395, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 30/04/2024 | 01:37 PM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-04-30 08:07:29', '2024-04-30 08:07:29'),
(396, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 30/04/2024 | 01:41 PM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-04-30 08:11:48', '2024-04-30 08:11:48'),
(397, 'Roles & Permission', 'Oragnizations', '\nEmobic Pvt Ltd Block', '\nEmobic Pvt Ltd Block by Sort String Solution on 01/05/2024 | 07:13 PM', 1, 'Sort String Solution', 'add.png', '1', 'web.png', '2024-05-01 13:43:18', '2024-05-01 13:43:18'),
(398, 'Roles & Permission', 'Oragnizations', 'New EMobility Infra and Consulting Pty Ltd added', 'EMobility Infra and Consulting Pty Ltd added by Sort String Solution on 01/05/2024 | 07:14 PM', 1, 'Sort String Solution', 'add.png', '1', 'web.png', '2024-05-01 13:44:26', '2024-05-01 13:44:26'),
(399, 'Users Management', 'Users', 'Rahul  Chauhan Unblock', 'Rahul  Chauhan Unblock by Sort String Solution on 06/05/2024 | 10:18 AM', 1, 'Sort String Solution', 'icon', '1', 'platform_icon', '2024-05-06 04:48:18', '2024-05-06 04:48:18'),
(400, 'Login', 'Login', 'Rahul  Chauhan has been logged In', 'Rahul  Chauhan has been logged In on 06/05/2024 | 10:18 AM', 232, 'Rahul  Chauhan', 'login.png', '2', 'app.png', '2024-05-06 04:48:41', '2024-05-06 04:48:41'),
(401, 'User Attendance', 'User Attendance', 'Attendance', 'Day started', 232, 'Rahul  Chauhan', 'markedAtten.png', '2', 'app.png', '2024-05-06 07:00:03', '2024-05-06 07:00:03'),
(402, 'New User', 'New Lead', 'New Lead ', 'New Lead  has been created by Rahul  Chauhan on 06/05/2024 | 12:31 PM', 232, 'Rahul  Chauhan', 'userTag.png', '2', 'app.png', '2024-05-06 07:01:15', '2024-05-06 07:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `sp_additional_responsibilities`
--

CREATE TABLE `sp_additional_responsibilities` (
  `id` int(11) NOT NULL,
  `responsibility` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_additional_responsibilities`
--

INSERT INTO `sp_additional_responsibilities` (`id`, `responsibility`, `is_active`, `created_at`, `updated_at`) VALUES
(2, 'lab', 1, '2020-08-05 13:52:06', '2020-08-05 13:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `sp_addresses`
--

CREATE TABLE `sp_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address_line_1` varchar(250) NOT NULL,
  `address_line_2` varchar(250) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district_name` varchar(222) DEFAULT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `tehsil_name` varchar(222) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `city_name` varchar(100) DEFAULT NULL,
  `pincode` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_addresses`
--

INSERT INTO `sp_addresses` (`id`, `user_id`, `type`, `address_line_1`, `address_line_2`, `country_id`, `country_name`, `state_id`, `state_name`, `district_id`, `district_name`, `tehsil_id`, `tehsil_name`, `city_id`, `city_name`, `pincode`, `created_at`, `updated_at`) VALUES
(69, 207, 'correspondence', 'df', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '33234234', '2024-04-01 04:43:36', '2024-04-01 04:43:36'),
(70, 207, 'permanent', 'df', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '33234234', '2024-04-01 04:43:36', '2024-04-01 04:43:36'),
(77, 212, 'correspondence', '539/696(khha) Chhoti Jugauli, Gomti Nagar, Lucknow', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '15354534', '2024-04-01 05:41:34', '2024-04-01 05:41:34'),
(78, 212, 'permanent', '539/696(khha) Chhoti Jugauli, Gomti Nagar, Lucknow', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '15354534', '2024-04-01 05:41:34', '2024-04-01 05:41:34'),
(99, 216, 'correspondence', 'fdd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '125254545', '2024-04-01 10:45:43', '2024-04-01 10:45:43'),
(100, 216, 'permanent', 'fdd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '125254545', '2024-04-01 10:45:43', '2024-04-01 10:45:43'),
(109, 218, 'correspondence', 'df', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '4545455454', '2024-04-01 10:53:48', '2024-04-01 10:53:48'),
(110, 218, 'permanent', 'df', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '4545455454', '2024-04-01 10:53:48', '2024-04-01 10:53:48'),
(117, 219, 'correspondence', 'efd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '122453452', '2024-04-01 11:32:03', '2024-04-01 11:32:03'),
(118, 219, 'permanent', 'efd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '122453452', '2024-04-01 11:32:03', '2024-04-01 11:32:03'),
(119, 220, 'correspondence', 'vuyh', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '35856555', '2024-04-01 11:32:43', '2024-04-01 11:32:43'),
(120, 220, 'permanent', 'vuyh', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '35856555', '2024-04-01 11:32:43', '2024-04-01 11:32:43'),
(177, 221, 'correspondence', 'fg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '656556654', '2024-04-03 12:39:20', '2024-04-03 12:39:20'),
(178, 221, 'permanent', 'fg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '656556654', '2024-04-03 12:39:20', '2024-04-03 12:39:20'),
(199, 223, 'correspondence', 'fhgfg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '474846531', '2024-04-04 09:57:30', '2024-04-04 09:57:30'),
(200, 223, 'permanent', 'fhgfg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '474846531', '2024-04-04 09:57:30', '2024-04-04 09:57:30'),
(217, 224, 'correspondence', 'L1/123', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '1212123', '2024-04-04 11:28:03', '2024-04-04 11:28:03'),
(218, 224, 'permanent', 'L1/123', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '1212123', '2024-04-04 11:28:03', '2024-04-04 11:28:03'),
(229, 225, 'correspondence', 'uidfiu', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '544521', '2024-04-04 11:49:31', '2024-04-04 11:49:31'),
(230, 225, 'permanent', 'uidfiu', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '544521', '2024-04-04 11:49:31', '2024-04-04 11:49:31'),
(247, 226, 'correspondence', 'Amarauli Shumali', 'Amrauli Sumali', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '121221', '2024-04-04 12:18:19', '2024-04-04 12:18:19'),
(248, 226, 'permanent', 'Amarauli Shumali', 'Amrauli Sumali', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '121221', '2024-04-04 12:18:19', '2024-04-04 12:18:19'),
(249, 214, 'correspondence', 'bnh', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '3232322', '2024-04-04 12:22:50', '2024-04-04 12:22:50'),
(250, 214, 'permanent', 'bnh', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '3232322', '2024-04-04 12:22:50', '2024-04-04 12:22:50'),
(255, 222, 'correspondence', 'fgd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '455454665', '2024-04-04 12:30:31', '2024-04-04 12:30:31'),
(256, 222, 'permanent', 'fgd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 29, 'Al Rufaa', '455454665', '2024-04-04 12:30:31', '2024-04-04 12:30:31'),
(263, 228, 'correspondence', 'fgdfas', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '6565465654', '2024-04-04 13:09:31', '2024-04-04 13:09:31'),
(264, 228, 'permanent', 'fgdfas', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '6565465654', '2024-04-04 13:09:31', '2024-04-04 13:09:31'),
(265, 229, 'correspondence', 'etyre', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '4556654', '2024-04-04 13:35:04', '2024-04-04 13:35:04'),
(266, 229, 'permanent', 'etyre', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '4556654', '2024-04-04 13:35:04', '2024-04-04 13:35:04'),
(285, 206, 'correspondence', '1/91 Viram Khand, Gomtinagar', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '325245', '2024-04-05 04:45:34', '2024-04-05 04:45:34'),
(286, 206, 'permanent', 'sfd', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 26, 'Jelaiah', '325245', '2024-04-05 04:45:34', '2024-04-05 04:45:34'),
(297, 230, 'correspondence', 'thyre5w', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '357765', '2024-04-11 10:55:00', '2024-04-11 10:55:00'),
(298, 230, 'permanent', 'thyre5w', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '357765', '2024-04-11 10:55:00', '2024-04-11 10:55:00'),
(325, 227, 'correspondence', 'rwfgdtr', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '665656', '2024-04-12 23:57:07', '2024-04-12 23:57:07'),
(326, 227, 'permanent', 'rwfgdtr', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '665656', '2024-04-12 23:57:07', '2024-04-12 23:57:07'),
(339, 233, 'correspondence', 'kbhkngnj', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '555646', '2024-04-15 06:46:59', '2024-04-15 06:46:59'),
(340, 233, 'permanent', 'kbhkngnj', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '555646', '2024-04-15 06:46:59', '2024-04-15 06:46:59'),
(355, 217, 'correspondence', 'dfsdf', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '544565586', '2024-04-18 11:40:04', '2024-04-18 11:40:04'),
(356, 217, 'permanent', 'dfsdf', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 5, 'Al Tarfa', '544565586', '2024-04-18 11:40:04', '2024-04-18 11:40:04'),
(359, 235, 'correspondence', 'rstjhfshdu', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '654654564', '2024-04-18 11:46:40', '2024-04-18 11:46:40'),
(360, 235, 'permanent', 'rstjhfshdu', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '654654564', '2024-04-18 11:46:40', '2024-04-18 11:46:40'),
(365, 236, 'correspondence', 'biutfduo', 'aerihsduipo', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65665656', '2024-04-18 12:17:06', '2024-04-18 12:17:06'),
(366, 236, 'permanent', 'biutfduo', 'aerihsduipo', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65665656', '2024-04-18 12:17:06', '2024-04-18 12:17:06'),
(369, 234, 'correspondence', 'tjfisdkl', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65656556', '2024-04-18 12:28:34', '2024-04-18 12:28:34'),
(370, 234, 'permanent', 'tjfisdkl', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65656556', '2024-04-18 12:28:34', '2024-04-18 12:28:34'),
(387, 64, 'correspondence', 'Lucknow', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '656556', '2024-04-19 10:56:09', '2024-04-19 10:56:09'),
(388, 64, 'permanent', 'Lucknow', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '656556', '2024-04-19 10:56:09', '2024-04-19 10:56:09'),
(393, 238, 'correspondence', 'fzdnm,', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65465465465', '2024-04-20 13:55:50', '2024-04-20 13:55:50'),
(394, 238, 'permanent', 'fzdnm,', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '65465465465', '2024-04-20 13:55:50', '2024-04-20 13:55:50'),
(395, 237, 'correspondence', 'bkdfujsl', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '65654654654', '2024-04-20 13:57:58', '2024-04-20 13:57:58'),
(396, 237, 'permanent', 'bkdfujsl', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '65654654654', '2024-04-20 13:57:58', '2024-04-20 13:57:58'),
(397, 239, 'correspondence', 'test address', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '545454545', '2024-04-20 13:59:34', '2024-04-20 13:59:34'),
(401, 240, 'correspondence', 'test address', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 67, 'Al Jasrah', '545456454', '2024-04-20 15:29:13', '2024-04-20 15:29:13'),
(403, 241, 'correspondence', 'iytfhud', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '32154654', '2024-04-20 15:32:26', '2024-04-20 15:32:26'),
(404, 241, 'permanent', 'iytfhud', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 46, 'Al Dafna', '32154654', '2024-04-20 15:32:26', '2024-04-20 15:32:26'),
(405, 242, 'correspondence', 'nlkhg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 67, 'Al Jasrah', '64854546', '2024-04-20 15:39:54', '2024-04-20 15:39:54'),
(406, 242, 'permanent', 'nlkhg', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 67, 'Al Jasrah', '64854546', '2024-04-20 15:39:54', '2024-04-20 15:39:54'),
(412, 244, 'permanent', 'IHBRIHF', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '44545464', '2024-04-20 15:54:48', '2024-04-20 15:54:48'),
(441, 232, 'correspondence', 'EMobility Certification Services Building 129', 'Street 950, Zone No 24', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '123456', '2024-04-30 06:28:58', '2024-04-30 06:28:58'),
(442, 232, 'permanent', 'EMobility Certification Services Building 129', 'Street 950, Zone No 24', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '123456', '2024-04-30 06:28:58', '2024-04-30 06:28:58'),
(445, 246, 'correspondence', 'dsugygf', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '654654656', '2024-05-06 06:50:31', '2024-05-06 06:50:31'),
(446, 246, 'permanent', 'dsugygf', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '654654656', '2024-05-06 06:50:31', '2024-05-06 06:50:31'),
(447, 231, 'correspondence', 'tgrteaw', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '6545454', '2024-05-08 07:46:24', '2024-05-08 07:46:24'),
(448, 231, 'permanent', 'tgrteaw', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '6545454', '2024-05-08 07:46:24', '2024-05-08 07:46:24'),
(449, 247, 'correspondence', 'hgshj', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '654455454', '2024-05-08 07:46:48', '2024-05-08 07:46:48'),
(450, 247, 'permanent', 'hgshj', '', 5, 'QATAR', 2, 'Ad-Dawhah', NULL, NULL, NULL, NULL, 68, 'Al Bidda', '654455454', '2024-05-08 07:46:48', '2024-05-08 07:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_admission_procedures`
--

CREATE TABLE `sp_admission_procedures` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `procedure_type` int(11) NOT NULL,
  `admission_procedure` varchar(100) NOT NULL,
  `form_fee` int(11) NOT NULL,
  `form_starting_number` int(11) NOT NULL,
  `form_ending_number` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_admission_procedure_branches`
--

CREATE TABLE `sp_admission_procedure_branches` (
  `id` int(11) NOT NULL,
  `admission_procedure_id` int(11) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `semesters` varchar(10) DEFAULT NULL,
  `years` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_approval_status`
--

CREATE TABLE `sp_approval_status` (
  `id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `model_name` varchar(100) NOT NULL,
  `initiated_by_id` int(11) NOT NULL,
  `initiated_by_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `sub_module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_slug` varchar(25) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level` varchar(25) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `final_status_user_id` int(11) DEFAULT NULL,
  `final_status_user_name` varchar(255) DEFAULT NULL,
  `final_update_date_time` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_attendance_groups`
--

CREATE TABLE `sp_attendance_groups` (
  `id` int(11) NOT NULL,
  `attendance_group` varchar(100) NOT NULL,
  `start_time` varchar(100) NOT NULL,
  `end_time` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_attendance_groups`
--

INSERT INTO `sp_attendance_groups` (`id`, `attendance_group`, `start_time`, `end_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Morning Shift', '5:00 AM', '11:00 AM', 1, '2021-04-02 05:27:48', '2021-04-02 05:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_attributes`
--

CREATE TABLE `sp_attributes` (
  `id` int(11) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_attributes`
--

INSERT INTO `sp_attributes` (`id`, `attribute`, `is_active`) VALUES
(1, 'Basic details', 1),
(2, 'Personal details', 1),
(3, 'Admission/Academic details', 1),
(4, 'Official Details', 1),
(5, 'Financial details', 1),
(6, 'Vehicle details', 1),
(7, 'Biometric details', 1),
(8, 'Document Repository', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_banks`
--

CREATE TABLE `sp_banks` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_banks`
--

INSERT INTO `sp_banks` (`id`, `bank_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(2, 'Qatar National Bank', '2020-05-12 07:21:00', '2024-03-31 13:22:56', NULL),
(3, 'Doha Bank', '2024-03-31 13:27:53', '2024-03-31 13:27:53', NULL),
(4, 'Commercial Bank of Qatar', '2024-03-31 13:27:53', '2024-03-31 13:27:53', NULL),
(6, 'Qatar International Islamic Bank', '2024-03-31 13:28:24', '2024-03-31 13:28:24', NULL),
(7, 'Qatar Islamic Bank', '2024-03-31 13:28:24', '2024-03-31 13:28:24', NULL),
(8, 'Qatar Development Bank', '2024-03-31 13:28:51', '2024-03-31 13:28:51', NULL),
(9, 'Ahlibank', '2024-03-31 13:28:51', '2024-03-31 13:28:51', NULL),
(10, 'Masraf Al Rayan', '2024-03-31 13:29:18', '2024-03-31 13:29:18', NULL),
(11, 'Dukhan Bank', '2024-03-31 13:29:18', '2024-03-31 13:29:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sp_bank_details`
--

CREATE TABLE `sp_bank_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_account_no` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `bank_address` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_bank_details`
--

INSERT INTO `sp_bank_details` (`id`, `user_id`, `bank_id`, `bank_name`, `bank_account_no`, `ifsc_code`, `bank_address`, `created_at`, `updated_at`) VALUES
(133, 64, 2, 'Qatar National Bank', '004101501994', 'ICIC0000041', 'Indore', '2023-09-12 11:51:08', '2023-09-12 11:51:08'),
(144, 208, 6, 'PUNJAB NATIONAL BANK\r\n', '00000', '00000', '0000', '2023-11-25 17:47:48', '2023-11-25 17:47:48'),
(145, 207, 6, 'PUNJAB NATIONAL BANK\r\n', '0000', '0000', '0000', '2023-11-25 17:49:51', '2023-11-25 17:49:51'),
(146, 209, 6, 'PUNJAB NATIONAL BANK\r\n', '0000', '0000', '0000', '2023-11-25 18:05:36', '2023-11-25 18:05:36'),
(155, 212, 2, 'Qatar National Bank', '000', '000', '000', '2024-04-01 04:27:27', '2024-04-01 04:27:27'),
(156, 214, 2, 'Qatar National Bank', '00', '00', '00', '2024-04-01 10:30:00', '2024-04-01 10:30:00'),
(157, 216, 3, 'Doha Bank', '000', '000', '000', '2024-04-01 10:46:05', '2024-04-01 10:46:05'),
(158, 217, 4, 'Commercial Bank of Qatar', '000', '000', '000', '2024-04-01 10:49:00', '2024-04-01 10:49:00'),
(159, 218, 4, 'Commercial Bank of Qatar', '000', '000', '000', '2024-04-01 10:52:49', '2024-04-01 10:52:49'),
(160, 219, 3, 'Doha Bank', '00', '00', '00', '2024-04-01 11:00:20', '2024-04-01 11:00:20'),
(161, 220, 3, 'Doha Bank', '00', '00', '00', '2024-04-01 11:04:26', '2024-04-01 11:04:26'),
(162, 221, 4, 'Commercial Bank of Qatar', '000', '000', '000', '2024-04-01 11:37:06', '2024-04-01 11:37:06'),
(163, 222, 4, 'Commercial Bank of Qatar', '000', '000', '000', '2024-04-01 11:55:10', '2024-04-01 11:55:10'),
(164, 225, 3, 'Doha Bank', '65445645534', '654654654', 'sftdgu', '2024-04-04 11:37:48', '2024-04-04 11:37:48'),
(165, 227, 3, 'Doha Bank', '000656532345', '0055665', 'adfg', '2024-04-04 13:01:02', '2024-04-04 13:01:02'),
(166, 228, 2, 'Qatar National Bank', '655435', '05520', 'ghgvseh', '2024-04-04 13:06:24', '2024-04-04 13:06:24'),
(167, 229, 2, 'Qatar National Bank', '5454', '245345', 'sDfz', '2024-04-04 13:35:28', '2024-04-04 13:35:28'),
(168, 230, 2, 'Qatar National Bank', '654654', '654654654', 'jkjl', '2024-04-04 13:36:38', '2024-04-04 13:36:38'),
(169, 231, 10, 'Masraf Al Rayan', '06865', '321054', 'gfd', '2024-04-04 13:42:25', '2024-04-04 13:42:25'),
(170, 232, 2, 'Qatar National Bank', '21361273723512735271', 'ISBTLKO123', 'Test, Qatar', '2024-04-12 10:40:43', '2024-04-12 10:40:43'),
(171, 233, 2, 'Qatar National Bank', '000', '000', '000', '2024-04-12 23:56:13', '2024-04-12 23:56:13'),
(172, 234, 2, 'Qatar National Bank', '000', '000', '000', '2024-04-15 06:49:44', '2024-04-15 06:49:44'),
(173, 236, 3, 'Doha Bank', '000', '000', '000', '2024-04-18 11:50:17', '2024-04-18 11:50:17'),
(174, 237, 2, 'Qatar National Bank', '000', '000', '000', '2024-04-18 12:24:17', '2024-04-18 12:24:17'),
(175, 238, 3, 'Doha Bank', '0000', '000', '000', '2024-04-18 12:32:54', '2024-04-18 12:32:54'),
(176, 244, 2, 'Qatar National Bank', '000', '000', '00', '2024-04-20 15:54:34', '2024-04-20 15:54:34'),
(177, 246, 3, 'Doha Bank', '000', '000', '000', '2024-04-20 16:03:32', '2024-04-20 16:03:32'),
(178, 247, 3, 'Doha Bank', '000', '000', '000', '2024-04-20 16:09:02', '2024-04-20 16:09:02');

-- --------------------------------------------------------

--
-- Table structure for table `sp_basic_details`
--

CREATE TABLE `sp_basic_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `aadhaar_nubmer` varchar(15) DEFAULT NULL,
  `pan_number` varchar(20) DEFAULT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `gstin` varchar(20) DEFAULT NULL,
  `fssai` varchar(20) DEFAULT NULL,
  `working_shift_id` int(11) DEFAULT NULL,
  `working_shift_name` varchar(50) DEFAULT NULL,
  `order_timing` varchar(50) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `personal_email` varchar(50) DEFAULT NULL,
  `outlet_owned` varchar(50) DEFAULT NULL,
  `outstanding_amount` double(20,2) DEFAULT NULL,
  `security_amount` double(20,2) DEFAULT NULL,
  `opening_crates` int(11) DEFAULT NULL,
  `production_unit_id` varchar(11) DEFAULT NULL,
  `distributor_type_id` varchar(11) DEFAULT NULL,
  `tcs_applicable` int(11) DEFAULT '0',
  `tcs_value` double(10,2) DEFAULT NULL,
  `per_crate_incentive` int(11) DEFAULT NULL,
  `leave_count` float DEFAULT '0',
  `week_of_day` varchar(255) DEFAULT NULL,
  `bank_name` varchar(200) DEFAULT NULL,
  `account_number` varchar(16) DEFAULT NULL,
  `ifsc_code` varchar(14) DEFAULT NULL,
  `account_holder_name` varchar(200) DEFAULT NULL,
  `branch_address` varchar(250) DEFAULT NULL,
  `opening_time` varchar(22) DEFAULT NULL,
  `closing_time` varchar(22) DEFAULT NULL,
  `contract_type` int(11) DEFAULT NULL,
  `board_type` varchar(22) DEFAULT NULL,
  `brand_name` varchar(50) DEFAULT NULL,
  `location_type` varchar(50) DEFAULT NULL,
  `geofencing` int(11) DEFAULT NULL,
  `pf_no` varchar(50) DEFAULT NULL,
  `uan` bigint(20) DEFAULT NULL,
  `esi_no` bigint(20) DEFAULT NULL,
  `pan_no` varchar(50) DEFAULT NULL,
  `adhaar_no` bigint(20) DEFAULT NULL,
  `working_location` int(11) DEFAULT NULL,
  `working_state_name` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `attendance_type` int(11) DEFAULT NULL,
  `is_esic` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_basic_details`
--

INSERT INTO `sp_basic_details` (`id`, `user_id`, `father_name`, `mother_name`, `date_of_birth`, `gender`, `blood_group`, `aadhaar_nubmer`, `pan_number`, `cin`, `gstin`, `fssai`, `working_shift_id`, `working_shift_name`, `order_timing`, `date_of_joining`, `personal_email`, `outlet_owned`, `outstanding_amount`, `security_amount`, `opening_crates`, `production_unit_id`, `distributor_type_id`, `tcs_applicable`, `tcs_value`, `per_crate_incentive`, `leave_count`, `week_of_day`, `bank_name`, `account_number`, `ifsc_code`, `account_holder_name`, `branch_address`, `opening_time`, `closing_time`, `contract_type`, `board_type`, `brand_name`, `location_type`, `geofencing`, `pf_no`, `uan`, `esi_no`, `pan_no`, `adhaar_no`, `working_location`, `working_state_name`, `status`, `attendance_type`, `is_esic`, `created_at`, `updated_at`) VALUES
(135, 64, 'demo', 'demo', '2023-12-18', 'female', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2023-10-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Monday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2023-09-12 11:46:54', '2024-04-19 10:56:10'),
(146, 206, 'aaa', 'aaa', '1971-01-01', 'male', 'A+', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2023-10-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0000', 23423, 23432, '0000', 3232, 26, 2, 1, NULL, 0, '2023-11-25 17:31:08', '2024-04-05 04:45:34'),
(147, 207, 'aaa', 'aaa', '2023-12-18', 'female', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2023-10-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Monday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, '0000', 0, 0, '0000', 0, 26, 2, 1, NULL, 0, '2023-11-25 17:41:05', '2024-04-01 04:43:39'),
(158, 212, 'gh', 'gfh', '2024-02-08', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 04:26:58', '2024-04-01 05:41:35'),
(159, 213, 'fghxf', 'gchgfh', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:28:56', '2024-04-01 10:28:56'),
(160, 214, 'sd', 'dgf', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:29:37', '2024-04-04 12:22:51'),
(161, 216, 'SDS', 'SD', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:45:43', '2024-04-01 10:46:05'),
(162, 217, 'dfsf', 'fdsgdf', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:48:38', '2024-04-18 11:40:04'),
(163, 218, 'fdas', 'afdsa', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Wednesday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:52:22', '2024-04-01 10:53:48'),
(164, 219, 'L Bajpai', 'weqwre', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 10:59:49', '2024-04-01 11:32:03'),
(165, 220, 'jbhh', 'nchvh', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 11:04:01', '2024-04-01 11:32:43'),
(166, 221, 'fd', 'fdssd', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 11:36:45', '2024-04-03 12:39:20'),
(167, 222, 'dfd', 'sdf', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-01 11:54:49', '2024-04-04 12:30:32'),
(168, 223, 'dfd', 'cbcxb', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-03 12:19:42', '2024-04-04 09:57:30'),
(169, 224, 'Anil Kumar Mishra', 'Geeta Mishra', '1991-08-21', 'male', 'B+', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-04 11:04:57', '2024-04-04 11:28:03'),
(170, 225, 'dbjhbk', 'vdihgiyb', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-04 11:37:07', '2024-04-04 11:49:32'),
(171, 226, 'DEMO', 'demo', '2023-05-10', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-04 11:43:46', '2024-04-04 12:18:19'),
(172, 227, 'das', 'sdfa', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Wednesday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-04 13:00:33', '2024-04-12 23:57:08'),
(173, 228, 'ghgf', 'fdg', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Wednesday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-04 13:05:50', '2024-04-04 13:09:31'),
(174, 229, 'ffgf', 'hjhjkh', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-04 13:35:04', '2024-04-04 13:35:28'),
(175, 230, 'hjdhj', 'ghkj', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-04 13:36:23', '2024-04-11 10:55:02'),
(176, 231, 'fgds', 'fgds', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-04 13:41:38', '2024-05-08 07:46:24'),
(177, 232, 'Test', 'Test', '2024-01-03', 'male', 'B+', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2023-04-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 2, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-12 10:38:29', '2024-04-30 06:28:58'),
(178, 233, 'vjbhnjk', 'hkvhk', '2024-04-02', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-12 23:55:41', '2024-04-15 06:47:15'),
(179, 234, 'fgnjsk', 'hiufkj', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-15 06:47:52', '2024-04-18 12:28:36'),
(180, 235, 'kfjdskfd', 'dbifksjlk', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-18 11:46:40', '2024-04-18 11:46:40'),
(181, 236, 'jefkdjqisl', 'fsjazhnmfc', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-18 11:49:47', '2024-04-18 12:17:07'),
(182, 237, 'fxgdkjal', 'giufsdalja', '2024-04-08', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-18 12:23:52', '2024-04-20 13:57:58'),
(183, 238, 'g hfdskjl', 'fgdkjsl', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-18 12:32:22', '2024-04-20 13:55:50'),
(184, 239, 'Test Father', 'Test Mother', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 13:59:34', '2024-04-20 13:59:34'),
(185, 240, 'Test Father', 'Test Mother', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 14:04:03', '2024-04-20 15:29:13'),
(186, 241, 'gijogjkrjzb', 'gxnvljnkrf', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 15:32:26', '2024-04-20 15:32:26'),
(187, 242, 'gbb', 'kjkgf', '2024-04-02', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 15:39:54', '2024-04-20 15:39:54'),
(188, 243, 'njhjgorjf', 'hugjo', '2024-04-08', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 15:49:21', '2024-04-20 15:49:21'),
(189, 244, 'KJGRJHG', 'HIJGKL', '2024-04-09', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 15:54:12', '2024-04-20 15:54:48'),
(190, 245, 'Test Father', 'Test Mother', '2024-04-08', 'male', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, '2024-04-20 15:58:17', '2024-04-20 15:58:17'),
(191, 246, 'test Father', 'test mother', '2024-04-02', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Sunday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-20 16:03:12', '2024-05-06 06:50:31'),
(192, 247, 'Test Father', 'Test Mother', '2024-04-01', 'male', '', NULL, NULL, NULL, NULL, NULL, 3, NULL, NULL, '2024-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 'Friday', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, 0, '0', 0, 0, '0', 0, NULL, NULL, 1, NULL, 0, '2024-04-20 16:08:38', '2024-05-08 07:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_business_types`
--

CREATE TABLE `sp_business_types` (
  `id` int(11) NOT NULL,
  `business_type` varchar(200) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_business_types`
--

INSERT INTO `sp_business_types` (`id`, `business_type`, `created_at`, `updated_at`) VALUES
(1, 'Real Estate', '2019-06-15 15:55:09', '2019-07-04 15:37:04'),
(2, 'Farming', '2019-06-15 15:55:09', '2019-07-04 15:36:59'),
(5, 'testqq', '2020-07-15 09:03:44', '2020-07-15 09:03:44'),
(6, 'IT Product and Services', '2020-08-05 12:28:22', '2020-08-05 12:28:22'),
(7, 'testss', '2024-04-06 10:41:00', '2024-04-06 10:41:00');

-- --------------------------------------------------------

--
-- Table structure for table `sp_cities`
--

CREATE TABLE `sp_cities` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_color_codes`
--

CREATE TABLE `sp_color_codes` (
  `id` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `code` varchar(15) CHARACTER SET utf8 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_color_codes`
--

INSERT INTO `sp_color_codes` (`id`, `color`, `code`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Red', '#FF0000', 1, '2020-10-27 07:18:33', '2020-10-30 09:06:30'),
(2, 'SILVER', '#C0C0C0', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(3, 'GRAY', '#808080', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(4, 'BLACK', '#000000', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(5, 'MAROON', '#800000', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(6, 'YELLOW', '#FFFF00', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(7, 'LIME', '#00FF00', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(8, 'GREEN', '#008000', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(9, 'BLUE', '#0000FF', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(10, 'NAVY', '#000080', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(11, 'PURPLE', '#800080', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33'),
(12, 'OLIVE', '#808000', 1, '2020-10-27 07:18:33', '2020-10-27 07:18:33');

-- --------------------------------------------------------

--
-- Table structure for table `sp_company_detail`
--

CREATE TABLE `sp_company_detail` (
  `id` int(11) NOT NULL,
  `location_image` varchar(200) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `company_address` varchar(500) DEFAULT NULL,
  `company_mail` varchar(50) DEFAULT NULL,
  `company_contact` bigint(20) DEFAULT NULL,
  `company_detail` text,
  `website_url` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_company_detail`
--

INSERT INTO `sp_company_detail` (`id`, `location_image`, `latitude`, `longitude`, `company_name`, `company_address`, `company_mail`, `company_contact`, `company_detail`, `website_url`) VALUES
(1, '/media/sortstringMapLocation.png', '28.416150', '77.827289', 'Emobic Group', 'EMobility Certification Services Building 129, Street 950, Zone No 24, Muntaza, Doha, Qatar, PO Box 35048', 'sales@emobilitycertifications.com', 9452672531, '<html>\n  <head>\n  <title>Page Title</title>\n  </head>\n  <body>\n  <h1>Emobic Group</h1>\n  <p style=\"text-justify\">\n    Emobility Certification Services provides ISO consultancy & Management solutions in Qatar that provides services to help organizations to achieve ISO (International Organization for Standardization) certifications and we help the companies to standardize their procedures and policies by implementing the international standards.\n    ISO certifications are recognized globally and can be obtained for various standards such as ISO 9001 (quality management), ISO 14001 (environmental management), ISO 27001 (information security management), ISO 22000 (Food safety management system) and many more.</p>\n \n  </body>\n  </html>', 'https://emobilitycertifications.com/');

-- --------------------------------------------------------

--
-- Table structure for table `sp_contacts`
--

CREATE TABLE `sp_contacts` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `company_name` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `address` text,
  `gstin` varchar(20) DEFAULT NULL,
  `spoc` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `linkedin_profile` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_contact_numbers`
--

CREATE TABLE `sp_contact_numbers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `contact_type` int(11) NOT NULL,
  `contact_type_name` varchar(25) DEFAULT NULL,
  `contact_number` varchar(15) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_contact_numbers`
--

INSERT INTO `sp_contact_numbers` (`id`, `user_id`, `country_code`, `contact_type`, `contact_type_name`, `contact_number`, `is_primary`, `status`, `created_at`, `updated_at`) VALUES
(878, 208, '+91', 1, 'Home', '8392901998', 1, 1, '2023-11-25 18:39:41', '2023-11-25 18:39:41'),
(947, 207, '+91', 1, 'Home', '5445454554326', 1, 1, '2024-04-01 04:43:36', '2024-04-01 04:43:36'),
(951, 212, '+91', 1, 'Home', '131251313641534', 1, 1, '2024-04-01 05:41:34', '2024-04-01 05:41:34'),
(960, 213, '+91', 1, 'Home', '169846484654', 1, 1, '2024-04-01 10:28:56', '2024-04-01 10:28:56'),
(963, 216, '+91', 1, 'Home', '54765474454858', 1, 1, '2024-04-01 10:45:43', '2024-04-01 10:45:43'),
(968, 218, '+91', 1, 'Home', '41554645644565', 1, 1, '2024-04-01 10:53:48', '2024-04-01 10:53:48'),
(972, 219, '+91', 1, 'Home', '54453524452452', 1, 1, '2024-04-01 11:32:03', '2024-04-01 11:32:03'),
(973, 220, '+91', 1, 'Home', '5464646464744', 1, 1, '2024-04-01 11:32:43', '2024-04-01 11:32:43'),
(1001, 221, '+91', 1, 'Home', '541415341315', 1, 1, '2024-04-03 12:39:20', '2024-04-03 12:39:20'),
(1012, 223, '+91', 1, 'Home', '446464665464', 1, 1, '2024-04-04 09:57:30', '2024-04-04 09:57:30'),
(1021, 224, '+974', 1, 'Home', '768937475', 1, 1, '2024-04-04 11:28:03', '2024-04-04 11:28:03'),
(1027, 225, '+91', 1, 'Home', '76543434564', 1, 1, '2024-04-04 11:49:31', '2024-04-04 11:49:31'),
(1036, 226, '+91', 1, 'Home', '09335591006', 1, 1, '2024-04-04 12:18:19', '2024-04-04 12:18:19'),
(1037, 214, '+91', 1, 'Home', '5566556453453', 1, 1, '2024-04-04 12:22:50', '2024-04-04 12:22:50'),
(1040, 222, '+91', 1, 'Home', '545454468484', 1, 1, '2024-04-04 12:30:31', '2024-04-04 12:30:31'),
(1044, 228, '+91', 1, 'Home', '7854654665', 1, 1, '2024-04-04 13:09:31', '2024-04-04 13:09:31'),
(1045, 229, '+91', 1, 'Home', '4855465486', 1, 1, '2024-04-04 13:35:04', '2024-04-04 13:35:04'),
(1055, 206, '+91', 1, 'Home', '9335591006', 1, 1, '2024-04-05 04:45:34', '2024-04-05 04:45:34'),
(1061, 230, '+91', 1, 'Home', '9452672531', 1, 1, '2024-04-11 10:55:00', '2024-04-11 10:55:00'),
(1075, 227, '+91', 1, 'Home', '65456456651', 1, 1, '2024-04-12 23:57:07', '2024-04-12 23:57:07'),
(1082, 233, '+91', 1, 'Home', '54545784554', 1, 1, '2024-04-15 06:46:59', '2024-04-15 06:46:59'),
(1090, 217, '+91', 1, 'Home', '76887676876868', 1, 1, '2024-04-18 11:40:04', '2024-04-18 11:40:04'),
(1092, 235, '+91', 1, 'Home', '65465456564', 1, 1, '2024-04-18 11:46:40', '2024-04-18 11:46:40'),
(1095, 236, '+91', 1, 'Home', '6545645455', 1, 1, '2024-04-18 12:17:06', '2024-04-18 12:17:06'),
(1097, 234, '+91', 1, 'Home', '59565656565', 1, 1, '2024-04-18 12:28:34', '2024-04-18 12:28:34'),
(1106, 64, '+91', 2, 'Whatsapp', '9898989898', 1, 1, '2024-04-19 10:56:09', '2024-04-19 10:56:09'),
(1109, 238, '+91', 1, 'Home', '68778665454', 1, 1, '2024-04-20 13:55:50', '2024-04-20 13:55:50'),
(1110, 237, '+91', 1, 'Home', '546465832534', 1, 1, '2024-04-20 13:57:57', '2024-04-20 13:57:57'),
(1118, 244, '+91', 1, 'Home', '78974554654', 1, 1, '2024-04-20 15:54:48', '2024-04-20 15:54:48'),
(1133, 232, '+358', 1, 'Home', '7355055909', 1, 1, '2024-04-30 06:28:58', '2024-04-30 06:28:58'),
(1135, 246, '+91', 1, 'Home', '5554545458', 1, 1, '2024-05-06 06:50:31', '2024-05-06 06:50:31'),
(1136, 231, '+91', 1, 'Home', '7705056122', 1, 1, '2024-05-08 07:46:24', '2024-05-08 07:46:24'),
(1137, 247, '+91', 1, 'Home', '89658658965', 1, 1, '2024-05-08 07:46:48', '2024-05-08 07:46:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_contact_tags`
--

CREATE TABLE `sp_contact_tags` (
  `id` int(11) NOT NULL,
  `contact_id` int(11) DEFAULT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_contact_types`
--

CREATE TABLE `sp_contact_types` (
  `id` int(11) NOT NULL,
  `contact_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_contact_types`
--

INSERT INTO `sp_contact_types` (`id`, `contact_type`, `status`, `create_at`, `updated_at`) VALUES
(1, 'Home', 1, '2020-10-15 06:02:32', '2022-04-13 06:00:34'),
(2, 'Whatsapp', 1, '2020-10-15 06:02:32', '2022-04-13 06:00:40'),
(3, 'Others', 1, '2020-10-15 06:02:51', '2022-05-04 09:50:14'),
(4, 'Offical', 1, '2024-03-30 10:48:19', '2024-03-30 10:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `sp_core_business_area`
--

CREATE TABLE `sp_core_business_area` (
  `id` int(11) NOT NULL,
  `core_business_area_name` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_core_business_area`
--

INSERT INTO `sp_core_business_area` (`id`, `core_business_area_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Agriculture and Fishing', 1, '2023-12-28 11:24:20', '2023-12-28 11:24:20'),
(2, 'Manufacturing,Construction', 1, '2023-12-28 11:24:20', '2023-12-28 11:24:20'),
(3, 'Energy and Utilities', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(4, 'Wholesale and Retail Trade', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(5, 'E-Commerce', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(6, 'Transportation and Logistics', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(7, 'Information Technology', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(8, 'Finance and Insurance', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(9, 'Real Estate', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(10, 'Consultancy', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(11, 'Technical Services', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(12, 'Education', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(13, 'Health Care', 1, '2023-12-28 11:25:44', '2023-12-28 11:25:44'),
(14, 'F&B', 1, '2024-04-06 19:18:22', '2024-04-06 19:18:22');

-- --------------------------------------------------------

--
-- Table structure for table `sp_countries`
--

CREATE TABLE `sp_countries` (
  `id` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_countries`
--

INSERT INTO `sp_countries` (`id`, `country`, `created_at`, `updated_at`) VALUES
(1, 'India', '2020-10-15 06:29:05', '2020-10-15 06:29:05'),
(2, 'USA', '2024-03-30 12:42:45', '2024-03-30 12:42:45'),
(3, 'SINGAPORE', '2024-03-30 12:42:45', '2024-03-30 12:42:45'),
(4, 'AUSTRALIA', '2024-03-30 12:43:41', '2024-03-30 12:43:41'),
(5, 'QATAR', '2024-03-30 12:43:41', '2024-03-30 12:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `sp_country_codes`
--

CREATE TABLE `sp_country_codes` (
  `id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_country_codes`
--

INSERT INTO `sp_country_codes` (`id`, `country_code`, `status`, `created_at`, `updated_at`) VALUES
(1, '+91', 1, '2020-10-22 08:35:11', '2020-10-22 08:35:11'),
(2, '+358', 1, '2020-10-22 08:35:11', '2020-10-22 08:35:11'),
(3, '+974', 1, '2024-03-30 10:39:06', '2024-03-30 10:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `sp_currency_code`
--

CREATE TABLE `sp_currency_code` (
  `id` int(11) NOT NULL,
  `currency_code` varchar(10) NOT NULL,
  `currency_name` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_currency_code`
--

INSERT INTO `sp_currency_code` (`id`, `currency_code`, `currency_name`, `status`) VALUES
(1, 'BDT', 'Bangladeshi taka', 1),
(2, 'AED', 'United Arab Emirates dirham', 1),
(3, 'AFN', 'Afghan afghani', 1),
(4, 'ALL', 'Albanian lek', 1),
(5, 'AMD', 'Armenian dram', 1),
(6, 'ANG', 'Netherlands Antillean guilder', 1),
(7, 'AOA', 'Angolan kwanza', 1),
(8, 'ARS', 'Argentine peso', 1),
(9, 'AUD', 'Australian dollar', 1),
(10, 'AWG', 'Aruban florin', 1),
(11, 'AZN', 'Azerbaijani manat', 1),
(12, 'BAM', 'Bosnia and Herzegovina convertible mark', 1),
(13, 'BBD', 'Barbados dollar', 1),
(14, 'BDT', 'Bangladeshi taka', 1),
(15, 'BGN', 'Bulgarian lev', 1),
(16, 'BHD', 'Bahraini dinar', 1),
(17, 'BIF', 'Burundian franc', 1),
(18, 'BMD', 'Bermudian dollar', 1),
(19, 'BND', 'Brunei dollar', 1),
(20, 'BOB', 'Boliviano', 1),
(21, 'BOV', 'Bolivian Mvdol (funds code)', 1),
(22, 'BRL', 'Brazilian real', 1),
(23, 'BSD', 'Bahamian dollar', 1),
(24, 'BTN', 'Bhutanese ngultrum', 1),
(25, 'BWP', 'Botswana pula', 1),
(26, 'BYN', 'Belarusian ruble', 1),
(27, 'BZD', 'Belize dollar', 1),
(28, 'CAD', 'Canadian dollar', 1),
(29, 'CDF', 'Congolese franc', 1),
(30, 'CHE', 'WIR Euro (complementary currency)', 1),
(31, 'CHF', 'Swiss franc', 1),
(32, 'CHW', 'WIR Franc (complementary currency)', 1),
(33, 'CLF', 'Unidad de Fomento (funds code)', 1),
(34, 'CLP', 'Chilean peso', 1),
(35, 'CNY', 'Renminbi (Chinese) yuan', 1),
(36, 'COP', 'Colombian peso', 1),
(37, 'COU', 'Unidad de Valor Real (UVR) (funds code)', 1),
(38, 'CRC', 'Costa Rican colon', 1),
(39, 'CUC', 'Cuban convertible peso', 1),
(40, 'CUP', 'Cuban peso', 1),
(41, 'CVE', 'Cape Verdean escudo', 1),
(42, 'CZK', 'Czech koruna', 1),
(43, 'DJF', 'Djiboutian franc', 1),
(44, 'DKK', 'Danish krone', 1),
(45, 'DOP', 'Dominican peso', 1),
(46, 'DZD', 'Algerian dinar', 1),
(47, 'EGP', 'Egyptian pound', 1),
(48, 'ERN', 'Eritrean nakfa', 1),
(49, 'ETB', 'Ethiopian birr', 1),
(50, 'EUR', 'Euro', 1),
(51, 'FJD', 'Fiji dollar', 1),
(52, 'FKP', 'Falkland Islands pound', 1),
(53, 'GBP', 'Pound sterling', 1),
(54, 'GEL', 'Georgian lari', 1),
(55, 'GHS', 'Ghanaian cedi', 1),
(56, 'GIP', 'Gibraltar pound', 1),
(57, 'GMD', 'Gambian dalasi', 1),
(58, 'GNF', 'Guinean franc', 1),
(59, 'GTQ', 'Guatemalan quetzal', 1),
(60, 'GYD', 'Guyanese dollar', 1),
(61, 'HKD', 'Hong Kong dollar', 1),
(62, 'HNL', 'Honduran lempira', 1),
(63, 'HRK', 'Croatian kuna', 1),
(64, 'HTG', 'Haitian gourde', 1),
(65, 'HUF', 'Hungarian forint', 1),
(66, 'IDR', 'Indonesian rupiah', 1),
(67, 'ILS', 'Israeli new shekel', 1),
(68, 'INR', 'Indian rupee', 1),
(69, 'IQD', 'Iraqi dinar', 1),
(70, 'IRR', 'Iranian rial', 1),
(71, 'ISK', 'Icelandic króna', 1),
(72, 'JMD', 'Jamaican dollar', 1),
(73, 'JOD', 'Jordanian dinar', 1),
(74, 'JPY', 'Japanese yen', 1),
(75, 'KES', 'Kenyan shilling', 1),
(76, 'KGS', 'Kyrgyzstani som', 1),
(77, 'KHR', 'Cambodian riel', 1),
(78, 'KMF', 'Comoro franc', 1),
(79, 'KPW', 'North Korean won', 1),
(80, 'KRW', 'South Korean won', 1),
(81, 'KWD', 'Kuwaiti dinar', 1),
(82, 'KYD', 'Cayman Islands dollar', 1),
(83, 'KZT', 'Kazakhstani tenge', 1),
(84, 'LAK', 'Lao kip', 1),
(85, 'LBP', 'Lebanese pound', 1),
(86, 'LKR', 'Sri Lankan rupee', 1),
(87, 'LRD', 'Liberian dollar', 1),
(88, 'LSL', 'Lesotho loti', 1),
(89, 'LYD', 'Libyan dinar', 1),
(90, 'MAD', 'Moroccan dirham', 1),
(91, 'MDL', 'Moldovan leu', 1),
(92, 'MGA', 'Malagasy ariary', 1),
(93, 'MKD', 'Macedonian denar', 1),
(94, 'MMK', 'Myanmar kyat', 1),
(95, 'MNT', 'Mongolian tögrög', 1),
(96, 'MOP', 'Macanese pataca', 1),
(97, 'MRU', 'Mauritanian ouguiya', 1),
(98, 'MUR', 'Mauritian rupee', 1),
(99, 'MVR', 'Maldivian rufiyaa', 1),
(100, 'MWK', 'Malawian kwacha', 1),
(101, 'MXN', 'Mexican peso', 1),
(102, 'MXV', 'Mexican Unidad de Inversion (UDI) (funds code)', 1),
(103, 'MYR', 'Malaysian ringgit', 1),
(104, 'MZN', 'Mozambican metical', 1),
(105, 'NAD', 'Namibian dollar', 1),
(106, 'NGN', 'Nigerian naira', 1),
(107, 'NIO', 'Nicaraguan córdoba', 1),
(108, 'NOK', 'Norwegian krone', 1),
(109, 'NPR', 'Nepalese rupee', 1),
(110, 'NZD', 'New Zealand dollar', 1),
(111, 'OMR', 'Omani rial', 1),
(112, 'PAB', 'Panamanian balboa', 1),
(113, 'PEN', 'Peruvian sol', 1),
(114, 'PGK', 'Papua New Guinean kina', 1),
(115, 'PHP', 'Philippine peso', 1),
(116, 'PKR', 'Pakistani rupee', 1),
(117, 'PLN', 'Polish zloty', 1),
(118, 'PYG', 'Paraguayan guaraní', 1),
(119, 'QAR', 'Qatari riyal', 1),
(120, 'RON', 'Romanian leu', 1),
(121, 'RSD', 'Serbian dinar', 1),
(122, 'RUB', 'Russian ruble', 1),
(123, 'RWF', 'Rwandan franc', 1),
(124, 'SAR', 'Saudi riyal', 1),
(125, 'SBD', 'Solomon Islands dollar', 1),
(126, 'SCR', 'Seychelles rupee', 1),
(127, 'SDG', 'Sudanese pound', 1),
(128, 'SEK', 'Swedish krona/kronor', 1),
(129, 'SGD', 'Singapore dollar', 1),
(130, 'SHP', 'Saint Helena pound', 1),
(131, 'SLL', 'Sierra Leonean leone', 1),
(132, 'SOS', 'Somali shilling', 1),
(133, 'SRD', 'Surinamese dollar', 1),
(134, 'SSP', 'South Sudanese pound', 1),
(135, 'STN', 'São Tomé and Príncipe dobra', 1),
(136, 'SVC', 'Salvadoran colón', 1),
(137, 'SYP', 'Syrian pound', 1),
(138, 'SZL', 'Swazi lilangeni', 1),
(139, 'THB', 'Thai baht', 1),
(140, 'TJS', 'Tajikistani somoni', 1),
(141, 'TMT', 'Turkmenistan manat', 1),
(142, 'TND', 'Tunisian dinar', 1),
(143, 'TOP', 'Tongan pa?anga', 1),
(144, 'TRY', 'Turkish lira', 1),
(145, 'TTD', 'Trinidad and Tobago dollar', 1),
(146, 'TWD', 'New Taiwan dollar', 1),
(147, 'TZS', 'Tanzanian shilling', 1),
(148, 'UAH', 'Ukrainian hryvnia', 1),
(149, 'UGX', 'Ugandan shilling', 1),
(150, 'USD', 'United States dollar', 1),
(151, 'USN', 'United States dollar (next day) (funds code)', 1),
(152, 'UYI', 'Uruguay Peso en Unidades Indexadas (URUIURUI) (funds code)', 1),
(153, 'UYU', 'Uruguayan peso', 1),
(154, 'UYW', 'Unidad previsional', 1),
(155, 'UZS', 'Uzbekistan som', 1),
(156, 'VES', 'Venezuelan bolívar soberano', 1),
(157, 'VND', 'Vietnamese d?ng', 1),
(158, 'VUV', 'Vanuatu vatu', 1),
(159, 'WST', 'Samoan tala', 1),
(160, 'XAF', 'CFA franc BEAC', 1),
(161, 'XAG', 'Silver (one troy ounce)', 1),
(162, 'XAU', 'Gold (one troy ounce)', 1),
(163, 'XBA', 'European Composite Unit (EURCO) (bond market unit)', 1),
(164, 'XBB', 'European Monetary Unit (E.M.U.-6) (bond market unit)', 1),
(165, 'XBC', 'European Unit of Account 9 (E.U.A.-9) (bond market unit)', 1),
(166, 'XBD', 'European Unit of Account 17 (E.U.A.-17) (bond market unit)', 1),
(167, 'XCD', 'East Caribbean dollar', 1),
(168, 'XDR', 'Special drawing rights', 1),
(169, 'XOF', 'CFA franc BCEAO', 1),
(170, 'XPD', 'Palladium (one troy ounce)', 1),
(171, 'XPF', 'CFP franc (franc Pacifique)', 1),
(172, 'XPT', 'Platinum (one troy ounce)', 1),
(173, 'XSU', 'SUCRE', 1),
(174, 'XTS', 'Code reserved for testing', 1),
(175, 'XUA', 'ADB Unit of Account', 1),
(176, 'XXX', 'No currency', 1),
(177, 'YER', 'Yemeni rial', 1),
(178, 'ZAR', 'South African rand', 1),
(179, 'ZMW', 'Zambian kwacha', 1),
(180, 'ZWL', 'Zimbabwean dollar', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_departments`
--

CREATE TABLE `sp_departments` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `organization_name` varchar(150) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `landline_country_code` varchar(10) NOT NULL,
  `landline_state_code` varchar(10) NOT NULL,
  `landline_number` varchar(15) NOT NULL,
  `extension_number` varchar(10) NOT NULL,
  `mobile_country_code` varchar(10) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_departments`
--

INSERT INTO `sp_departments` (`id`, `organization_id`, `organization_name`, `department_name`, `landline_country_code`, `landline_state_code`, `landline_number`, `extension_number`, `mobile_country_code`, `mobile_number`, `email`, `status`, `created_at`, `updated_at`) VALUES
(24, 3, '\nEmobic Pvt Ltd', 'Human Resources', '+91', '594', '00000000', '1', '+91', '0000000000', 'demohr@gmail.com', 0, '2023-09-12 11:49:32', '2024-03-13 10:18:49'),
(25, 3, '\nEmobic Pvt Ltd', 'Sales and Marketing', '+91', '522', '00000000', '1', '+91', '0000000000', 'demosales@gmail.com', 0, '2023-09-13 04:56:02', '2024-03-13 10:19:08'),
(26, 3, '\nEmobic Pvt Ltd', 'Maintenance and support ', '+91', '528', '00000000', '1', '+91', '0000000000', 'demohr@gmail.com', 0, '2023-09-13 04:58:07', '2024-03-13 10:19:15'),
(27, 3, '\nEmobic Pvt Ltd', 'Accounts Department', '+91', '522', '00000000', '', '+91', '0000000000', 'demoaccount@gmail.com', 0, '2023-11-17 19:11:45', '2024-03-13 10:19:25'),
(28, 3, '\nEmobic Pvt Ltd', 'IT Department', '+91', '522', '00000000', '', '+91', '0000000000', 'demoit@gmail.com', 0, '2023-11-18 18:45:24', '2024-03-13 10:19:32'),
(29, 3, '\nEmobic Pvt Ltd', 'Management', '+91', '214', '00000000', '', '+91', '0000000000', 'demoinfo@gmail.com', 0, '2023-11-18 19:26:02', '2024-03-13 10:19:45'),
(30, 3, '\nEmobic Pvt Ltd', 'Stores Department', '+91', '522', '00000000', '', '+91', '0000000000', 'demostore@gmail.com', 0, '2023-11-19 17:38:24', '2024-03-13 10:19:59');

-- --------------------------------------------------------

--
-- Table structure for table `sp_drivers`
--

CREATE TABLE `sp_drivers` (
  `id` int(11) NOT NULL,
  `salutation` varchar(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) NOT NULL,
  `primary_contact_number` varchar(25) NOT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `web_auth_token` varchar(255) DEFAULT NULL,
  `auth_otp` varchar(10) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_driver_addresses`
--

CREATE TABLE `sp_driver_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `address_line_1` varchar(250) NOT NULL,
  `address_line_2` varchar(250) DEFAULT NULL,
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  `city_name` varchar(100) NOT NULL,
  `pincode` varchar(8) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_driver_basic_details`
--

CREATE TABLE `sp_driver_basic_details` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `mother_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(25) DEFAULT NULL,
  `blood_group` varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  `aadhaar_nubmer` varchar(15) DEFAULT NULL,
  `aadhaar_document` varchar(255) DEFAULT NULL,
  `dl_number` varchar(50) DEFAULT NULL,
  `dl_document` varchar(255) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `personal_email` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_driver_contact_numbers`
--

CREATE TABLE `sp_driver_contact_numbers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `contact_type` int(11) NOT NULL,
  `contact_type_name` varchar(25) DEFAULT NULL,
  `contact_number` varchar(15) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_employee_payroll_master`
--

CREATE TABLE `sp_employee_payroll_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `emp_ctc` float NOT NULL,
  `gross_salary` float NOT NULL,
  `emp_hra` float NOT NULL DEFAULT '0',
  `emp_ta` float NOT NULL DEFAULT '0',
  `emp_da` float NOT NULL DEFAULT '0',
  `emp_tds` float NOT NULL DEFAULT '0',
  `emp_pf` float NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_favorites`
--

CREATE TABLE `sp_favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `favorite` varchar(100) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_financial_years`
--

CREATE TABLE `sp_financial_years` (
  `id` int(11) NOT NULL,
  `financial_year` varchar(100) DEFAULT NULL,
  `start_month` int(11) DEFAULT NULL,
  `start_month_name` varchar(50) DEFAULT NULL,
  `start_year` int(11) DEFAULT NULL,
  `end_month` int(11) DEFAULT NULL,
  `end_month_name` varchar(50) DEFAULT NULL,
  `end_year` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_financial_years`
--

INSERT INTO `sp_financial_years` (`id`, `financial_year`, `start_month`, `start_month_name`, `start_year`, `end_month`, `end_month_name`, `end_year`, `status`, `created_at`, `updated_at`) VALUES
(2, '2024-2025', 4, 'APR', 2024, 3, 'MAR', 2025, 1, '2024-04-12 16:01:07', '2024-04-12 16:01:07'),
(4, '2025-2026', 4, 'APR', 2025, 3, 'MAR', 2026, 1, '2024-04-12 16:03:54', '2024-04-12 16:03:54'),
(5, '2026-2027', 4, 'APR', 2026, 3, 'MAR', 2027, 1, '2024-04-16 10:58:18', '2024-04-16 10:58:18');

-- --------------------------------------------------------

--
-- Table structure for table `sp_foc_requests`
--

CREATE TABLE `sp_foc_requests` (
  `id` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `foc_delivery_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `foc_status` int(11) DEFAULT '1',
  `request_by_id` int(11) NOT NULL,
  `request_by_name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_follow_up`
--

CREATE TABLE `sp_follow_up` (
  `id` int(11) NOT NULL,
  `lead_status` int(11) NOT NULL,
  `remark` text,
  `reason_id` int(11) DEFAULT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `deal_amount` float DEFAULT NULL,
  `lead_id` int(11) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `next_followup_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(100) DEFAULT NULL,
  `reminder_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_follow_up`
--

INSERT INTO `sp_follow_up` (`id`, `lead_status`, `remark`, `reason_id`, `currency_code`, `deal_amount`, `lead_id`, `latitude`, `longitude`, `next_followup_date`, `created_at`, `updated_at`, `type`, `reminder_date`, `created_by`) VALUES
(1, 1, 'New Lead created', NULL, NULL, NULL, 1, '26.8521116', '81.0026567', NULL, '2024-04-12 16:51:48', '2024-04-12 16:51:48', 'initiated', NULL, 232),
(4, 2, 'customer is wanting to give the payment in cash', NULL, NULL, NULL, 1, '26.8520703', '81.0026017', '2024-04-30', '2024-04-12 17:05:48', '2024-04-12 17:05:48', 'Progress', '2024-04-23', 232),
(5, 2, 'customer has given the documents ', NULL, NULL, NULL, 1, '26.8520558', '81.0025751', '2024-04-30', '2024-04-12 17:09:29', '2024-04-12 17:09:29', 'Progress', '2024-04-22', 232),
(6, 3, 'test', NULL, 'INR', 1200, 1, '26.8520938', '81.0026135', NULL, '2024-04-12 17:10:23', '2024-04-12 17:10:23', 'Win', NULL, 232),
(7, 1, 'New Lead created', NULL, NULL, NULL, 4, '26.8520518', '81.0025751', NULL, '2024-04-12 17:12:23', '2024-04-12 17:12:23', 'initiated', NULL, 232),
(8, 1, 'New Lead created', NULL, NULL, NULL, 5, '26.8520948', '81.002633', NULL, '2024-04-12 17:31:15', '2024-04-12 17:31:15', 'initiated', NULL, 64),
(9, 1, 'New Lead created', NULL, NULL, NULL, 6, '26.852095', '81.0026274', NULL, '2024-04-12 18:09:22', '2024-04-12 18:09:22', 'initiated', NULL, 232),
(10, 1, 'New Lead created', NULL, NULL, NULL, 7, '26.8520757', '81.0025687', NULL, '2024-04-12 18:18:11', '2024-04-12 18:18:11', 'initiated', NULL, 232),
(11, 1, 'New Lead created', NULL, NULL, NULL, 8, '26.8520897', '81.0026105', NULL, '2024-04-12 18:28:08', '2024-04-12 18:28:08', 'initiated', NULL, 232),
(12, 1, 'New Lead created', NULL, NULL, NULL, 9, '26.8520647', '81.0025712', NULL, '2024-04-12 18:41:53', '2024-04-12 18:41:53', 'initiated', NULL, 232),
(13, 1, 'New Lead created', NULL, NULL, NULL, 10, '26.8521067', '81.0026327', NULL, '2024-04-12 18:59:46', '2024-04-12 18:59:46', 'initiated', NULL, 64),
(14, 1, 'New Lead created', NULL, NULL, NULL, 11, '26.8520996', '81.0026243', NULL, '2024-04-12 19:01:03', '2024-04-12 19:01:03', 'initiated', NULL, 232),
(15, 1, 'New Lead created', NULL, NULL, NULL, 12, '26.8520285', '81.0026778', NULL, '2024-04-12 19:12:52', '2024-04-12 19:12:52', 'initiated', NULL, 64),
(16, 1, 'New Lead created', NULL, NULL, NULL, 13, '26.8793149', '80.9959246', NULL, '2024-04-12 19:15:01', '2024-04-12 19:15:01', 'initiated', NULL, 206),
(17, 2, 'ok', NULL, NULL, NULL, 13, '26.8862225', '80.9955549', '2024-04-14', '2024-04-12 19:19:59', '2024-04-12 19:19:59', 'Progress', '2024-04-13', 206),
(18, 2, 'bbbj', NULL, NULL, NULL, 13, '26.88643', '80.9956967', '2024-04-15', '2024-04-12 19:20:27', '2024-04-12 19:20:27', 'Progress', '2024-04-13', 206),
(19, 3, 'okk', NULL, 'AED', 120, 13, '26.8865072', '80.9954189', NULL, '2024-04-12 19:20:55', '2024-04-12 19:20:55', 'Win', NULL, 206),
(20, 1, 'New Lead created', NULL, NULL, NULL, 14, '26.8493542', '80.9847818', NULL, '2024-04-14 11:30:47', '2024-04-14 11:30:47', 'initiated', NULL, 232),
(21, 2, 'remind me after some time', NULL, NULL, NULL, 14, '26.8493543', '80.984782', '2024-05-31', '2024-04-14 11:37:57', '2024-04-14 11:37:57', 'Progress', '2024-04-30', 232),
(22, 3, 'test', NULL, 'INR', 1200, 14, '26.8493542', '80.9847817', NULL, '2024-04-14 11:41:00', '2024-04-14 11:41:00', 'Win', NULL, 232),
(23, 4, 'ok', 1, NULL, NULL, 11, '26.8493543', '80.9847824', NULL, '2024-04-14 11:41:15', '2024-04-14 11:41:15', 'Lost', NULL, 232),
(24, 2, 'test', NULL, NULL, NULL, 9, '26.8393829', '80.9089791', '2024-04-16', '2024-04-15 12:05:29', '2024-04-15 12:05:29', 'Progress', '2024-04-16', 232),
(25, 1, 'New Lead created', NULL, NULL, NULL, 15, '26.8393832', '80.9089767', NULL, '2024-04-15 15:41:50', '2024-04-15 15:41:50', 'initiated', NULL, 232),
(26, 1, 'New Lead created', NULL, NULL, NULL, 16, '26.8393834', '80.9089755', NULL, '2024-04-15 16:21:02', '2024-04-15 16:21:02', 'initiated', NULL, 64),
(27, 2, 'yy', NULL, NULL, NULL, 16, '26.8393832', '80.9089767', '2024-04-16', '2024-04-15 16:26:39', '2024-04-15 16:26:39', 'Progress', '2024-04-16', 64),
(28, 2, 'test remark', NULL, NULL, NULL, 16, '26.8393834', '80.9089755', '2024-04-30', '2024-04-15 16:32:53', '2024-04-15 16:32:53', 'Progress', '2024-04-30', 64),
(29, 3, 'deal closed with success', NULL, 'AED', 260, 16, '26.8393834', '80.9089755', NULL, '2024-04-15 16:33:19', '2024-04-15 16:33:19', 'Win', NULL, 64),
(30, 1, 'New Lead created', NULL, NULL, NULL, 17, '26.8393834', '80.9089755', NULL, '2024-04-15 16:56:42', '2024-04-15 16:56:42', 'initiated', NULL, 64),
(31, 2, 'test ', NULL, NULL, NULL, 10, '26.8393824', '80.9089748', '2024-04-27', '2024-04-15 17:06:43', '2024-04-15 17:06:43', 'Progress', '2024-04-27', 64),
(32, 2, 'test', NULL, NULL, NULL, 17, '26.8393832', '80.9089767', '2024-04-27', '2024-04-15 17:20:10', '2024-04-15 17:20:10', 'Progress', '2024-04-25', 64),
(33, 4, 'deal closed', 1, NULL, NULL, 17, '26.8393829', '80.9089804', NULL, '2024-04-15 17:20:28', '2024-04-15 17:20:28', 'Lost', NULL, 64),
(34, 1, 'New Lead created', NULL, NULL, NULL, 18, '26.8393834', '80.9089755', NULL, '2024-04-15 17:21:21', '2024-04-15 17:21:21', 'initiated', NULL, 64),
(35, 1, 'New Lead created', NULL, NULL, NULL, 19, '26.8393834', '80.9089755', NULL, '2024-04-15 17:24:25', '2024-04-15 17:24:25', 'initiated', NULL, 64),
(36, 1, 'New Lead created', NULL, NULL, NULL, 20, '26.8521118', '81.0026701', NULL, '2024-04-16 11:58:04', '2024-04-16 11:58:04', 'initiated', NULL, 64),
(37, 2, 'In progress', NULL, NULL, NULL, 20, '26.8521135', '81.002675', '2024-05-09', '2024-04-16 12:01:02', '2024-04-16 12:01:02', 'Progress', '2024-05-08', 64),
(38, 3, 'Done', NULL, 'QAR', 2000, 20, '26.8521112', '81.0026858', NULL, '2024-04-16 12:10:28', '2024-04-16 12:10:28', 'Win', NULL, 64),
(39, 2, 'testing remark', NULL, NULL, NULL, 18, '26.8521098', '81.002651', '2024-06-27', '2024-04-16 16:28:58', '2024-04-16 16:28:58', 'Progress', '2024-06-26', 64),
(40, 2, 'test', NULL, NULL, NULL, 16, '26.8521043', '81.0026498', '2024-05-24', '2024-04-16 16:36:45', '2024-04-16 16:36:45', 'Progress', '2024-05-17', 64),
(41, 2, 'jkoj', NULL, NULL, NULL, 15, '26.8879748', '80.9918634', '2024-04-21', '2024-04-20 08:59:26', '2024-04-20 08:59:26', 'Progress', '2024-04-21', 232),
(42, 1, 'New Lead created', NULL, NULL, NULL, 21, '26.852067', '81.0026027', NULL, '2024-04-22 12:17:06', '2024-04-22 12:17:06', 'initiated', NULL, 232),
(43, 2, 'To visit tomorrow again', NULL, NULL, NULL, 21, '26.8521017', '81.0026457', '2024-04-30', '2024-04-22 12:24:16', '2024-04-22 12:24:16', 'Progress', '2024-04-26', 232),
(44, 1, 'New Lead created', NULL, NULL, NULL, 22, '26.8521699', '81.0027154', NULL, '2024-04-23 12:31:34', '2024-04-23 12:31:34', 'initiated', NULL, 232),
(45, 1, 'New Lead created', NULL, NULL, NULL, 22, '26.8521315', '81.0026927', NULL, '2024-04-30 13:39:59', '2024-04-30 13:39:59', 'initiated', NULL, 232),
(46, 2, 'Meet on 25', NULL, NULL, NULL, 22, '26.8521348', '81.0026942', '2024-05-25', '2024-04-30 13:45:27', '2024-04-30 13:45:27', 'Progress', '2024-05-23', 232),
(47, 3, 'Lead Closed', NULL, 'INR', 450, 22, '26.8521275', '81.0026952', NULL, '2024-04-30 13:46:45', '2024-04-30 13:46:45', 'Win', NULL, 232),
(48, 1, 'New Lead created', NULL, NULL, NULL, 23, '26.8521424', '81.0026969', NULL, '2024-05-06 12:30:50', '2024-05-06 12:30:50', 'initiated', NULL, 232),
(49, 2, 'In progress', NULL, NULL, NULL, 23, '26.8521329', '81.0026998', '2024-05-31', '2024-05-06 12:32:13', '2024-05-06 12:32:13', 'Progress', '2024-05-29', 232),
(50, 3, 'Done', NULL, 'INR', 1000, 23, '26.8521411', '81.0026895', NULL, '2024-05-06 12:49:38', '2024-05-06 12:49:38', 'Win', NULL, 232),
(51, 1, 'New Lead created', NULL, NULL, NULL, 24, '26.8521449', '81.0026917', NULL, '2024-05-06 15:21:07', '2024-05-06 15:21:07', 'initiated', NULL, 232);

-- --------------------------------------------------------

--
-- Table structure for table `sp_fuel_type`
--

CREATE TABLE `sp_fuel_type` (
  `id` int(11) NOT NULL,
  `fuel_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_fuel_type`
--

INSERT INTO `sp_fuel_type` (`id`, `fuel_type`, `status`) VALUES
(1, 'Diesel', 1),
(2, 'Petrol', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_holidays`
--

CREATE TABLE `sp_holidays` (
  `id` int(11) NOT NULL,
  `holiday_type_id` int(11) NOT NULL,
  `holiday_type` varchar(100) NOT NULL,
  `holiday` varchar(100) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `organization_name` varchar(150) DEFAULT NULL,
  `applicable_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `start_date` date NOT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_date` date NOT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `description` text CHARACTER SET utf8,
  `approval_description` text,
  `document` text,
  `status` int(11) NOT NULL DEFAULT '1',
  `holiday_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_holidays`
--

INSERT INTO `sp_holidays` (`id`, `holiday_type_id`, `holiday_type`, `holiday`, `organization_id`, `organization_name`, `applicable_to`, `start_date`, `start_time`, `end_date`, `end_time`, `description`, `approval_description`, `document`, `status`, `holiday_status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Festival Holiday', 'Ram Navami', 3, '\nEmobic Pvt Ltd', '\"17\"', '2024-04-17', '00:00:00', '2024-04-17', '00:00:00', '<p>Ram Navami leave</p>', NULL, NULL, 1, 1, '2024-04-12 10:22:21', '2024-04-12 10:22:21'),
(2, 2, 'Gazetted Holiday', 'Bakrid', 3, '\nEmobic Pvt Ltd', '\"17\"', '2024-05-03', '00:00:00', '2024-05-03', '00:00:00', '<p>Bakrid</p>', NULL, NULL, 1, 1, '2024-04-12 10:24:26', '2024-04-12 10:24:26');

-- --------------------------------------------------------

--
-- Table structure for table `sp_holiday_types`
--

CREATE TABLE `sp_holiday_types` (
  `id` int(11) NOT NULL,
  `holiday_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_holiday_types`
--

INSERT INTO `sp_holiday_types` (`id`, `holiday_type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Official Holiday', 1, '2020-12-18 12:39:26', '2024-04-12 10:21:42'),
(2, 'Gazetted Holiday', 1, '2021-03-25 10:35:36', '2024-04-12 10:21:23'),
(3, 'Festival Holiday', 1, '2021-03-25 10:35:36', '2024-04-12 10:21:01'),
(4, 'Public Holiday', 1, '2021-03-25 10:35:36', '2024-04-12 10:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `sp_income_categories`
--

CREATE TABLE `sp_income_categories` (
  `id` int(11) NOT NULL,
  `income_category` varchar(25) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_income_categories`
--

INSERT INTO `sp_income_categories` (`id`, `income_category`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '< 1 Lakh', 1, '2020-07-15 06:46:43', '2020-07-15 06:46:43'),
(2, '> 1 lakh & < 2 lakh', 1, '2020-07-15 06:50:49', '2020-07-15 06:50:49'),
(3, '< 5 lakh', 1, '2020-07-15 06:53:07', '2020-07-15 06:53:07'),
(4, '> 5 lakh', 1, '2020-07-15 06:54:45', '2020-07-15 06:54:45');

-- --------------------------------------------------------

--
-- Table structure for table `sp_insurance_coverage`
--

CREATE TABLE `sp_insurance_coverage` (
  `id` int(11) NOT NULL,
  `insurance_coverage` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_insurance_coverage`
--

INSERT INTO `sp_insurance_coverage` (`id`, `insurance_coverage`) VALUES
(1, '3rd Party'),
(2, 'Total Loss'),
(3, 'Rubber'),
(4, 'Glass');

-- --------------------------------------------------------

--
-- Table structure for table `sp_iso_master`
--

CREATE TABLE `sp_iso_master` (
  `id` int(11) NOT NULL,
  `iso_id` int(10) DEFAULT NULL,
  `iso_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_iso_master`
--

INSERT INTO `sp_iso_master` (`id`, `iso_id`, `iso_name`) VALUES
(1, 9001, 'Quality Management System'),
(3, 17025, 'General requirements for testing and/or calibrations'),
(5, 14001, 'Environment Management System'),
(6, 45001, 'Health & Safety Management System'),
(7, 22000, 'Food Safety Management System'),
(8, 41001, 'Facility Management System'),
(9, 39001, 'Road Traffic Safety Management System'),
(10, 18788, 'Private Security Operations Management System'),
(11, 21001, 'Educational Organizations Management System'),
(12, 29990, 'Education & Training (Learning & Development)'),
(13, 13027, 'Hygiene and Sanitation Standard'),
(14, 22301, 'Business Continuity Management System');

-- --------------------------------------------------------

--
-- Table structure for table `sp_lead_basic`
--

CREATE TABLE `sp_lead_basic` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `basic_date` date DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `turnover` float DEFAULT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `contact_person_name` varchar(255) DEFAULT NULL,
  `desk_no` int(11) DEFAULT NULL,
  `contry_code_id` int(11) DEFAULT NULL,
  `mobile_no` bigint(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `total_no_of_employee` int(11) DEFAULT NULL,
  `tag_address` varchar(255) DEFAULT NULL,
  `core_business_area` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `phase` int(11) NOT NULL DEFAULT '1',
  `deal_amount` float NOT NULL DEFAULT '0',
  `deal_date_time` datetime DEFAULT NULL,
  `deal_currency_code` varchar(20) DEFAULT NULL,
  `approvel_status` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(30) DEFAULT NULL,
  `longitude` varchar(30) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_lead_basic`
--

INSERT INTO `sp_lead_basic` (`id`, `created_by_id`, `basic_date`, `company_name`, `turnover`, `currency_code`, `contact_person_name`, `desk_no`, `contry_code_id`, `mobile_no`, `email`, `address`, `total_no_of_employee`, `tag_address`, `core_business_area`, `status`, `phase`, `deal_amount`, `deal_date_time`, `deal_currency_code`, `approvel_status`, `latitude`, `longitude`, `created_at`, `updated_at`, `remark`) VALUES
(1, 224, '2024-04-12', 'SORT STRING SOLUTIONS LLP', 8299230000, 'INR', 'Abhishek Kumar Mishra', 82995, 1, 8299224866, 'abhimishrait@gmail.com', 'doha, Qatar', 25, NULL, '1,3,2,4', 3, 1, 1200, '2024-04-12 17:10:23', 'INR', 0, '26.8521116', '81.0026567', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(4, 224, '2024-04-12', 'Raju hinrani company', 1200, 'AED', 'test data', 12800, 1, 5454544545, 'test@gmail.com', 'test', 25, NULL, '1,2', 1, 1, 0, NULL, NULL, 0, '26.8520518', '81.0025751', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(6, 224, '2024-04-12', 'rgvr', 595956, 'AED', 'egge', 56, 1, 84455614645, 'dafw@gmail.com', 'gbbh j', 58, NULL, '10,5,6', 1, 1, 0, NULL, NULL, 0, '26.852095', '81.0026274', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(7, 224, '2024-04-12', 'gb', 33, 'AED', 'vthggb', 666, 1, 88395965969, 'dhh@gmail.com', 'hbbhnh', 69, NULL, '1,3,8', 1, 1, 0, NULL, NULL, 0, '26.8520757', '81.0025687', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(9, 224, '2024-04-12', 'vhbj', 25, 'AED', ' b n', 686, 1, 966858855886, 'dff@gmail.com', 'cyhvbh', 69, NULL, '1,3,8', 2, 1, 0, NULL, NULL, 0, '26.8520647', '81.0025712', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(10, 216, '2024-04-12', 'hsjz', 6767, 'AED', 'zshz', 4667, 1, 646499797777, 'abc@gmail.com', 'hsbzn', 23, NULL, '6,4', 2, 1, 0, NULL, NULL, 0, '26.8521067', '81.0026327', '2024-04-20 11:26:08', '2024-04-20 11:26:08', NULL),
(11, 224, '2024-04-12', 'tvvt', 6229, 'AED', 'def', 555, 1, 5585488554, 'abb@gmail.com', 'jbunin', 933, NULL, '5,11', 4, 1, 0, NULL, NULL, 0, '26.8520996', '81.0026243', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(13, 206, '2024-04-12', 'todaymlk', 120, 'AED', 'rohan', 12, 2, 6886688668688668, 'ak@gmail.com', 'okcknc', 12, NULL, '1,3,2,6', 3, 1, 120, '2024-04-12 19:20:55', 'AED', 0, '26.8793149', '80.9959246', '2024-04-20 11:25:35', '2024-04-20 11:25:35', NULL),
(14, 224, '2024-04-14', 'Emobic Infra', 25000000, 'INR', 'Mr Ritesh Pandit', 125, 1, 8299224861, 'abhimishrait1@gmail.com', '1/91, Lucknow Uttar Pradesh India', 25, NULL, '1,3,2,4', 3, 1, 1200, '2024-04-14 11:41:00', 'INR', 0, '26.8493542', '80.9847818', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(15, 224, '2024-04-15', 'jbbj', 6393, 'AED', 'guug', 353, 1, 85586886668, 'zxc@gmail.com', 'tcvy', 235, NULL, '1,3,8', 2, 1, 0, NULL, NULL, 0, '26.8393832', '80.9089767', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(16, 64, '2024-04-15', 'Pal Fresh', 26, 'AED', 'Nikita', 250, 1, 89966525866, 'nikita2@sortstring.com', 'aishbagh ', 25, NULL, '8,2', 2, 1, 260, '2024-04-15 16:33:19', 'AED', 0, '26.8393834', '80.9089755', '2024-04-20 11:24:37', '2024-04-20 11:24:37', NULL),
(17, 64, '2024-04-15', 'AyuFarm', 250, 'QAR', 'Rishabh', 25, 3, 88997744778, 'rishabh4@sortstring.com', 'gomti nagar ', 26, NULL, '1,7,4', 4, 1, 0, NULL, NULL, 0, '26.8393834', '80.9089755', '2024-04-20 11:24:00', '2024-04-20 11:24:00', NULL),
(18, 206, '2024-04-15', 'Sakhi', 250, 'QAR', 'Prabhat ', 55, 3, 5866866868, 'prabhat45@gmail.com', 'munshipulia ', 25, NULL, '1,10', 2, 1, 0, NULL, NULL, 0, '26.8393834', '80.9089755', '2024-04-20 11:23:22', '2024-04-20 11:23:22', NULL),
(19, 206, '2024-04-15', 'Sort String ', 23000, 'QAR', 'Abhishek Mishra ', 26, 3, 669544788896, 'abhishek45@gmail.com', 'patrakarpuram', 36, NULL, '7,2', 1, 1, 0, NULL, NULL, 0, '26.8393834', '80.9089755', '2024-04-21 23:26:54', '2024-04-21 23:26:54', NULL),
(21, 224, '2024-04-22', 'Abc Mit', 1000, 'QAR', 'Rishabh', 25, 3, 7705056122, 'rishabh@sortstring.com', 'Lucknow', 25, NULL, '4,6,3', 2, 1, 0, NULL, NULL, 0, '26.852067', '81.0026027', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(22, 224, '2024-04-30', 'ABC Mit', 100000, 'INR', 'Rishabh ', 13, 1, 7706062155, 'rishabh1@gmail.com', '1/91, Viraam Khand', 15, NULL, '1,3,2', 3, 1, 450, '2024-04-30 13:46:44', 'INR', 0, '26.8521315', '81.0026927', '2024-04-30 13:51:15', '2024-04-30 13:51:15', NULL),
(23, 232, '2024-05-06', 'Abc Mit', 152, 'QAR', 'Rishabh', 125, 3, 77058561222, 'rishabh@sort.in', 'Lucknow', 25, NULL, '1,3,4', 3, 1, 1000, '2024-05-06 12:49:37', 'INR', 0, '26.8521424', '81.0026969', '2024-05-06 12:49:38', '2024-05-06 12:49:38', NULL),
(24, 232, '2024-05-06', 'Bsjsja', 128, 'QAR', 'Rishaj', 254, 3, 979764646644, 'hahah@gmail.com', 'qowo', 25, NULL, '8', 1, 1, 0, NULL, NULL, 0, '26.8521449', '81.0026917', '2024-05-06 15:21:07', '2024-05-06 15:21:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sp_lead_iso`
--

CREATE TABLE `sp_lead_iso` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `iso_applicable_id` int(11) DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `date_of_survilance1` date DEFAULT NULL,
  `date_of_survilance2` date DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `copy_of_iso` varchar(255) DEFAULT NULL,
  `iso_issued_agency` varchar(155) DEFAULT NULL,
  `iso_issued_consultant` varchar(155) DEFAULT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `price_of_existing_iso` float DEFAULT NULL,
  `iso_status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_lead_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `master_iso_id` int(11) DEFAULT NULL,
  `master_iso_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_lead_iso`
--

INSERT INTO `sp_lead_iso` (`id`, `created_by_id`, `iso_applicable_id`, `date_of_issue`, `date_of_survilance1`, `date_of_survilance2`, `date_of_expiry`, `copy_of_iso`, `iso_issued_agency`, `iso_issued_consultant`, `currency_code`, `price_of_existing_iso`, `iso_status`, `created_at`, `updated_at`, `last_lead_id`, `status`, `master_iso_id`, `master_iso_name`) VALUES
(8, 224, 1, '2024-04-12', '2024-04-12', '2024-04-13', '2024-04-26', '/media/media/iso_image/1712927589.png', 'hvhv', ' hhv', 'AED', 20, 1, '2024-04-12 18:43:10', '2024-04-12 18:43:10', 9, 1, 9001, 'Quality Management System'),
(10, 206, 1, '2024-04-12', '2024-04-12', '2024-04-13', '2024-04-14', '/media/media/iso_image/1712929589.jpg', 'jxjxj', 'oox', 'AED', 150, 1, '2024-04-12 19:16:30', '2024-04-12 19:16:30', 13, 1, 9001, 'Quality Management System'),
(11, 224, 1, '2024-04-14', '2024-05-31', '2024-06-30', '2024-08-31', '/media/media/iso_image/1713074682.jpg', 'Sort String Solutions LLP', 'Abhishek Mishra', 'AED', 1200, 1, '2024-04-14 11:34:42', '2024-04-14 11:34:42', 14, 1, 9001, 'Quality Management System'),
(12, 224, 5, '2024-04-13', '2024-05-23', '2024-06-28', '2024-08-15', '/media/media/iso_image/1713178019.png', 'vbbb', 'vhb', 'AFN', 23, 1, '2024-04-15 16:16:59', '2024-04-15 16:16:59', 15, 1, 14001, 'Environment Management System'),
(13, 224, 1, '2024-04-13', '2024-04-25', '2024-04-30', '2024-05-31', '/media/media/iso_image/1713178054.png', 'bbn', 'hh', 'AED', 66, 1, '2024-04-15 16:17:35', '2024-04-15 16:17:35', 15, 1, 9001, 'Quality Management System'),
(14, 64, 7, '2024-04-13', '2024-05-23', '2024-06-28', '2024-07-27', '/media/media/iso_image/1713178293.png', 'bb', 'ghh', 'ALL', 25, 1, '2024-04-18 02:52:43', '2024-04-18 02:52:43', 16, 1, 22000, 'Food Safety Management System'),
(15, 64, 6, '2024-04-02', '2024-04-27', '2024-05-23', '2024-05-31', '/media/media/iso_image/1713178349.png', 'ghj', 'hhi', 'AED', 23, 1, '2024-04-18 02:52:43', '2024-04-18 02:52:43', 16, 1, 45001, 'Health & Safety Management System'),
(16, 64, 5, '2024-04-06', '2024-04-27', '2024-05-31', '2024-06-29', '/media/media/iso_image/1713178381.png', 'hk', 'bnk', 'AMD', 89, 1, '2024-04-18 02:52:43', '2024-04-18 02:52:43', 16, 1, 14001, 'Environment Management System'),
(17, 64, 1, '2024-04-13', '2024-04-20', '2024-04-30', '2024-05-18', NULL, 'xyz', 'hh', 'QAR', 250, 1, '2024-04-15 16:57:09', '2024-04-15 16:57:09', 17, 1, 9001, 'Quality Management System'),
(18, 64, 6, '2024-04-13', '2024-04-26', '2024-04-30', '2024-05-31', NULL, 'hn', 'nk', 'QAR', 36, 1, '2024-04-15 17:02:54', '2024-04-15 17:02:54', 17, 1, 45001, 'Health & Safety Management System'),
(19, 64, 5, '2024-04-13', '2024-04-27', '2024-05-23', '2024-06-27', '/media/media/iso_image/1713180737.png', 'bm', 'fh', 'QAR', 26, 1, '2024-04-15 17:02:17', '2024-04-15 17:02:17', 17, 1, 14001, 'Environment Management System'),
(20, 64, 9, '2024-04-01', '2024-04-27', '2024-04-30', '2024-05-31', NULL, 'vjj', 'ghk', 'QAR', 260, 1, '2024-04-15 17:04:05', '2024-04-15 17:04:05', 17, 1, 39001, 'Road Traffic Safety Management System'),
(21, 64, 10, '2024-04-06', '2024-04-30', '2024-05-31', '2024-06-29', '/media/media/iso_image/1713180910.png', 'chh', 'hj', 'QAR', 66, 1, '2024-04-15 17:05:11', '2024-04-15 17:05:11', 17, 1, 18788, 'Private Security Operations Management System'),
(22, 64, 14, '2024-03-03', '2024-04-27', '2024-05-31', '2024-06-29', NULL, 'hhj', 'vbn', 'QAR', 369, 1, '2024-04-15 17:05:52', '2024-04-15 17:05:52', 17, 1, 22301, 'Business Continuity Management System'),
(23, 206, 1, '2024-04-13', '2024-04-24', '2024-04-27', '2024-05-23', NULL, 'bn', 'ghj', 'QAR', 56, 1, '2024-04-20 00:42:19', '2024-04-20 00:42:19', 18, 1, 9001, 'Quality Management System'),
(24, 206, 7, '2024-04-06', '2024-04-27', '2024-04-30', '2024-05-29', NULL, 'vb', 'hj', 'QAR', 26, 1, '2024-04-20 00:42:19', '2024-04-20 00:42:19', 18, 1, 22000, 'Food Safety Management System'),
(25, 206, 6, '2024-04-13', '2024-04-27', '2024-05-16', '2024-05-31', '/media/media/iso_image/1713181971.png', 'vb', 'vhj', 'QAR', 36, 1, '2024-04-20 00:42:19', '2024-04-20 00:42:19', 18, 1, 45001, 'Health & Safety Management System'),
(29, 216, 3, '2024-04-18', '2024-04-18', '2024-04-24', '2024-04-30', NULL, 'test', 'test', 'QAR', 12000, 1, '2024-04-19 23:41:37', '2024-04-19 23:41:37', 10, 1, 17025, 'General requirements for testing and/or calibrations'),
(30, 216, 5, '2024-04-19', '2024-04-19', '2024-04-20', '2024-04-22', NULL, 'goijoghi', 'njgkdpof', 'QAR', 656, 1, '2024-04-19 23:41:37', '2024-04-19 23:41:37', 10, 1, 14001, 'Environment Management System');

-- --------------------------------------------------------

--
-- Table structure for table `sp_lead_iso_save`
--

CREATE TABLE `sp_lead_iso_save` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) NOT NULL,
  `last_lead_id` int(11) NOT NULL,
  `iso_created_id` varchar(20) NOT NULL,
  `currency_code` varchar(20) DEFAULT NULL,
  `iso_amount` float DEFAULT NULL,
  `iso_created_status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_lead_iso_save`
--

INSERT INTO `sp_lead_iso_save` (`id`, `created_by_id`, `last_lead_id`, `iso_created_id`, `currency_code`, `iso_amount`, `iso_created_status`, `created_at`, `updated_at`, `status`) VALUES
(1, 224, 1, '1,3,5,6', 'INR', 15000, 0, '2024-04-18 04:28:40', '2024-04-18 04:28:40', 1),
(2, 224, 4, '1,3,5', 'AED', 120, 0, '2024-04-12 11:42:30', '2024-04-12 11:42:30', 1),
(5, 224, 7, '3', 'QAR', 410, 0, '2024-04-17 21:17:18', '2024-04-17 21:17:18', 1),
(7, 224, 11, '1,3', 'QAR', 1200, 0, '2024-04-18 05:23:41', '2024-04-18 05:23:41', 1),
(8, 206, 19, '1,6', 'QAR', 1200000, 0, '2024-04-21 17:56:56', '2024-04-21 17:56:56', 1),
(9, 224, 21, '3,5,6', 'QAR', 12000, 0, '2024-04-22 06:49:24', '2024-04-22 06:49:24', 1),
(10, 224, 22, '1,3,5', 'INR', 500, 0, '2024-04-30 08:10:46', '2024-04-30 08:10:46', 1),
(11, 232, 23, '1,3,6,7', 'QAR', 150, 0, '2024-05-06 07:00:59', '2024-05-06 07:00:59', 1),
(12, 232, 24, '1,3,5,6,7,8,9,10,11', 'QAR', 450, 0, '2024-05-06 09:51:47', '2024-05-06 09:51:47', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_lead_ledger`
--

CREATE TABLE `sp_lead_ledger` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `credit` int(11) DEFAULT NULL,
  `debit` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_lead_other`
--

CREATE TABLE `sp_lead_other` (
  `id` int(11) NOT NULL,
  `created_by_id` int(11) DEFAULT NULL,
  `other_production_pitch` varchar(155) DEFAULT NULL,
  `software_or_erp` varchar(155) DEFAULT NULL,
  `sales_person` varchar(155) DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `other_resource` varchar(155) DEFAULT NULL,
  `reminder` date DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_lead_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_lead_other`
--

INSERT INTO `sp_lead_other` (`id`, `created_by_id`, `other_production_pitch`, `software_or_erp`, `sales_person`, `visit_date`, `other_resource`, `reminder`, `remark`, `created_at`, `updated_at`, `last_lead_id`, `status`) VALUES
(1, 224, '1', '1,2', '232', '2024-04-30', '224', '2024-04-13', 'test address', '2024-04-30 13:51:15', '2024-04-30 13:51:15', 1, 1),
(2, 224, '0', NULL, '232', '2024-04-30', '206', '2024-04-13', 'test\n', '2024-04-30 13:51:15', '2024-04-30 13:51:15', 4, 1),
(3, 206, '1', '2,4,1', '206', '2024-04-12', '207', '2024-04-13', 'oockck', '2024-04-19 18:49:57', '2024-04-19 18:49:57', 13, 1),
(4, 224, '1', '1,2,3,4', '232', '2024-04-30', '224', '2024-04-29', 'test', '2024-04-30 13:51:15', '2024-04-30 13:51:15', 14, 1),
(5, 64, '1', '1,2', '64', '2024-04-16', NULL, '2024-04-16', 'yes\ntest', '2024-04-15 16:25:58', '2024-04-15 16:25:58', 16, 1),
(6, 64, '1', '2,1,4', '64', '2024-04-27', '206', '2024-04-19', 'testing', '2024-04-15 17:06:22', '2024-04-15 17:06:22', 17, 1),
(7, 206, '1', '1,2', '206', '2024-04-27', '224', '2024-04-18', 'test demo', '2024-04-20 00:42:22', '2024-04-20 00:42:22', 18, 1),
(8, 206, '1', '1,2,3,4,5', '206', '2024-04-23', '64', '2024-04-22', 'test', '2024-04-21 23:27:00', '2024-04-21 23:27:00', 19, 1),
(10, 216, '1', '4', '216', '2024-04-20', '206', '2024-04-20', 'gfjkhu', '2024-04-19 23:41:38', '2024-04-19 23:41:38', 10, 1),
(11, 224, '1', '5', '232', '2024-04-26', '224', '2024-04-24', 'Done', '2024-04-30 13:51:15', '2024-04-30 13:51:15', 21, 1),
(12, 224, '1', '1,5', '232', '2024-05-15', '224', '2024-05-12', 'Go Ahead', '2024-04-30 13:51:15', '2024-04-30 13:51:15', 22, 1),
(13, 232, '0', NULL, '232', '2024-05-07', '232', '2024-05-07', 'Testing', '2024-05-06 12:31:15', '2024-05-06 12:31:15', 23, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_leave_policies`
--

CREATE TABLE `sp_leave_policies` (
  `id` int(11) NOT NULL,
  `leave_policy` varchar(100) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `organization_name` varchar(150) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `policy_status` int(11) DEFAULT NULL,
  `policy_description` varchar(150) DEFAULT NULL,
  `approval_description` text,
  `document` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_leave_policies`
--

INSERT INTO `sp_leave_policies` (`id`, `leave_policy`, `organization_id`, `organization_name`, `status`, `policy_status`, `policy_description`, `approval_description`, `document`, `created_at`, `updated_at`) VALUES
(1, 'Emobic Leave  Policy', 3, 'Emobic Pvt Ltd', 1, 3, '', NULL, NULL, '2023-09-15 12:48:39', '2024-03-13 10:35:32');

-- --------------------------------------------------------

--
-- Table structure for table `sp_leave_policy_details`
--

CREATE TABLE `sp_leave_policy_details` (
  `id` int(11) NOT NULL,
  `leave_policy_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `year_leave_count` decimal(10,2) NOT NULL,
  `month_leave_count` decimal(10,2) DEFAULT NULL,
  `consecutive_leave` decimal(10,2) NOT NULL,
  `is_salary_affecting` int(11) NOT NULL,
  `is_carry_forward` int(11) NOT NULL,
  `is_halfday_included` int(11) NOT NULL,
  `can_swipe` int(11) NOT NULL,
  `apply_leave_before` int(11) DEFAULT NULL,
  `is_fraction_leave` int(11) NOT NULL DEFAULT '0',
  `is_avial_advance_leave` int(11) NOT NULL DEFAULT '0',
  `is_document_required` int(11) NOT NULL DEFAULT '0',
  `swipeable_leave_types` varchar(20) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_leave_policy_details`
--

INSERT INTO `sp_leave_policy_details` (`id`, `leave_policy_id`, `leave_type_id`, `year_leave_count`, `month_leave_count`, `consecutive_leave`, `is_salary_affecting`, `is_carry_forward`, `is_halfday_included`, `can_swipe`, `apply_leave_before`, `is_fraction_leave`, `is_avial_advance_leave`, `is_document_required`, `swipeable_leave_types`, `description`, `created_at`, `updated_at`) VALUES
(27, 1, 1, 18.00, 2.00, 2.00, 0, 0, 1, 0, 2, 0, 0, 0, NULL, NULL, '2024-04-12 11:17:26', '2024-04-12 11:17:26'),
(28, 1, 5, 12.00, 2.00, 1.00, 0, 0, 0, 0, 1, 0, 0, 0, NULL, NULL, '2024-04-12 11:17:26', '2024-04-12 11:17:26');

-- --------------------------------------------------------

--
-- Table structure for table `sp_leave_types`
--

CREATE TABLE `sp_leave_types` (
  `id` int(11) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_leave_types`
--

INSERT INTO `sp_leave_types` (`id`, `leave_type`, `alias`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Casual Leave', 'CL', 1, '2020-12-17 09:46:32', '2020-12-17 09:46:32'),
(4, 'Sick Leave', 'SL', 1, '2020-12-18 13:01:43', '2020-12-18 13:01:43'),
(5, 'Earned Leave', 'ELs', 1, '2021-03-02 06:41:44', '2021-03-02 06:41:44');

-- --------------------------------------------------------

--
-- Table structure for table `sp_leave_type_documents`
--

CREATE TABLE `sp_leave_type_documents` (
  `id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `document` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_leave_type_documents`
--

INSERT INTO `sp_leave_type_documents` (`id`, `leave_type_id`, `document`) VALUES
(1, 1, 'Application for leave');

-- --------------------------------------------------------

--
-- Table structure for table `sp_license_category`
--

CREATE TABLE `sp_license_category` (
  `id` int(11) NOT NULL,
  `license_category` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_license_category`
--

INSERT INTO `sp_license_category` (`id`, `license_category`) VALUES
(1, 'MC 50cc'),
(2, 'LMV–NT'),
(3, 'MCWOG/FVG'),
(4, 'MC EX50CC'),
(5, 'MCWG or M/CYCL.WG');

-- --------------------------------------------------------

--
-- Table structure for table `sp_mode_of_payments`
--

CREATE TABLE `sp_mode_of_payments` (
  `id` int(11) NOT NULL,
  `mode_of_payment` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_mode_of_payments`
--

INSERT INTO `sp_mode_of_payments` (`id`, `mode_of_payment`, `created_at`, `updated_at`) VALUES
(1, 'Cash', '2020-11-18 09:16:30', '2020-11-18 09:16:30'),
(2, 'Cheque', '2020-11-18 09:16:30', '2020-11-18 09:16:30'),
(3, 'UPI', '2020-11-18 09:16:35', '2020-11-18 09:16:35');

-- --------------------------------------------------------

--
-- Table structure for table `sp_modules`
--

CREATE TABLE `sp_modules` (
  `id` int(11) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `link` varchar(100) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_modules`
--

INSERT INTO `sp_modules` (`id`, `module_name`, `link`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Roles & Permission', NULL, NULL, 1, '2020-10-10 11:30:30', '2020-10-10 11:30:30'),
(2, 'Employee Management', NULL, NULL, 1, '2020-10-10 11:31:00', '2022-05-23 12:36:46'),
(4, 'Lead Management', NULL, NULL, 1, '2020-10-10 11:31:30', '2024-04-03 07:57:06'),
(7, 'Logistics Management', NULL, NULL, 0, '2020-10-10 11:32:24', '2021-04-06 15:37:02'),
(8, 'Master Management', NULL, NULL, 1, '2020-10-10 11:32:24', '2020-10-10 11:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `sp_module_permissions`
--

CREATE TABLE `sp_module_permissions` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `workflow` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_module_permissions`
--

INSERT INTO `sp_module_permissions` (`id`, `module_id`, `sub_module_id`, `permission_id`, `permission_slug`, `workflow`, `created_at`, `updated_at`) VALUES
(64, 1, 1, 1, 'list', '[{\"level_id\":\"1\",\"role_id\":\"0,1\",\"description\":\"csdVc\"}]', '2020-12-16 08:48:23', '2020-12-16 08:48:23'),
(65, 1, 1, 2, 'add', '[{\"level_id\":\"1\",\"role_id\":\"0\",\"description\":\"ktk\"},{\"level_id\":\"3\",\"role_id\":\"3\",\"description\":\"khgj\"}]', '2020-12-16 08:48:23', '2020-12-16 08:48:23'),
(66, 1, 1, 3, 'edit', '[{\"level_id\":\"1\",\"role_id\":\"7\",\"description\":\"test\"}]', '2021-04-07 13:30:23', '2021-04-07 13:30:23'),
(67, 1, 1, 4, 'view', '[{\"level_id\":\"1\",\"role_id\":\"7\",\"description\":\"test\"},{\"level_id\":\"2\",\"role_id\":\"6\",\"description\":\"test\"},{\"level_id\":\"3\",\"role_id\":\"4\",\"description\":\"test\"}]', '2021-04-08 07:23:59', '2021-04-08 07:23:59'),
(68, 2, 49, 1, 'list', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"1\",\"description\":\"can\"}]', '2022-09-02 09:34:06', '2022-09-02 09:34:06'),
(69, 2, 49, 2, 'add', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"23,24\",\"description\":\"can\"}]', '2022-09-02 09:34:07', '2022-09-02 09:34:07'),
(70, 2, 49, 3, 'edit', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"23,24\",\"description\":\"can\"}]', '2022-09-02 09:34:08', '2022-09-02 09:34:08'),
(71, 2, 49, 4, 'view', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"23,24\",\"description\":\"can\"}]', '2022-09-02 09:34:09', '2022-09-02 09:34:09'),
(72, 2, 49, 5, 'delete', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"23,24\",\"description\":\"can\"}]', '2022-09-02 09:34:11', '2022-09-02 09:34:11'),
(73, 2, 49, 6, 'export', '[{\"level_id\":\"1\",\"role_id\":\"2,3,4,7,8,9,12,13,14,15,16,17,18,10,11\",\"description\":\"can\"},{\"level_id\":\"2\",\"role_id\":\"5,6\",\"description\":\"can\"},{\"level_id\":\"3\",\"role_id\":\"23,24\",\"description\":\"can\"}]', '2022-09-02 09:34:13', '2022-09-02 09:34:13');

-- --------------------------------------------------------

--
-- Table structure for table `sp_notifications`
--

CREATE TABLE `sp_notifications` (
  `id` int(11) NOT NULL,
  `row_id` int(11) DEFAULT NULL,
  `model_name` varchar(100) DEFAULT NULL,
  `module` varchar(100) DEFAULT NULL,
  `sub_module` varchar(100) DEFAULT NULL,
  `heading` text CHARACTER SET utf8 NOT NULL,
  `activity` longtext CHARACTER SET utf8 NOT NULL,
  `activity_image` varchar(255) DEFAULT NULL,
  `from_user_id` int(11) NOT NULL,
  `from_user_name` varchar(150) NOT NULL,
  `to_user_id` int(11) NOT NULL,
  `to_user_type` int(11) DEFAULT '1',
  `to_user_name` varchar(150) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `platform` varchar(50) NOT NULL COMMENT '1=>web,2=>app,3=>system',
  `platform_icon` varchar(100) NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '1',
  `notification_type` int(11) DEFAULT NULL,
  `redirect_date` date DEFAULT NULL,
  `iso_type` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_notifications`
--

INSERT INTO `sp_notifications` (`id`, `row_id`, `model_name`, `module`, `sub_module`, `heading`, `activity`, `activity_image`, `from_user_id`, `from_user_name`, `to_user_id`, `to_user_type`, `to_user_name`, `icon`, `platform`, `platform_icon`, `read_status`, `notification_type`, `redirect_date`, `iso_type`, `created_at`, `updated_at`) VALUES
(1, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 10:46:41', '2024-04-12 10:46:41'),
(2, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 10:50:10', '2024-04-12 10:50:10'),
(3, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 10:50:56', '2024-04-12 10:50:56'),
(4, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 10:51:09', '2024-04-12 10:51:09'),
(5, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 11:13:38', '2024-04-12 11:13:38'),
(6, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 11:17:20', '2024-04-12 11:17:20'),
(7, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 11:19:13', '2024-04-12 11:19:13'),
(8, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 1, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 11:23:05', '2024-04-12 11:23:05'),
(9, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 4, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 11:43:39', '2024-04-12 11:43:39'),
(10, 1, 'SpUserLeaves', 'Users Management', 'Leave request forwarded', 'Leave Request Forwarded', 'Leave Handover request has been sent by Rahul  Chauhan', NULL, 232, 'Rahul  Chauhan', 230, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 12:10:13', '2024-04-12 12:10:13'),
(11, 1, 'SpUserLeaves', 'Users Management', 'Handover request has been accepted', 'Leave Request has been accepted', 'Leave Request has been accepted by Abhishek Kumar Mishra on 12/04/2024 | 05:47 PM', NULL, 230, 'Abhishek Kumar Mishra', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 12:17:55', '2024-04-12 12:17:55'),
(12, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 12:38:41', '2024-04-12 12:38:41'),
(13, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 13:04:47', '2024-04-12 13:04:47'),
(14, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by DEMO  NAME.', NULL, 13, 'DEMO  NAME', 206, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 13:47:00', '2024-04-12 13:47:00'),
(15, 227, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 227, 1, 'tgkjfn  jbkfhbk', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-12 23:57:07', '2024-04-12 23:57:07'),
(16, 233, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-13 00:01:38', '2024-04-13 00:01:38'),
(17, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-14 05:43:26', '2024-04-14 05:43:26'),
(18, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-14 05:45:47', '2024-04-14 05:45:47'),
(19, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-14 05:50:48', '2024-04-14 05:50:48'),
(20, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 14, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-14 06:06:06', '2024-04-14 06:06:06'),
(21, 233, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 04:53:44', '2024-04-15 04:53:44'),
(22, 233, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 04:54:18', '2024-04-15 04:54:18'),
(23, 233, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 06:46:59', '2024-04-15 06:46:59'),
(24, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 06:49:57', '2024-04-15 06:49:57'),
(25, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by PLAY  STORE.', NULL, 16, 'play  Store', 64, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 10:55:58', '2024-04-15 10:55:58'),
(26, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by PLAY  STORE.', NULL, 17, 'play  Store', 64, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 11:36:22', '2024-04-15 11:36:22'),
(27, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by PLAY  STORE.', NULL, 18, 'play  Store', 64, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 11:53:26', '2024-04-15 11:53:26'),
(28, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by PLAY  STORE.', NULL, 19, 'play  Store', 64, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-15 11:56:33', '2024-04-15 11:56:33'),
(29, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-16 05:12:40', '2024-04-16 05:12:40'),
(30, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by PLAY  STORE.', NULL, 20, 'play  Store', 64, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-16 06:29:46', '2024-04-16 06:29:46'),
(31, 64, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-16 06:43:47', '2024-04-16 06:43:47'),
(32, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-16 07:58:28', '2024-04-16 07:58:28'),
(33, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 05:24:44', '2024-04-18 05:24:44'),
(34, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 05:32:30', '2024-04-18 05:32:30'),
(35, 64, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 64, 1, 'play  Store', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 11:27:12', '2024-04-18 11:27:12'),
(36, 217, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 217, 1, 'dfr  fhbbfhg', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 11:40:04', '2024-04-18 11:40:04'),
(37, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 11:44:24', '2024-04-18 11:44:24'),
(38, 236, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 236, 1, 'rakjdsrkjs  frdbjk', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:15:28', '2024-04-18 12:15:28'),
(39, 236, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 236, 1, 'rakjdsrkjs  frdbjk', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:17:06', '2024-04-18 12:17:06'),
(40, 234, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:28:34', '2024-04-18 12:28:34'),
(41, 237, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:31:21', '2024-04-18 12:31:21'),
(42, 238, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:42:39', '2024-04-18 12:42:39'),
(43, 238, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 12:42:56', '2024-04-18 12:42:56'),
(44, 64, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 13:42:29', '2024-04-18 13:42:29'),
(45, 64, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 13:42:52', '2024-04-18 13:42:52'),
(46, 238, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-18 17:44:27', '2024-04-18 17:44:27'),
(130, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:14', '2024-04-19 11:06:14'),
(131, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:14', '2024-04-19 11:06:14'),
(132, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:14', '2024-04-19 11:06:14'),
(133, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:14', '2024-04-19 11:06:14'),
(134, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(135, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(136, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(137, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(138, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(139, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(140, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(141, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(142, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(143, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(144, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(145, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(146, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(147, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-19 11:06:30', '2024-04-19 11:06:30'),
(148, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:43', '2024-04-19 11:06:43'),
(149, 17, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:43', '2024-04-19 11:06:43'),
(150, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-19 11:06:43', '2024-04-19 11:06:43'),
(151, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 01:30:02', '2024-04-20 01:30:02'),
(152, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 01:30:02', '2024-04-20 01:30:02'),
(153, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:02', '2024-04-20 01:30:02'),
(154, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(155, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(156, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(157, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(158, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(159, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(160, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(161, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(162, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:03', '2024-04-20 01:30:03'),
(163, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 01:30:04', '2024-04-20 01:30:04'),
(164, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 01:30:04', '2024-04-20 01:30:04'),
(165, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 01:30:04', '2024-04-20 01:30:04'),
(166, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 02:30:02', '2024-04-20 02:30:02'),
(167, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 02:30:03', '2024-04-20 02:30:03'),
(168, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 02:30:03', '2024-04-20 02:30:03'),
(169, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:28', '2024-04-20 05:33:28'),
(170, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:28', '2024-04-20 05:33:28'),
(171, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:28', '2024-04-20 05:33:28'),
(172, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:28', '2024-04-20 05:33:28'),
(173, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 05:33:38', '2024-04-20 05:33:38'),
(174, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 05:33:39', '2024-04-20 05:33:39'),
(175, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:39', '2024-04-20 05:33:39'),
(176, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:39', '2024-04-20 05:33:39'),
(177, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 05:33:40', '2024-04-20 05:33:40'),
(178, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 05:33:40', '2024-04-20 05:33:40'),
(179, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:40', '2024-04-20 05:33:40'),
(180, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:40', '2024-04-20 05:33:40'),
(181, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 05:33:41', '2024-04-20 05:33:41'),
(182, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:41', '2024-04-20 05:33:41'),
(183, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 05:33:41', '2024-04-20 05:33:41'),
(184, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:42', '2024-04-20 05:33:42'),
(185, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:33:43', '2024-04-20 05:33:43'),
(186, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 05:33:43', '2024-04-20 05:33:43'),
(187, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 05:33:43', '2024-04-20 05:33:43'),
(188, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:52', '2024-04-20 05:33:52'),
(189, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:52', '2024-04-20 05:33:52'),
(190, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:33:52', '2024-04-20 05:33:52'),
(191, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:35:07', '2024-04-20 05:35:07'),
(192, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:35:07', '2024-04-20 05:35:07'),
(193, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:35:07', '2024-04-20 05:35:07'),
(194, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:35:07', '2024-04-20 05:35:07'),
(195, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 05:35:32', '2024-04-20 05:35:32'),
(196, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 05:35:33', '2024-04-20 05:35:33'),
(197, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:33', '2024-04-20 05:35:33'),
(198, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:33', '2024-04-20 05:35:33'),
(199, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 05:35:33', '2024-04-20 05:35:33'),
(200, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 05:35:34', '2024-04-20 05:35:34'),
(201, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:34', '2024-04-20 05:35:34'),
(202, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:34', '2024-04-20 05:35:34'),
(203, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 05:35:35', '2024-04-20 05:35:35'),
(204, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:35', '2024-04-20 05:35:35'),
(205, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 05:35:35', '2024-04-20 05:35:35'),
(206, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:36', '2024-04-20 05:35:36'),
(207, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:35:36', '2024-04-20 05:35:36'),
(208, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 05:35:36', '2024-04-20 05:35:36'),
(209, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 05:35:36', '2024-04-20 05:35:36'),
(210, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:05', '2024-04-20 05:36:05'),
(211, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:05', '2024-04-20 05:36:05'),
(212, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:05', '2024-04-20 05:36:05'),
(213, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:33', '2024-04-20 05:36:33'),
(214, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:33', '2024-04-20 05:36:33'),
(215, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:36:33', '2024-04-20 05:36:33'),
(216, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:39:33', '2024-04-20 05:39:33'),
(217, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:39:34', '2024-04-20 05:39:34'),
(218, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:39:34', '2024-04-20 05:39:34'),
(219, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:41:30', '2024-04-20 05:41:30'),
(220, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:41:30', '2024-04-20 05:41:30'),
(221, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:41:30', '2024-04-20 05:41:30'),
(222, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 05:41:57', '2024-04-20 05:41:57'),
(223, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 05:41:57', '2024-04-20 05:41:57'),
(224, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:41:57', '2024-04-20 05:41:57'),
(225, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:41:58', '2024-04-20 05:41:58'),
(226, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 05:41:58', '2024-04-20 05:41:58'),
(227, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 05:41:58', '2024-04-20 05:41:58'),
(228, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:41:59', '2024-04-20 05:41:59'),
(229, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:41:59', '2024-04-20 05:41:59'),
(230, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 05:41:59', '2024-04-20 05:41:59'),
(231, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:41:59', '2024-04-20 05:41:59'),
(232, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 05:42:00', '2024-04-20 05:42:00'),
(233, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:42:00', '2024-04-20 05:42:00'),
(234, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:42:01', '2024-04-20 05:42:01'),
(235, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 05:42:01', '2024-04-20 05:42:01'),
(236, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 05:42:01', '2024-04-20 05:42:01'),
(237, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:05', '2024-04-20 05:43:05'),
(238, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:05', '2024-04-20 05:43:05'),
(239, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:05', '2024-04-20 05:43:05'),
(240, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:05', '2024-04-20 05:43:05'),
(241, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:26', '2024-04-20 05:43:26'),
(242, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:26', '2024-04-20 05:43:26'),
(243, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:26', '2024-04-20 05:43:26'),
(244, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:43:26', '2024-04-20 05:43:26'),
(245, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:46:52', '2024-04-20 05:46:52'),
(246, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:47:30', '2024-04-20 05:47:30'),
(247, 232, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:47:30', '2024-04-20 05:47:30'),
(248, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:47:30', '2024-04-20 05:47:30'),
(249, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:47:30', '2024-04-20 05:47:30'),
(250, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:47:30', '2024-04-20 05:47:30');
INSERT INTO `sp_notifications` (`id`, `row_id`, `model_name`, `module`, `sub_module`, `heading`, `activity`, `activity_image`, `from_user_id`, `from_user_name`, `to_user_id`, `to_user_type`, `to_user_name`, `icon`, `platform`, `platform_icon`, `read_status`, `notification_type`, `redirect_date`, `iso_type`, `created_at`, `updated_at`) VALUES
(251, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:48:11', '2024-04-20 05:48:11'),
(252, 232, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:48:12', '2024-04-20 05:48:12'),
(253, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:48:12', '2024-04-20 05:48:12'),
(254, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:48:12', '2024-04-20 05:48:12'),
(255, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:48:12', '2024-04-20 05:48:12'),
(256, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 05:53:16', '2024-04-20 05:53:16'),
(257, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 05:53:16', '2024-04-20 05:53:16'),
(258, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:16', '2024-04-20 05:53:16'),
(259, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:16', '2024-04-20 05:53:16'),
(260, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 05:53:17', '2024-04-20 05:53:17'),
(261, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 05:53:17', '2024-04-20 05:53:17'),
(262, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:17', '2024-04-20 05:53:17'),
(263, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:17', '2024-04-20 05:53:17'),
(264, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 05:53:18', '2024-04-20 05:53:18'),
(265, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:18', '2024-04-20 05:53:18'),
(266, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 05:53:18', '2024-04-20 05:53:18'),
(267, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:19', '2024-04-20 05:53:19'),
(268, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:53:19', '2024-04-20 05:53:19'),
(269, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 05:53:19', '2024-04-20 05:53:19'),
(270, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 05:53:19', '2024-04-20 05:53:19'),
(271, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:10', '2024-04-20 05:54:10'),
(272, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:11', '2024-04-20 05:54:11'),
(273, 10, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with zshz on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:11', '2024-04-20 05:54:11'),
(274, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:30', '2024-04-20 05:54:30'),
(275, 232, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:30', '2024-04-20 05:54:30'),
(276, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:30', '2024-04-20 05:54:30'),
(277, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:30', '2024-04-20 05:54:30'),
(278, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 05:54:30', '2024-04-20 05:54:30'),
(279, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-20 05:55:03', '2024-04-20 05:55:03'),
(280, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-20 05:55:03', '2024-04-20 05:55:03'),
(281, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:04', '2024-04-20 05:55:04'),
(282, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:04', '2024-04-20 05:55:04'),
(283, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 20/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 0, '2024-04-20 05:55:04', '2024-04-20 05:55:04'),
(284, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-20 05:55:04', '2024-04-20 05:55:04'),
(285, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:05', '2024-04-20 05:55:05'),
(286, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:05', '2024-04-20 05:55:05'),
(287, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-20 05:55:05', '2024-04-20 05:55:05'),
(288, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:05', '2024-04-20 05:55:05'),
(289, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-20 05:55:06', '2024-04-20 05:55:06'),
(290, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:06', '2024-04-20 05:55:06'),
(291, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-20 05:55:07', '2024-04-20 05:55:07'),
(292, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-20 05:55:07', '2024-04-20 05:55:07'),
(293, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 20/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-20', 1, '2024-04-20 05:55:07', '2024-04-20 05:55:07'),
(294, 238, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 07:41:44', '2024-04-20 07:41:44'),
(295, 238, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 09:44:32', '2024-04-20 09:44:32'),
(296, 233, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 09:45:14', '2024-04-20 09:45:14'),
(297, 3, 'SpUserRegularization', 'User Management', 'Regularization request forwarded', 'Regularization request forwarded', 'A Regularization request(test  employee -  HR Manager) has been forwarded  by Sort String Solution. test', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 09:48:50', '2024-04-20 09:48:50'),
(298, 3, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(test  employee -  HR Manager) has been approved  by Sort String Solution. Approved', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(299, 2, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(DEMO  NAME - C.E.O) has been approved  by Sort String Solution. dfkdcjhaiouwerdlx', NULL, 1, 'Sort String Solution', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:07:47', '2024-04-20 12:07:47'),
(300, 2, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(DEMO  NAME - C.E.O) has been approved  by Sort String Solution. dfjxhcjgarsd', NULL, 1, 'Sort String Solution', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:08:19', '2024-04-20 12:08:19'),
(301, 1, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(Rahul  Chauhan - Sales Executive) has been approved  by Sort String Solution. nfgxdkjlx', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(302, 2, 'SpUserRegularization', 'User Management', 'Regularization request declined', 'Regularization request declined', 'A Regularization request(DEMO  NAME - C.E.O) has been declined  by Sort String Solution. sknfdzsdl', NULL, 1, 'Sort String Solution', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:27:53', '2024-04-20 12:27:53'),
(303, 3, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(test  employee -  HR Manager) has been approved  by Sort String Solution. sjgndfkslm', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(304, 1, 'SpUserRegularization', 'User Management', 'Regularization request declined', 'Regularization request declined', 'A Regularization request(Rahul  Chauhan - Sales Executive) has been declined  by Sort String Solution. skzdglfcmx,', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:28:10', '2024-04-20 12:28:10'),
(305, 4, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(test  employee -  HR Manager) has been approved  by Sort String Solution. brsidhyf8xo', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(306, 5, 'SpUserRegularization', 'User Management', 'Regularization request declined', 'Regularization request declined', 'A Regularization request(test  employee -  HR Manager) has been declined  by Sort String Solution. iygefy8wd', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 12:31:13', '2024-04-20 12:31:13'),
(307, 8, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(Rahul  Chauhan - Sales Executive) has been approved  by Sort String Solution. bjdfjyfgxuytr', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(308, 238, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 13:55:50', '2024-04-20 13:55:50'),
(309, 237, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 13:57:58', '2024-04-20 13:57:58'),
(310, 240, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 240, 1, 'Test  User', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 15:29:13', '2024-04-20 15:29:13'),
(311, 244, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 244, 1, 'vjgrjil  JGJGSR', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 15:54:48', '2024-04-20 15:54:48'),
(312, 246, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 246, 1, 'Test  Third', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 16:03:42', '2024-04-20 16:03:42'),
(313, 246, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 246, 1, 'Test  Third', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 16:06:24', '2024-04-20 16:06:24'),
(314, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 16:09:22', '2024-04-20 16:09:22'),
(315, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-20 16:09:36', '2024-04-20 16:09:36'),
(316, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(317, 232, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 21/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(318, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(319, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(320, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(321, 247, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 00:30:06', '2024-04-21 00:30:06'),
(322, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-21 01:30:02', '2024-04-21 01:30:02'),
(323, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-21 01:30:02', '2024-04-21 01:30:02'),
(324, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:03', '2024-04-21 01:30:03'),
(325, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:03', '2024-04-21 01:30:03'),
(326, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-21 01:30:03', '2024-04-21 01:30:03'),
(327, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-21 01:30:03', '2024-04-21 01:30:03'),
(328, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:04', '2024-04-21 01:30:04'),
(329, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:04', '2024-04-21 01:30:04'),
(330, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-21 01:30:04', '2024-04-21 01:30:04'),
(331, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:04', '2024-04-21 01:30:04'),
(332, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-21 01:30:05', '2024-04-21 01:30:05'),
(333, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:05', '2024-04-21 01:30:05'),
(334, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-21 01:30:06', '2024-04-21 01:30:06'),
(335, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-21 01:30:06', '2024-04-21 01:30:06'),
(336, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 14001 is due on 22/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-22', 2, '2024-04-21 01:30:06', '2024-04-21 01:30:06'),
(337, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 02:30:02', '2024-04-21 02:30:02'),
(338, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 02:30:03', '2024-04-21 02:30:03'),
(339, 237, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-21 11:14:29', '2024-04-21 11:14:29'),
(340, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-22 01:30:02', '2024-04-22 01:30:02'),
(341, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-22 01:30:02', '2024-04-22 01:30:02'),
(342, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-22 01:30:04', '2024-04-22 01:30:04'),
(343, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-22 01:30:05', '2024-04-22 01:30:05'),
(344, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-22 01:30:05', '2024-04-22 01:30:05'),
(345, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-22 01:30:05', '2024-04-22 01:30:05'),
(346, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 14001 is due on 22/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-22', 2, '2024-04-22 01:30:05', '2024-04-22 01:30:05'),
(347, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 02:30:02', '2024-04-22 02:30:02'),
(348, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 02:30:03', '2024-04-22 02:30:03'),
(349, 246, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 246, 1, 'Test  Third', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 03:54:52', '2024-04-22 03:54:52'),
(350, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 04:36:12', '2024-04-22 04:36:12'),
(351, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 04:36:13', '2024-04-22 04:36:13'),
(352, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 05:46:04', '2024-04-22 05:46:04'),
(353, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 21, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:52:53', '2024-04-22 06:52:53'),
(354, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:41', '2024-04-22 06:54:41'),
(355, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:41', '2024-04-22 06:54:41'),
(356, 21, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 26/04/2024 for (TTRACK21).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:41', '2024-04-22 06:54:41'),
(357, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:57', '2024-04-22 06:54:57'),
(358, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:57', '2024-04-22 06:54:57'),
(359, 21, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 26/04/2024 for (TTRACK21).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 06:54:57', '2024-04-22 06:54:57'),
(360, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 07:05:46', '2024-04-22 07:05:46'),
(361, 6, 'SpUserRegularization', 'User Management', 'Regularization request approved', 'Regularization request approved', 'A Regularization request(test  employee -  HR Manager) has been approved  by Sort String Solution. fiwfhoiew', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 07:12:48', '2024-04-22 07:12:48'),
(362, 7, 'SpUserRegularization', 'User Management', 'Regularization request declined', 'Regularization request declined', 'A Regularization request(test  employee -  HR Manager) has been declined  by Sort String Solution. sfnef\n', NULL, 1, 'Sort String Solution', 233, 1, 'test  employee', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 07:12:58', '2024-04-22 07:12:58'),
(363, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 07:14:44', '2024-04-22 07:14:44'),
(364, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 11:40:52', '2024-04-22 11:40:52'),
(365, 19, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Abhishek Mishra  on 23/04/2024 for (TTRACK19).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 11:40:53', '2024-04-22 11:40:53'),
(366, 21, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 26/04/2024 for (TTRACK21).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-22 11:40:53', '2024-04-22 11:40:53'),
(367, 64, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 23/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(368, 232, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 23/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(369, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(370, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(371, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(372, 247, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 24/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 00:30:03', '2024-04-23 00:30:03'),
(373, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-23 01:30:03', '2024-04-23 01:30:03'),
(374, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-23 01:30:03', '2024-04-23 01:30:03'),
(375, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:04', '2024-04-23 01:30:04'),
(376, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:04', '2024-04-23 01:30:04'),
(377, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-23 01:30:04', '2024-04-23 01:30:04'),
(378, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-23 01:30:05', '2024-04-23 01:30:05'),
(379, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:05', '2024-04-23 01:30:05'),
(380, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:06', '2024-04-23 01:30:06'),
(381, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-23 01:30:06', '2024-04-23 01:30:06'),
(382, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:07', '2024-04-23 01:30:07'),
(383, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 24/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 0, '2024-04-23 01:30:07', '2024-04-23 01:30:07'),
(384, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:08', '2024-04-23 01:30:08'),
(385, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-23 01:30:08', '2024-04-23 01:30:08'),
(386, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 17025 is due on 24/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-24', 1, '2024-04-23 01:30:08', '2024-04-23 01:30:08'),
(387, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 02:30:05', '2024-04-23 02:30:05'),
(388, 21, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 26/04/2024 for (TTRACK21).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 02:30:05', '2024-04-23 02:30:05'),
(389, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 06:56:09', '2024-04-23 06:56:09'),
(390, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 06:59:16', '2024-04-23 06:59:16'),
(391, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-23 07:10:18', '2024-04-23 07:10:18'),
(392, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 00:30:05', '2024-04-25 00:30:05'),
(393, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Visa will expire on 26/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 00:30:05', '2024-04-25 00:30:05'),
(394, 238, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Qatar id will expire on 25/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 238, 1, 'jdrfkijrejk  bvhjsdoiuj', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 00:30:05', '2024-04-25 00:30:05'),
(395, 247, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 27/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 00:30:05', '2024-04-25 00:30:05'),
(396, 9, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 26/04/2024 for (TTRACK9).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 2, '2024-04-25 01:30:02', '2024-04-25 01:30:02'),
(397, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 25/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-25', 0, '2024-04-25 01:30:02', '2024-04-25 01:30:02'),
(398, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:03', '2024-04-25 01:30:03'),
(399, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:03', '2024-04-25 01:30:03'),
(400, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-25 01:30:04', '2024-04-25 01:30:04'),
(401, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 26/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-26', 0, '2024-04-25 01:30:04', '2024-04-25 01:30:04'),
(402, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:05', '2024-04-25 01:30:05'),
(403, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:05', '2024-04-25 01:30:05'),
(404, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-25 01:30:06', '2024-04-25 01:30:06'),
(405, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:07', '2024-04-25 01:30:07'),
(406, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 1, '2024-04-25 01:30:07', '2024-04-25 01:30:07'),
(407, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:08', '2024-04-25 01:30:08'),
(408, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-25 01:30:08', '2024-04-25 01:30:08'),
(409, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 17025 is due on 30/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 2, '2024-04-25 01:30:08', '2024-04-25 01:30:08'),
(410, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 02:30:02', '2024-04-25 02:30:02'),
(411, 231, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 231, 1, 'Rishabh  Singh', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-25 10:59:47', '2024-04-25 10:59:47');
INSERT INTO `sp_notifications` (`id`, `row_id`, `model_name`, `module`, `sub_module`, `heading`, `activity`, `activity_image`, `from_user_id`, `from_user_name`, `to_user_id`, `to_user_type`, `to_user_name`, `icon`, `platform`, `platform_icon`, `read_status`, `notification_type`, `redirect_date`, `iso_type`, `created_at`, `updated_at`) VALUES
(412, 232, 'SpUsers', 'User Management', 'Password reset', 'Password reset', 'You password has been changed by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'password.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-26 04:20:13', '2024-04-26 04:20:13'),
(413, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-27 00:30:05', '2024-04-27 00:30:05'),
(414, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-27 00:30:05', '2024-04-27 00:30:05'),
(415, 247, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 27/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-27 00:30:05', '2024-04-27 00:30:05'),
(416, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-27 01:30:06', '2024-04-27 01:30:06'),
(417, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:06', '2024-04-27 01:30:06'),
(418, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:06', '2024-04-27 01:30:06'),
(419, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-27 01:30:07', '2024-04-27 01:30:07'),
(420, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-27 01:30:07', '2024-04-27 01:30:07'),
(421, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:07', '2024-04-27 01:30:07'),
(422, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 39001 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:08', '2024-04-27 01:30:08'),
(423, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-27 01:30:08', '2024-04-27 01:30:08'),
(424, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22301 is due on 27/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:08', '2024-04-27 01:30:08'),
(425, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 1, '2024-04-27 01:30:09', '2024-04-27 01:30:09'),
(426, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:09', '2024-04-27 01:30:09'),
(427, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 45001 is due on 27/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-27', 0, '2024-04-27 01:30:10', '2024-04-27 01:30:10'),
(428, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 17025 is due on 30/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 2, '2024-04-27 01:30:10', '2024-04-27 01:30:10'),
(429, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-27 02:30:05', '2024-04-27 02:30:05'),
(430, 234, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 234, 1, 'test  user', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-29 00:30:05', '2024-04-29 00:30:05'),
(431, 237, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Passport id will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 237, 1, 'dfjhsgkcix  fgkjdfsdl', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-29 00:30:05', '2024-04-29 00:30:05'),
(432, 247, 'SpUsers', 'User Management', 'Document Renewal alert!', 'Document Renewal alert!', 'Your Resume will expire on 30/04/2024. Kindly do the needful.', NULL, 1, 'Admin', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-29 00:30:05', '2024-04-29 00:30:05'),
(433, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK15).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-29 01:30:03', '2024-04-29 01:30:03'),
(434, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 9001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-29 01:30:03', '2024-04-29 01:30:03'),
(435, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-29 01:30:04', '2024-04-29 01:30:04'),
(436, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 39001 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-29 01:30:04', '2024-04-29 01:30:04'),
(437, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 18788 is due on 30/04/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 0, '2024-04-29 01:30:04', '2024-04-29 01:30:04'),
(438, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 22000 is due on 30/04/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 1, '2024-04-29 01:30:05', '2024-04-29 01:30:05'),
(439, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-04-29 01:30:05', '2024-04-29 01:30:05'),
(440, 10, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 17025 is due on 30/04/2024 for (TTRACK10).', NULL, 1, 'Admin', 216, 1, 'DD  VGFDG', 'profile.png', '2', 'app.png', 1, 1, '2024-04-30', 2, '2024-04-29 01:30:05', '2024-04-29 01:30:05'),
(441, 14, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Mr Ritesh Pandit on 30/04/2024 for (TTRACK14).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-29 02:30:03', '2024-04-29 02:30:03'),
(442, 232, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-30 06:28:59', '2024-04-30 06:28:59'),
(443, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 22, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-04-30 08:11:48', '2024-04-30 08:11:48'),
(444, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-01 01:30:02', '2024-05-01 01:30:02'),
(445, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-01 01:30:03', '2024-05-01 01:30:03'),
(446, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-01 02:30:02', '2024-05-01 02:30:02'),
(447, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 23/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-03 01:30:02', '2024-05-03 01:30:02'),
(448, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-03 01:30:03', '2024-05-03 01:30:03'),
(449, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-03 01:30:03', '2024-05-03 01:30:03'),
(450, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-03 01:30:04', '2024-05-03 01:30:04'),
(451, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 23/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-03 01:30:04', '2024-05-03 01:30:04'),
(452, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 23/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 2, '2024-05-03 01:30:05', '2024-05-03 01:30:05'),
(453, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-03 01:30:05', '2024-05-03 01:30:05'),
(454, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-03 02:30:05', '2024-05-03 02:30:05'),
(455, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 23/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-05 01:30:02', '2024-05-05 01:30:02'),
(456, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-05 01:30:03', '2024-05-05 01:30:03'),
(457, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-05 01:30:03', '2024-05-05 01:30:03'),
(458, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-05 01:30:04', '2024-05-05 01:30:04'),
(459, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 23/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-05 01:30:04', '2024-05-05 01:30:04'),
(460, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 23/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 2, '2024-05-05 01:30:05', '2024-05-05 01:30:05'),
(461, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-05 01:30:05', '2024-05-05 01:30:05'),
(462, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-05 02:30:02', '2024-05-05 02:30:02'),
(463, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-06 06:50:13', '2024-05-06 06:50:13'),
(464, 246, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 246, 1, 'Test  Third', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-06 06:50:31', '2024-05-06 06:50:31'),
(465, NULL, NULL, 'Lead Management', 'Lead Management', 'New Lead', 'New Lead has been created by RAHUL  CHAUHAN.', NULL, 23, 'Rahul  Chauhan', 232, 1, '', 'userTag.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-06 07:01:15', '2024-05-06 07:01:15'),
(466, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 23/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-07 01:30:04', '2024-05-07 01:30:04'),
(467, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-07 01:30:05', '2024-05-07 01:30:05'),
(468, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-07 01:30:05', '2024-05-07 01:30:05'),
(469, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-07 01:30:06', '2024-05-07 01:30:06'),
(470, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 23/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-07 01:30:06', '2024-05-07 01:30:06'),
(471, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 23/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 2, '2024-05-07 01:30:06', '2024-05-07 01:30:06'),
(472, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-07 01:30:07', '2024-05-07 01:30:07'),
(473, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-07 02:30:05', '2024-05-07 02:30:05'),
(474, 23, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh on 07/05/2024 for (TTRACK23).', NULL, 1, 'Admin', 232, 1, 'Rahul  Chauhan', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-07 02:30:05', '2024-05-07 02:30:05'),
(475, 231, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 231, 1, 'Rishabh  Singh', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-08 07:46:24', '2024-05-08 07:46:24'),
(476, 247, 'SpUsers', 'User Management', 'Profile updated', 'Profile updated', 'Your profile has been updated by Sort String Solution', NULL, 1, 'Sort String Solution', 247, 1, 'Test  Four', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-08 07:46:48', '2024-05-08 07:46:48'),
(477, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 23/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-09 01:30:02', '2024-05-09 01:30:02'),
(478, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-09 01:30:02', '2024-05-09 01:30:02'),
(479, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-09 01:30:03', '2024-05-09 01:30:03'),
(480, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-09 01:30:03', '2024-05-09 01:30:03'),
(481, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 23/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-09 01:30:03', '2024-05-09 01:30:03'),
(482, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 23/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 2, '2024-05-09 01:30:04', '2024-05-09 01:30:04'),
(483, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 22000 is due on 29/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-29', 2, '2024-05-09 01:30:04', '2024-05-09 01:30:04'),
(484, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-09 01:30:05', '2024-05-09 01:30:05'),
(485, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-09 02:30:02', '2024-05-09 02:30:02'),
(486, 14, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 9001 is due on 31/05/2024 for (TTRACK14).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 0, '2024-05-11 01:30:02', '2024-05-11 01:30:02'),
(487, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 14001 is due on 23/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-11 01:30:02', '2024-05-11 01:30:02'),
(488, 15, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 31/05/2024 for (TTRACK15).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 2, '2024-05-11 01:30:02', '2024-05-11 01:30:02'),
(489, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 1 of ISO - 22000 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 0, '2024-05-11 01:30:03', '2024-05-11 01:30:03'),
(490, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 23/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-11 01:30:03', '2024-05-11 01:30:03'),
(491, 16, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 31/05/2024 for (TTRACK16).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 1, '2024-05-11 01:30:04', '2024-05-11 01:30:04'),
(492, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 18/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-18', 2, '2024-05-11 01:30:04', '2024-05-11 01:30:04'),
(493, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 45001 is due on 31/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 2, '2024-05-11 01:30:04', '2024-05-11 01:30:04'),
(494, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 14001 is due on 23/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 1, '2024-05-11 01:30:05', '2024-05-11 01:30:05'),
(495, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 39001 is due on 31/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 2, '2024-05-11 01:30:05', '2024-05-11 01:30:05'),
(496, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 18788 is due on 31/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 1, '2024-05-11 01:30:05', '2024-05-11 01:30:05'),
(497, 17, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 22301 is due on 31/05/2024 for (TTRACK17).', NULL, 1, 'Admin', 64, 1, 'play  Store', 'profile.png', '2', 'app.png', 1, 1, '2024-05-31', 1, '2024-05-11 01:30:06', '2024-05-11 01:30:06'),
(498, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 9001 is due on 23/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-23', 2, '2024-05-11 01:30:06', '2024-05-11 01:30:06'),
(499, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Expiry of ISO - 22000 is due on 29/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-29', 2, '2024-05-11 01:30:07', '2024-05-11 01:30:07'),
(500, 18, 'Lead Management', 'Lead Management', 'Renewal alert!', 'ISO Renewal alert!', 'Surveillance 2 of ISO - 45001 is due on 16/05/2024 for (TTRACK18).', NULL, 1, 'Admin', 206, 1, 'DEMO  NAME', 'profile.png', '2', 'app.png', 1, 1, '2024-05-16', 1, '2024-05-11 01:30:07', '2024-05-11 01:30:07'),
(501, 22, 'Lead Management', 'Lead Management', 'Lead Follow-up reminder!', 'Lead Follow-up reminder!', 'You have a scheduled follow-up meeting with Rishabh  on 15/05/2024 for (TTRACK22).', NULL, 1, 'Admin', 224, 1, 'Abhishek Kumar Mishra', 'profile.png', '2', 'app.png', 1, 1, NULL, NULL, '2024-05-11 02:30:02', '2024-05-11 02:30:02');

-- --------------------------------------------------------

--
-- Table structure for table `sp_odo_meter`
--

CREATE TABLE `sp_odo_meter` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `odo_meter_pic` varchar(150) DEFAULT NULL,
  `odo_meter_reading` int(11) NOT NULL,
  `fuel_quantity_ltrs` double NOT NULL,
  `fuel_status` varchar(20) NOT NULL,
  `card_no` varchar(50) NOT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `date_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_organizations`
--

CREATE TABLE `sp_organizations` (
  `id` int(11) NOT NULL,
  `organization_code` varchar(22) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `alias` varchar(100) DEFAULT NULL,
  `landline_country_code` varchar(10) NOT NULL,
  `landline_state_code` varchar(10) NOT NULL,
  `landline_number` varchar(15) NOT NULL,
  `mobile_country_code` varchar(10) NOT NULL,
  `mobile_number` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `address` text,
  `pincode` varchar(8) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_organizations`
--

INSERT INTO `sp_organizations` (`id`, `organization_code`, `organization_name`, `alias`, `landline_country_code`, `landline_state_code`, `landline_number`, `mobile_country_code`, `mobile_number`, `email`, `address`, `pincode`, `status`, `created_at`, `updated_at`) VALUES
(3, '001', '\nEmobic Pvt Ltd', NULL, '+91', '522', '0000000000', '+91', '9999999999', 'demo895689@gmail.com', 'emobic', '203001', 0, '2023-09-12 11:49:14', '2024-03-31 10:51:28'),
(4, '', 'EMobility Infra and Consulting Pty Ltd', NULL, '+61', '45', '0280071', '+91', '8800990802', 'otp.ritp@gmail.com', '1 Elstone Court\nUNIT 1', '3042', 1, '2024-05-01 13:44:26', '2024-05-01 13:44:26');

-- --------------------------------------------------------

--
-- Table structure for table `sp_password_resets`
--

CREATE TABLE `sp_password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `auth_token` varchar(100) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `otp` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_password_resets`
--

INSERT INTO `sp_password_resets` (`id`, `email`, `auth_token`, `mobile`, `otp`, `created_at`) VALUES
(3, 'admin@gmail.com', 'a7aeee93-635a-44aa-a15c-322ec160d4f1', NULL, NULL, '2021-11-15 03:57:13'),
(4, 'palak2n97@gmail.com', 'f8506d90-8df3-4891-8d0a-24b2bfa4ee9b', NULL, NULL, '2022-09-06 13:06:32'),
(11, 'raja@gmail.com', '1d2bddda-da68-47f0-b325-5e8a601db0e5', NULL, NULL, '2024-04-04 06:40:49'),
(12, 'pp@gmail.com', '78ace3d0-cc0b-4c0b-b82b-809e796d1528', NULL, NULL, '2024-04-04 06:42:13'),
(15, 'raja1999chaudhary@gmail.com', '9f7f8eda-19ec-4999-87e4-76f98fea0a41', NULL, NULL, '2024-04-04 06:53:37'),
(16, 'abhimishrait@gmail.com', '36c44729-cb6a-4c42-82d3-e5cff60ec563', NULL, NULL, '2024-04-04 10:06:54');

-- --------------------------------------------------------

--
-- Table structure for table `sp_payroll_master`
--

CREATE TABLE `sp_payroll_master` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `emp_ctc` float(10,2) NOT NULL,
  `apipercent` float(10,2) NOT NULL DEFAULT '0.00',
  `employeehrap` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_pli` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_pli_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_basic` float(10,2) NOT NULL,
  `employee_basic_mt` float(10,2) NOT NULL,
  `employee_pf` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_pf_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_gratuity` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_gratuity_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_tfp` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_tfp_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_hra` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_hra_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_spcl` float(10,2) NOT NULL DEFAULT '0.00',
  `employee_spcl_mt` float(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_payroll_master`
--

INSERT INTO `sp_payroll_master` (`id`, `user_id`, `emp_ctc`, `apipercent`, `employeehrap`, `employee_pli`, `employee_pli_mt`, `employee_basic`, `employee_basic_mt`, `employee_pf`, `employee_pf_mt`, `employee_gratuity`, `employee_gratuity_mt`, `employee_tfp`, `employee_tfp_mt`, `employee_hra`, `employee_hra_mt`, `employee_spcl`, `employee_spcl_mt`, `created_at`, `updated_at`) VALUES
(1, 65, 375699.00, 0.00, 50.00, 0.00, 0.00, 150280.00, 12523.00, 21600.00, 1800.00, 7228.00, 602.00, 179108.00, 14926.00, 75140.00, 6262.00, 121451.00, 10121.00, '2022-11-15 07:32:29', '2022-11-15 07:32:29'),
(2, 154, 436374.00, 0.00, 40.00, 0.00, 0.00, 174550.00, 14546.00, 21600.00, 1800.00, 8396.00, 700.00, 204546.00, 17046.00, 69820.00, 5818.00, 144553.00, 12046.00, '2022-11-17 04:31:18', '2022-11-17 04:31:18'),
(3, 62, 1881600.00, 10.00, 50.00, 188160.00, 15680.00, 677376.00, 56448.00, 81285.00, 6774.00, 32582.00, 2715.00, 791243.00, 65937.00, 338688.00, 28224.00, 563509.00, 46959.00, '2022-11-17 04:42:41', '2022-11-17 04:42:41'),
(4, 73, 1206575.00, 5.00, 50.00, 60329.00, 5027.00, 458498.00, 38208.00, 55020.00, 4585.00, 22054.00, 1838.00, 535572.00, 44631.00, 229249.00, 19104.00, 381423.00, 31785.00, '2022-11-17 04:43:17', '2022-11-17 04:43:17'),
(5, 131, 315761.00, 0.00, 0.00, 0.00, 0.00, 126304.00, 10525.00, 21600.00, 1800.00, 6075.00, 506.00, 153979.00, 12832.00, 0.00, 0.00, 161782.00, 13482.00, '2022-11-17 04:43:53', '2022-11-17 04:43:53'),
(6, 132, 306328.00, 0.00, 0.00, 0.00, 0.00, 122531.00, 10211.00, 21600.00, 1800.00, 5894.00, 491.00, 150025.00, 12502.00, 0.00, 0.00, 156303.00, 13025.00, '2022-11-17 04:44:24', '2022-11-17 04:44:24'),
(7, 134, 330000.00, 0.00, 0.00, 0.00, 0.00, 132000.00, 11000.00, 21600.00, 1800.00, 6349.00, 529.00, 159949.00, 13329.00, 0.00, 0.00, 170051.00, 14171.00, '2022-11-17 04:44:59', '2022-11-17 04:44:59'),
(8, 85, 312001.00, 0.00, 0.00, 0.00, 0.00, 124800.00, 10400.00, 21600.00, 1800.00, 6003.00, 500.00, 152403.00, 12700.00, 0.00, 0.00, 159598.00, 13300.00, '2022-11-17 04:45:37', '2022-11-17 04:45:37'),
(9, 70, 660000.00, 5.00, 50.00, 33000.00, 2750.00, 250800.00, 20900.00, 30096.00, 2508.00, 12063.00, 1005.00, 292959.00, 24413.00, 125400.00, 10450.00, 208641.00, 17387.00, '2022-11-17 04:46:08', '2022-11-17 04:46:08'),
(10, 91, 436374.00, 0.00, 50.00, 0.00, 0.00, 174550.00, 14546.00, 21600.00, 1800.00, 8396.00, 700.00, 204546.00, 17046.00, 87275.00, 7273.00, 144553.00, 12046.00, '2022-11-17 04:46:48', '2022-11-17 04:46:48'),
(11, 80, 439040.00, 0.00, 50.00, 0.00, 0.00, 175616.00, 14635.00, 21600.00, 1800.00, 8447.00, 704.00, 205663.00, 17139.00, 87808.00, 7317.00, 145569.00, 12131.00, '2022-11-17 04:47:31', '2022-11-17 04:47:31'),
(12, 74, 542551.00, 5.00, 50.00, 27128.00, 2261.00, 206169.00, 17181.00, 24740.00, 2062.00, 9917.00, 826.00, 240826.00, 20069.00, 103085.00, 8590.00, 171512.00, 14293.00, '2022-11-17 04:49:55', '2022-11-17 04:49:55'),
(13, 88, 243590.00, 0.00, 0.00, 0.00, 0.00, 97436.00, 8120.00, 21600.00, 1800.00, 4687.00, 391.00, 123723.00, 10310.00, 0.00, 0.00, 119867.00, 9989.00, '2022-11-17 04:50:31', '2022-11-17 04:50:31'),
(14, 75, 392000.00, 0.00, 50.00, 0.00, 0.00, 156800.00, 13067.00, 21600.00, 1800.00, 7542.00, 629.00, 185942.00, 15495.00, 78400.00, 6533.00, 127658.00, 10638.00, '2022-11-17 04:51:12', '2022-11-17 04:51:12'),
(15, 139, 330000.00, 0.00, 0.00, 0.00, 0.00, 132000.00, 11000.00, 21600.00, 1800.00, 6349.00, 529.00, 159949.00, 13329.00, 0.00, 0.00, 170051.00, 14171.00, '2022-11-17 04:51:50', '2022-11-17 04:51:50'),
(16, 76, 718019.00, 5.00, 50.00, 35901.00, 2992.00, 272847.00, 22737.00, 32742.00, 2729.00, 13124.00, 1094.00, 318713.00, 26559.00, 136424.00, 11369.00, 226981.00, 18915.00, '2022-11-17 04:53:02', '2022-11-17 04:53:02'),
(17, 63, 501760.00, 5.00, 50.00, 25088.00, 2091.00, 190669.00, 15889.00, 22880.00, 1907.00, 9171.00, 764.00, 222720.00, 18560.00, 95335.00, 7945.00, 158617.00, 13218.00, '2022-11-17 04:57:46', '2022-11-17 04:57:46'),
(18, 89, 283360.00, 0.00, 50.00, 0.00, 0.00, 113344.00, 9445.00, 21600.00, 1800.00, 5452.00, 454.00, 140396.00, 11700.00, 56672.00, 4723.00, 86292.00, 7191.00, '2022-11-17 05:03:23', '2022-11-17 05:03:23'),
(19, 78, 653159.00, 5.00, 40.00, 32658.00, 2722.00, 248200.00, 20683.00, 29784.00, 2482.00, 11938.00, 995.00, 289922.00, 24160.00, 99280.00, 8273.00, 206479.00, 17207.00, '2022-11-17 06:55:37', '2022-11-17 06:55:37'),
(20, 92, 299482.00, 0.00, 50.00, 0.00, 0.00, 119793.00, 9983.00, 21600.00, 1800.00, 5762.00, 480.00, 147155.00, 12263.00, 59897.00, 4991.00, 92430.00, 7703.00, '2022-11-25 05:05:48', '2022-11-25 05:05:48'),
(21, 128, 270000.00, 0.00, 0.00, 0.00, 0.00, 108000.00, 9000.00, 21600.00, 1800.00, 5195.00, 433.00, 134795.00, 11233.00, 0.00, 0.00, 135205.00, 11267.00, '2022-11-25 05:07:28', '2022-11-25 05:07:28'),
(22, 141, 324000.00, 0.00, 0.00, 0.00, 0.00, 129600.00, 10800.00, 21600.00, 1800.00, 6234.00, 520.00, 157434.00, 13120.00, 0.00, 0.00, 166566.00, 13881.00, '2022-11-25 05:10:44', '2022-11-25 05:10:44'),
(23, 79, 392000.00, 0.00, 50.00, 0.00, 0.00, 156800.00, 13067.00, 21600.00, 1800.00, 7542.00, 629.00, 185942.00, 15495.00, 78400.00, 6533.00, 127658.00, 10638.00, '2022-11-25 05:12:22', '2022-11-25 05:12:22'),
(24, 143, 385000.00, 0.00, 50.00, 0.00, 0.00, 154000.00, 12833.00, 21600.00, 1800.00, 7407.00, 617.00, 183007.00, 15251.00, 77000.00, 6417.00, 124993.00, 10416.00, '2022-11-25 05:13:24', '2022-11-25 05:13:24'),
(25, 145, 336000.00, 0.00, 0.00, 0.00, 0.00, 134400.00, 11200.00, 21600.00, 1800.00, 6465.00, 539.00, 162465.00, 13539.00, 0.00, 0.00, 173535.00, 14461.00, '2022-11-25 05:16:27', '2022-11-25 05:16:27'),
(26, 93, 560000.00, 5.00, 50.00, 28000.00, 2333.00, 212800.00, 17733.00, 25536.00, 2128.00, 10236.00, 853.00, 248572.00, 20714.00, 106400.00, 8867.00, 177028.00, 14752.00, '2022-11-25 05:17:24', '2022-11-25 05:17:24'),
(27, 81, 439040.00, 0.00, 50.00, 0.00, 0.00, 175616.00, 14635.00, 21600.00, 1800.00, 8447.00, 704.00, 205663.00, 17139.00, 87808.00, 7317.00, 145569.00, 12131.00, '2022-11-25 05:21:18', '2022-11-25 05:21:18'),
(28, 151, 231563.00, 0.00, 0.00, 0.00, 0.00, 92625.00, 7719.00, 21600.00, 1800.00, 4455.00, 371.00, 118680.00, 9890.00, 0.00, 0.00, 112883.00, 9407.00, '2022-11-25 05:23:14', '2022-11-25 05:23:14'),
(29, 150, 280000.00, 0.00, 0.00, 0.00, 0.00, 112000.00, 9333.00, 21600.00, 1800.00, 5387.00, 449.00, 138987.00, 11582.00, 0.00, 0.00, 141013.00, 11751.00, '2022-11-25 05:23:55', '2022-11-25 05:23:55'),
(30, 149, 250000.00, 0.00, 0.00, 0.00, 0.00, 100000.00, 8333.00, 21600.00, 1800.00, 4810.00, 401.00, 126410.00, 10534.00, 0.00, 0.00, 123590.00, 10299.00, '2022-11-25 05:25:38', '2022-11-25 05:25:38'),
(31, 148, 231377.00, 0.00, 0.00, 0.00, 0.00, 92551.00, 7713.00, 21600.00, 1800.00, 4452.00, 371.00, 118603.00, 9884.00, 0.00, 0.00, 112774.00, 9398.00, '2022-11-25 05:26:23', '2022-11-25 05:26:23'),
(32, 100, 346968.00, 0.00, 50.00, 0.00, 0.00, 138787.00, 11566.00, 21600.00, 1800.00, 6676.00, 556.00, 167063.00, 13922.00, 69394.00, 5783.00, 110511.00, 9209.00, '2022-11-25 05:27:10', '2022-11-25 05:27:10'),
(33, 147, 270313.00, 0.00, 0.00, 0.00, 0.00, 108125.00, 9010.00, 21600.00, 1800.00, 5201.00, 433.00, 134926.00, 11244.00, 0.00, 0.00, 135387.00, 11282.00, '2022-11-25 05:27:51', '2022-11-25 05:27:51'),
(34, 146, 239208.00, 0.00, 0.00, 0.00, 0.00, 95683.00, 7974.00, 21600.00, 1800.00, 4602.00, 384.00, 121885.00, 10157.00, 0.00, 0.00, 117323.00, 9777.00, '2022-11-25 05:36:21', '2022-11-25 05:36:21'),
(35, 144, 270000.00, 0.00, 0.00, 0.00, 0.00, 108000.00, 9000.00, 21600.00, 1800.00, 5195.00, 433.00, 134795.00, 11233.00, 0.00, 0.00, 135205.00, 11267.00, '2022-11-25 05:37:12', '2022-11-25 05:37:12'),
(36, 94, 387200.00, 0.00, 50.00, 0.00, 0.00, 154880.00, 12907.00, 21600.00, 1800.00, 7450.00, 621.00, 183930.00, 15328.00, 77440.00, 6453.00, 125830.00, 10486.00, '2022-11-25 05:42:32', '2022-11-25 05:42:32'),
(37, 84, 728000.00, 5.00, 50.00, 36400.00, 3033.00, 276640.00, 23053.00, 33197.00, 2766.00, 13306.00, 1109.00, 323143.00, 26929.00, 138320.00, 11527.00, 230137.00, 19178.00, '2022-11-25 05:45:19', '2022-11-25 05:45:19'),
(38, 102, 265587.00, 0.00, 50.00, 0.00, 0.00, 106235.00, 8853.00, 21600.00, 1800.00, 5110.00, 426.00, 132945.00, 11079.00, 53118.00, 4427.00, 79524.00, 6627.00, '2022-11-25 05:47:49', '2022-11-25 05:47:49'),
(39, 86, 658009.00, 5.00, 50.00, 32900.00, 2742.00, 250044.00, 20837.00, 30005.00, 2500.00, 12027.00, 1002.00, 292076.00, 24340.00, 125022.00, 10419.00, 208012.00, 17334.00, '2022-11-25 08:50:15', '2022-11-25 08:50:15'),
(40, 142, 211939.00, 0.00, 0.00, 0.00, 0.00, 84776.00, 7065.00, 21600.00, 1800.00, 4078.00, 340.00, 110454.00, 9205.00, 0.00, 0.00, 101485.00, 8457.00, '2022-11-25 08:51:43', '2022-11-25 08:51:43'),
(41, 140, 197120.00, 0.00, 0.00, 0.00, 0.00, 78848.00, 6571.00, 20714.00, 1726.00, 3793.00, 316.00, 103355.00, 8613.00, 0.00, 0.00, 93765.00, 7814.00, '2022-11-25 08:52:34', '2022-11-25 08:52:34'),
(42, 138, 205700.00, 0.00, 0.00, 0.00, 0.00, 82280.00, 6857.00, 21600.00, 1800.00, 3958.00, 330.00, 107838.00, 8987.00, 0.00, 0.00, 97862.00, 8155.00, '2022-11-25 08:53:21', '2022-11-25 08:53:21'),
(43, 137, 201960.00, 0.00, 0.00, 0.00, 0.00, 80784.00, 6732.00, 21222.00, 1769.00, 3886.00, 324.00, 105892.00, 8824.00, 0.00, 0.00, 96068.00, 8006.00, '2022-11-25 08:54:41', '2022-11-25 08:54:41'),
(44, 136, 230000.00, 0.00, 0.00, 0.00, 0.00, 92000.00, 7667.00, 21600.00, 1800.00, 4425.00, 369.00, 118025.00, 9835.00, 0.00, 0.00, 111975.00, 9331.00, '2022-11-25 09:00:59', '2022-11-25 09:00:59'),
(45, 135, 205700.00, 0.00, 0.00, 0.00, 0.00, 82280.00, 6857.00, 21600.00, 1800.00, 3958.00, 330.00, 107838.00, 8987.00, 0.00, 0.00, 97862.00, 8155.00, '2022-11-25 09:04:06', '2022-11-25 09:04:06'),
(46, 133, 213248.00, 0.00, 0.00, 0.00, 0.00, 85299.00, 7108.00, 21600.00, 1800.00, 4103.00, 342.00, 111002.00, 9250.00, 0.00, 0.00, 102246.00, 8521.00, '2022-11-25 09:05:24', '2022-11-25 09:05:24'),
(47, 130, 201960.00, 0.00, 0.00, 0.00, 0.00, 80784.00, 6732.00, 21222.00, 1769.00, 3886.00, 324.00, 105892.00, 8824.00, 0.00, 0.00, 96068.00, 8006.00, '2022-11-25 09:06:42', '2022-11-25 09:06:42'),
(48, 104, 246400.00, 0.00, 50.00, 0.00, 0.00, 98560.00, 8213.00, 20612.00, 1718.00, 4741.00, 395.00, 123913.00, 10326.00, 49280.00, 4107.00, 73207.00, 6101.00, '2022-11-25 09:07:48', '2022-11-25 09:07:48'),
(49, 105, 376320.00, 0.00, 50.00, 0.00, 0.00, 150528.00, 12544.00, 21600.00, 1800.00, 7240.00, 603.00, 179368.00, 14947.00, 75264.00, 6272.00, 121688.00, 10141.00, '2022-11-25 09:09:39', '2022-11-25 09:09:39'),
(50, 68, 714480.00, 5.00, 50.00, 35724.00, 2977.00, 271502.00, 22625.00, 32580.00, 2715.00, 13059.00, 1088.00, 317141.00, 26428.00, 135751.00, 11313.00, 225864.00, 18822.00, '2022-11-25 09:10:40', '2022-11-25 09:10:40'),
(51, 106, 271040.00, 0.00, 50.00, 0.00, 0.00, 108416.00, 9035.00, 21600.00, 1800.00, 5215.00, 435.00, 135231.00, 11269.00, 54208.00, 4517.00, 81601.00, 6800.00, '2022-11-25 09:11:24', '2022-11-25 09:11:24'),
(52, 67, 735752.00, 5.00, 50.00, 36788.00, 3066.00, 279586.00, 23299.00, 33550.00, 2796.00, 13448.00, 1121.00, 326584.00, 27215.00, 139793.00, 11649.00, 232587.00, 19382.00, '2022-11-25 09:12:27', '2022-11-25 09:12:27'),
(53, 97, 608768.00, 5.00, 50.00, 30438.00, 2537.00, 231332.00, 19278.00, 27760.00, 2313.00, 11127.00, 927.00, 270219.00, 22518.00, 115666.00, 9639.00, 192445.00, 16037.00, '2022-11-25 09:13:56', '2022-11-25 09:13:56'),
(54, 107, 262805.00, 0.00, 50.00, 0.00, 0.00, 105122.00, 8760.00, 21600.00, 1800.00, 5056.00, 421.00, 131778.00, 10982.00, 52561.00, 4380.00, 78466.00, 6539.00, '2022-11-25 09:14:56', '2022-11-25 09:14:56'),
(55, 77, 254889.00, 0.00, 0.00, 0.00, 0.00, 101956.00, 8496.00, 21600.00, 1800.00, 4904.00, 409.00, 128460.00, 10705.00, 0.00, 0.00, 126429.00, 10536.00, '2022-11-25 09:15:46', '2022-11-25 09:15:46'),
(56, 129, 241895.00, 0.00, 0.00, 0.00, 0.00, 96758.00, 8063.00, 21600.00, 1800.00, 4654.00, 388.00, 123012.00, 10251.00, 0.00, 0.00, 118883.00, 9907.00, '2022-11-25 09:16:17', '2022-11-25 09:16:17'),
(57, 83, 234647.00, 0.00, 0.00, 0.00, 0.00, 93859.00, 7822.00, 21600.00, 1800.00, 4515.00, 376.00, 119974.00, 9998.00, 0.00, 0.00, 114673.00, 9556.00, '2022-11-25 09:17:27', '2022-11-25 09:17:27'),
(58, 82, 416809.00, 0.00, 50.00, 0.00, 0.00, 166724.00, 13894.00, 21600.00, 1800.00, 8019.00, 668.00, 196343.00, 16362.00, 83362.00, 6947.00, 137104.00, 11425.00, '2022-11-25 09:18:56', '2022-11-25 09:18:56'),
(59, 66, 440000.00, 0.00, 50.00, 0.00, 0.00, 176000.00, 14667.00, 21600.00, 1800.00, 8466.00, 706.00, 206066.00, 17172.00, 88000.00, 7333.00, 145934.00, 12161.00, '2022-11-25 09:19:32', '2022-11-25 09:19:32'),
(60, 87, 404514.00, 0.00, 50.00, 0.00, 0.00, 161806.00, 13484.00, 21600.00, 1800.00, 7783.00, 649.00, 191189.00, 15932.00, 80903.00, 6742.00, 132422.00, 11035.00, '2022-11-25 09:23:00', '2022-11-25 09:23:00'),
(61, 101, 552737.00, 0.00, 50.00, 0.00, 0.00, 221095.00, 18425.00, 26531.00, 2211.00, 10635.00, 886.00, 258261.00, 21522.00, 110548.00, 9212.00, 174732.00, 14561.00, '2022-11-25 09:24:48', '2022-11-25 09:24:48'),
(62, 108, 254568.00, 0.00, 0.00, 0.00, 0.00, 101827.00, 8486.00, 21600.00, 1800.00, 4898.00, 408.00, 128325.00, 10694.00, 0.00, 0.00, 126243.00, 10520.00, '2022-11-25 09:26:40', '2022-11-25 09:26:40'),
(63, 109, 276680.00, 0.00, 50.00, 0.00, 0.00, 110672.00, 9223.00, 21600.00, 1800.00, 5323.00, 444.00, 137595.00, 11466.00, 55336.00, 4611.00, 83749.00, 6979.00, '2022-11-25 09:29:31', '2022-11-25 09:29:31'),
(64, 110, 230567.00, 0.00, 50.00, 0.00, 0.00, 92227.00, 7686.00, 19288.00, 1607.00, 4436.00, 370.00, 115951.00, 9663.00, 46114.00, 3843.00, 68503.00, 5709.00, '2022-11-25 09:32:18', '2022-11-25 09:32:18'),
(65, 64, 826726.00, 5.00, 50.00, 41336.00, 3445.00, 314156.00, 26180.00, 37699.00, 3142.00, 15111.00, 1259.00, 366966.00, 30581.00, 157078.00, 13090.00, 261346.00, 21779.00, '2022-11-25 09:33:14', '2022-11-25 09:33:14'),
(66, 111, 246400.00, 0.00, 50.00, 0.00, 0.00, 98560.00, 8213.00, 20612.00, 1718.00, 4741.00, 395.00, 123913.00, 10326.00, 49280.00, 4107.00, 73207.00, 6101.00, '2022-11-25 09:35:00', '2022-11-25 09:35:00'),
(67, 112, 257600.00, 0.00, 50.00, 0.00, 0.00, 103040.00, 8587.00, 21549.00, 1796.00, 4956.00, 413.00, 129545.00, 10795.00, 51520.00, 4293.00, 76535.00, 6378.00, '2022-11-25 09:35:52', '2022-11-25 09:35:52'),
(68, 114, 201600.00, 0.00, 0.00, 0.00, 0.00, 80640.00, 6720.00, 21184.00, 1765.00, 3879.00, 323.00, 105703.00, 8809.00, 0.00, 0.00, 95897.00, 7991.00, '2022-11-25 09:36:38', '2022-11-25 09:36:38'),
(69, 90, 249781.00, 0.00, 50.00, 0.00, 0.00, 99912.00, 8326.00, 20895.00, 1741.00, 4806.00, 401.00, 125613.00, 10468.00, 49956.00, 4163.00, 74212.00, 6184.00, '2022-11-25 09:37:35', '2022-11-25 09:37:35'),
(70, 96, 345565.00, 0.00, 50.00, 0.00, 0.00, 138226.00, 11519.00, 21600.00, 1800.00, 6649.00, 554.00, 166475.00, 13873.00, 69113.00, 5759.00, 109977.00, 9165.00, '2022-11-25 09:39:43', '2022-11-25 09:39:43'),
(71, 98, 345565.00, 0.00, 50.00, 0.00, 0.00, 138226.00, 11519.00, 21600.00, 1800.00, 6649.00, 554.00, 166475.00, 13873.00, 69113.00, 5759.00, 109977.00, 9165.00, '2022-11-25 09:40:17', '2022-11-25 09:40:17'),
(72, 71, 413849.00, 0.00, 50.00, 0.00, 0.00, 165540.00, 13795.00, 21600.00, 1800.00, 7962.00, 664.00, 195102.00, 16259.00, 82770.00, 6898.00, 135977.00, 11331.00, '2022-11-25 09:41:56', '2022-11-25 09:41:56'),
(73, 126, 207873.00, 0.00, 0.00, 0.00, 0.00, 83149.00, 6929.00, 21600.00, 1800.00, 3999.00, 333.00, 108748.00, 9062.00, 0.00, 0.00, 99125.00, 8260.00, '2022-11-25 09:42:40', '2022-11-25 09:42:40'),
(74, 125, 188975.00, 0.00, 0.00, 0.00, 0.00, 75590.00, 6299.00, 19858.00, 1655.00, 3636.00, 303.00, 99084.00, 8257.00, 0.00, 0.00, 89891.00, 7491.00, '2022-11-25 09:43:22', '2022-11-25 09:43:22'),
(75, 124, 188975.00, 0.00, 0.00, 0.00, 0.00, 75590.00, 6299.00, 19858.00, 1655.00, 3636.00, 303.00, 99084.00, 8257.00, 0.00, 0.00, 89891.00, 7491.00, '2022-11-25 09:43:59', '2022-11-25 09:43:59'),
(76, 123, 186411.00, 0.00, 0.00, 0.00, 0.00, 74564.00, 6214.00, 19588.00, 1632.00, 3587.00, 299.00, 97739.00, 8145.00, 0.00, 0.00, 88672.00, 7389.00, '2022-11-25 09:51:25', '2022-11-25 09:51:25'),
(77, 122, 185129.00, 0.00, 0.00, 0.00, 0.00, 74052.00, 6171.00, 19454.00, 1621.00, 3562.00, 297.00, 97068.00, 8089.00, 0.00, 0.00, 88061.00, 7338.00, '2022-11-25 09:53:01', '2022-11-25 09:53:01'),
(78, 120, 186411.00, 0.00, 0.00, 0.00, 0.00, 74564.00, 6214.00, 19588.00, 1632.00, 3587.00, 299.00, 97739.00, 8145.00, 0.00, 0.00, 88672.00, 7389.00, '2022-11-25 09:53:46', '2022-11-25 09:53:46'),
(79, 118, 186362.00, 0.00, 0.00, 0.00, 0.00, 74545.00, 6212.00, 19583.00, 1632.00, 3586.00, 299.00, 97714.00, 8143.00, 0.00, 0.00, 88648.00, 7387.00, '2022-11-25 09:54:33', '2022-11-25 09:54:33'),
(80, 72, 312132.00, 0.00, 50.00, 0.00, 0.00, 124853.00, 10404.00, 21600.00, 1800.00, 6005.00, 500.00, 152458.00, 12705.00, 62427.00, 5202.00, 97247.00, 8104.00, '2022-11-25 09:56:09', '2022-11-25 09:56:09'),
(81, 69, 983055.00, 5.00, 50.00, 49153.00, 4096.00, 373561.00, 31130.00, 44827.00, 3736.00, 17968.00, 1497.00, 436356.00, 36363.00, 186781.00, 15565.00, 310765.00, 25897.00, '2022-11-25 10:08:01', '2022-11-25 10:08:01'),
(82, 115, 239150.00, 0.00, 50.00, 0.00, 0.00, 95660.00, 7972.00, 20006.00, 1667.00, 4601.00, 383.00, 120267.00, 10022.00, 47830.00, 3986.00, 71053.00, 5921.00, '2022-11-25 10:09:19', '2022-11-25 10:09:19'),
(83, 117, 239150.00, 0.00, 50.00, 0.00, 0.00, 95660.00, 7972.00, 20006.00, 1667.00, 4601.00, 383.00, 120267.00, 10022.00, 47830.00, 3986.00, 71053.00, 5921.00, '2022-11-25 10:10:37', '2022-11-25 10:10:37'),
(84, 153, 280000.00, 0.00, 50.00, 0.00, 0.00, 112000.00, 9333.00, 21600.00, 1800.00, 5387.00, 449.00, 138987.00, 11582.00, 56000.00, 4667.00, 85013.00, 7084.00, '2022-12-09 06:05:43', '2022-12-09 06:05:43'),
(85, 152, 500000.00, 5.00, 50.00, 25000.00, 2083.00, 190000.00, 15833.00, 22800.00, 1900.00, 9139.00, 762.00, 221939.00, 18495.00, 95000.00, 7917.00, 158061.00, 13172.00, '2022-12-09 06:33:06', '2022-12-09 06:33:06'),
(86, 121, 160000.00, 0.00, 50.00, 0.00, 0.00, 64000.00, 5333.00, 13384.00, 1115.00, 3078.00, 257.00, 80462.00, 6705.00, 32000.00, 2667.00, 47537.00, 3961.00, '2022-12-09 06:40:08', '2022-12-09 06:40:08'),
(87, 119, 230000.00, 0.00, 50.00, 0.00, 0.00, 92000.00, 7667.00, 19240.00, 1603.00, 4425.00, 369.00, 115665.00, 9639.00, 46000.00, 3833.00, 68335.00, 5695.00, '2022-12-09 06:40:57', '2022-12-09 06:40:57'),
(88, 116, 220000.00, 0.00, 0.00, 0.00, 0.00, 88000.00, 7333.00, 21600.00, 1800.00, 4233.00, 353.00, 113833.00, 9486.00, 0.00, 0.00, 106167.00, 8847.00, '2022-12-09 06:42:49', '2022-12-09 06:42:49'),
(89, 103, 250000.00, 0.00, 0.00, 0.00, 0.00, 100000.00, 8333.00, 21600.00, 1800.00, 4810.00, 401.00, 126410.00, 10534.00, 0.00, 0.00, 123590.00, 10299.00, '2022-12-09 06:48:54', '2022-12-09 06:48:54'),
(90, 99, 350000.00, 0.00, 50.00, 0.00, 0.00, 140000.00, 11667.00, 21600.00, 1800.00, 6734.00, 561.00, 168334.00, 14028.00, 70000.00, 5833.00, 111666.00, 9306.00, '2022-12-09 06:51:06', '2022-12-09 06:51:06'),
(91, 95, 310000.00, 0.00, 50.00, 0.00, 0.00, 124000.00, 10333.00, 21600.00, 1800.00, 5964.00, 497.00, 151564.00, 12630.00, 62000.00, 5167.00, 96436.00, 8036.00, '2022-12-09 06:53:44', '2022-12-09 06:53:44'),
(92, 155, 246400.00, 0.00, 50.00, 0.00, 0.00, 98560.00, 8213.00, 21600.00, 1800.00, 4741.00, 395.00, 124901.00, 10408.00, 49280.00, 4107.00, 106167.00, 8847.00, '2023-03-16 07:04:18', '2023-03-16 07:04:18'),
(93, 195, 900.00, 0.00, 0.00, 0.00, 0.00, 360.00, 30.00, 44.00, 4.00, 17.00, 1.00, 421.00, 35.00, 0.00, 0.00, 9.00, 1.00, '2023-09-06 10:46:05', '2023-09-06 10:46:05');

-- --------------------------------------------------------

--
-- Table structure for table `sp_pay_bands`
--

CREATE TABLE `sp_pay_bands` (
  `id` int(11) NOT NULL,
  `pay_band` varchar(100) NOT NULL,
  `pay_band_code` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_pay_grades`
--

CREATE TABLE `sp_pay_grades` (
  `id` int(11) NOT NULL,
  `paygrade_code` varchar(50) NOT NULL,
  `paygrade` float(7,2) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_pay_grades`
--

INSERT INTO `sp_pay_grades` (`id`, `paygrade_code`, `paygrade`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'PB', 10000.00, 1, '2020-07-15 07:39:20', '2020-07-15 07:39:20'),
(2, 'PB2', 15000.00, 1, '2020-07-15 07:41:31', '2020-07-15 07:41:31'),
(3, 'PB3', 20000.00, 1, '2020-07-15 07:43:56', '2020-07-15 07:43:56');

-- --------------------------------------------------------

--
-- Table structure for table `sp_permissions`
--

CREATE TABLE `sp_permissions` (
  `id` int(11) NOT NULL,
  `permission` varchar(100) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_permissions`
--

INSERT INTO `sp_permissions` (`id`, `permission`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'List', 'list', 1, '2020-10-10 11:27:18', '2020-10-10 11:27:18'),
(2, 'Add', 'add', 1, '2020-10-10 11:27:30', '2020-10-10 11:27:30'),
(3, 'Edit', 'edit', 1, '2020-10-10 11:27:38', '2020-10-10 11:27:38'),
(4, 'View', 'view', 1, '2020-10-10 11:27:46', '2020-10-10 11:27:46'),
(5, 'Delete', 'delete', 1, '2020-10-10 11:28:00', '2020-10-10 11:28:00'),
(6, 'Export', 'export', 1, '2020-10-10 11:28:17', '2020-10-10 11:28:17');

-- --------------------------------------------------------

--
-- Table structure for table `sp_permission_workflows`
--

CREATE TABLE `sp_permission_workflows` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_permission_workflows`
--

INSERT INTO `sp_permission_workflows` (`id`, `module_id`, `sub_module_id`, `permission_id`, `permission_slug`, `level_id`, `level`, `description`, `status`, `created_at`, `updated_at`) VALUES
(122, NULL, 1, 2, 'add', 1, 'Initiate', 'ktk', 1, '2020-12-16 08:48:23', '2020-12-16 08:48:23'),
(123, NULL, 1, 2, 'add', 3, 'Approve', 'khgj', 1, '2020-12-16 08:48:23', '2020-12-16 08:48:23'),
(124, NULL, 1, 1, 'list', 1, 'Initiate', 'csdVc', 1, '2021-04-07 13:30:09', '2021-04-07 13:30:09'),
(125, NULL, 1, 3, 'edit', 1, 'Initiate', 'test', 1, '2021-04-07 13:30:23', '2021-04-07 13:30:23'),
(126, NULL, 1, 4, 'view', 1, 'Initiate', 'test', 1, '2021-04-08 07:23:59', '2021-04-08 07:23:59'),
(127, NULL, 1, 4, 'view', 2, 'Forward', 'test', 1, '2021-04-08 07:23:59', '2021-04-08 07:23:59'),
(128, NULL, 1, 4, 'view', 3, 'Approve', 'test', 1, '2021-04-08 07:24:08', '2021-04-08 07:24:08'),
(132, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:07', '2022-09-02 09:34:07'),
(133, NULL, 49, 2, 'add', 2, 'Forward', 'can', 1, '2022-09-02 09:34:08', '2022-09-02 09:34:08'),
(134, NULL, 49, 2, 'add', 3, 'Approve', 'can', 1, '2022-09-02 09:34:08', '2022-09-02 09:34:08'),
(135, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:08', '2022-09-02 09:34:08'),
(136, NULL, 49, 3, 'edit', 2, 'Forward', 'can', 1, '2022-09-02 09:34:09', '2022-09-02 09:34:09'),
(137, NULL, 49, 3, 'edit', 3, 'Approve', 'can', 1, '2022-09-02 09:34:09', '2022-09-02 09:34:09'),
(138, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:09', '2022-09-02 09:34:09'),
(139, NULL, 49, 4, 'view', 2, 'Forward', 'can', 1, '2022-09-02 09:34:11', '2022-09-02 09:34:11'),
(140, NULL, 49, 4, 'view', 3, 'Approve', 'can', 1, '2022-09-02 09:34:11', '2022-09-02 09:34:11'),
(141, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:11', '2022-09-02 09:34:11'),
(142, NULL, 49, 5, 'delete', 2, 'Forward', 'can', 1, '2022-09-02 09:34:12', '2022-09-02 09:34:12'),
(143, NULL, 49, 5, 'delete', 3, 'Approve', 'can', 1, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(144, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(145, NULL, 49, 6, 'export', 2, 'Forward', 'can', 1, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(146, NULL, 49, 6, 'export', 3, 'Approve', 'can', 1, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(147, NULL, 49, 1, 'list', 1, 'Initiate', 'can', 1, '2022-09-02 09:34:48', '2022-09-02 09:34:48'),
(148, NULL, 49, 1, 'list', 2, 'Forward', 'can', 1, '2022-09-02 09:34:48', '2022-09-02 09:34:48'),
(149, NULL, 49, 1, 'list', 3, 'Approve', 'can', 1, '2022-09-02 09:34:48', '2022-09-02 09:34:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_permission_workflow_roles`
--

CREATE TABLE `sp_permission_workflow_roles` (
  `id` int(11) NOT NULL,
  `sub_module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `level_id` int(11) NOT NULL,
  `workflow_level_dept_id` int(11) DEFAULT NULL,
  `workflow_level_dept_name` varchar(100) DEFAULT NULL,
  `workflow_level_role_id` int(11) NOT NULL,
  `workflow_level_role_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_permission_workflow_roles`
--

INSERT INTO `sp_permission_workflow_roles` (`id`, `sub_module_id`, `permission_id`, `level_id`, `workflow_level_dept_id`, `workflow_level_dept_name`, `workflow_level_role_id`, `workflow_level_role_name`) VALUES
(163, 1, 2, 1, NULL, NULL, 0, 'Super Admin'),
(164, 1, 2, 3, 1, 'IT Wing', 3, 'IT Manager'),
(165, 1, 1, 1, NULL, NULL, 0, 'Super Admin'),
(166, 1, 1, 1, 4, 'Academics', 1, 'BIPE - Faculty'),
(167, 1, 3, 1, 1, 'Academics', 7, 'Faculty'),
(168, 1, 4, 1, 1, 'Academics', 7, 'Faculty'),
(169, 1, 4, 2, 2, 'Academics', 6, 'BIP - Student'),
(170, 1, 4, 3, 3, 'Academics', 4, 'BITE - Student'),
(190, 49, 2, 1, 8, 'Accounts', 2, 'Manager'),
(191, 49, 2, 1, 8, 'Accounts', 3, 'Executive'),
(192, 49, 2, 1, 9, 'CS and Legal', 4, 'Manager'),
(193, 49, 2, 1, 11, 'IT', 7, 'Assistant Manager'),
(194, 49, 2, 1, 11, 'IT', 8, 'Executive'),
(195, 49, 2, 1, 12, 'Logistics', 9, 'Executive'),
(196, 49, 2, 1, 13, 'Maintenance', 12, 'FES'),
(197, 49, 2, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(198, 49, 2, 1, 15, 'PES ', 14, 'Manager'),
(199, 49, 2, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(200, 49, 2, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(201, 49, 2, 1, 15, 'PES ', 17, 'LSA'),
(202, 49, 2, 1, 16, 'PIB', 18, 'Assistant Manager'),
(203, 49, 2, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(204, 49, 2, 1, 17, 'Procurement', 11, 'Area Officer'),
(205, 49, 2, 2, 10, 'Human Resource', 5, 'Manager'),
(206, 49, 2, 2, 10, 'Human Resource', 6, 'Executive'),
(207, 49, 2, 3, 20, 'Store', 23, 'Executive'),
(208, 49, 2, 3, 20, 'Store', 24, 'Incharge'),
(209, 49, 3, 1, 8, 'Accounts', 2, 'Manager'),
(210, 49, 3, 1, 8, 'Accounts', 3, 'Executive'),
(211, 49, 3, 1, 9, 'CS and Legal', 4, 'Manager'),
(212, 49, 3, 1, 11, 'IT', 7, 'Assistant Manager'),
(213, 49, 3, 1, 11, 'IT', 8, 'Executive'),
(214, 49, 3, 1, 12, 'Logistics', 9, 'Executive'),
(215, 49, 3, 1, 13, 'Maintenance', 12, 'FES'),
(216, 49, 3, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(217, 49, 3, 1, 15, 'PES ', 14, 'Manager'),
(218, 49, 3, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(219, 49, 3, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(220, 49, 3, 1, 15, 'PES ', 17, 'LSA'),
(221, 49, 3, 1, 16, 'PIB', 18, 'Assistant Manager'),
(222, 49, 3, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(223, 49, 3, 1, 17, 'Procurement', 11, 'Area Officer'),
(224, 49, 3, 2, 10, 'Human Resource', 5, 'Manager'),
(225, 49, 3, 2, 10, 'Human Resource', 6, 'Executive'),
(226, 49, 3, 3, 20, 'Store', 23, 'Executive'),
(227, 49, 3, 3, 20, 'Store', 24, 'Incharge'),
(228, 49, 4, 1, 8, 'Accounts', 2, 'Manager'),
(229, 49, 4, 1, 8, 'Accounts', 3, 'Executive'),
(230, 49, 4, 1, 9, 'CS and Legal', 4, 'Manager'),
(231, 49, 4, 1, 11, 'IT', 7, 'Assistant Manager'),
(232, 49, 4, 1, 11, 'IT', 8, 'Executive'),
(233, 49, 4, 1, 12, 'Logistics', 9, 'Executive'),
(234, 49, 4, 1, 13, 'Maintenance', 12, 'FES'),
(235, 49, 4, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(236, 49, 4, 1, 15, 'PES ', 14, 'Manager'),
(237, 49, 4, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(238, 49, 4, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(239, 49, 4, 1, 15, 'PES ', 17, 'LSA'),
(240, 49, 4, 1, 16, 'PIB', 18, 'Assistant Manager'),
(241, 49, 4, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(242, 49, 4, 1, 17, 'Procurement', 11, 'Area Officer'),
(243, 49, 4, 2, 10, 'Human Resource', 5, 'Manager'),
(244, 49, 4, 2, 10, 'Human Resource', 6, 'Executive'),
(245, 49, 4, 3, 20, 'Store', 23, 'Executive'),
(246, 49, 4, 3, 20, 'Store', 24, 'Incharge'),
(247, 49, 5, 1, 8, 'Accounts', 2, 'Manager'),
(248, 49, 5, 1, 8, 'Accounts', 3, 'Executive'),
(249, 49, 5, 1, 9, 'CS and Legal', 4, 'Manager'),
(250, 49, 5, 1, 11, 'IT', 7, 'Assistant Manager'),
(251, 49, 5, 1, 11, 'IT', 8, 'Executive'),
(252, 49, 5, 1, 12, 'Logistics', 9, 'Executive'),
(253, 49, 5, 1, 13, 'Maintenance', 12, 'FES'),
(254, 49, 5, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(255, 49, 5, 1, 15, 'PES ', 14, 'Manager'),
(256, 49, 5, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(257, 49, 5, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(258, 49, 5, 1, 15, 'PES ', 17, 'LSA'),
(259, 49, 5, 1, 16, 'PIB', 18, 'Assistant Manager'),
(260, 49, 5, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(261, 49, 5, 1, 17, 'Procurement', 11, 'Area Officer'),
(262, 49, 5, 2, 10, 'Human Resource', 5, 'Manager'),
(263, 49, 5, 2, 10, 'Human Resource', 6, 'Executive'),
(264, 49, 5, 3, 20, 'Store', 23, 'Executive'),
(265, 49, 5, 3, 20, 'Store', 24, 'Incharge'),
(266, 49, 6, 1, 8, 'Accounts', 2, 'Manager'),
(267, 49, 6, 1, 8, 'Accounts', 3, 'Executive'),
(268, 49, 6, 1, 9, 'CS and Legal', 4, 'Manager'),
(269, 49, 6, 1, 11, 'IT', 7, 'Assistant Manager'),
(270, 49, 6, 1, 11, 'IT', 8, 'Executive'),
(271, 49, 6, 1, 12, 'Logistics', 9, 'Executive'),
(272, 49, 6, 1, 13, 'Maintenance', 12, 'FES'),
(273, 49, 6, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(274, 49, 6, 1, 15, 'PES ', 14, 'Manager'),
(275, 49, 6, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(276, 49, 6, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(277, 49, 6, 1, 15, 'PES ', 17, 'LSA'),
(278, 49, 6, 1, 16, 'PIB', 18, 'Assistant Manager'),
(279, 49, 6, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(280, 49, 6, 1, 17, 'Procurement', 11, 'Area Officer'),
(281, 49, 6, 2, 10, 'Human Resource', 5, 'Manager'),
(282, 49, 6, 2, 10, 'Human Resource', 6, 'Executive'),
(283, 49, 6, 3, 20, 'Store', 23, 'Executive'),
(284, 49, 6, 3, 20, 'Store', 24, 'Incharge'),
(285, 49, 1, 1, 8, 'Accounts', 2, 'Manager'),
(286, 49, 1, 1, 8, 'Accounts', 3, 'Executive'),
(287, 49, 1, 1, 9, 'CS and Legal', 4, 'Manager'),
(288, 49, 1, 1, 11, 'IT', 7, 'Assistant Manager'),
(289, 49, 1, 1, 11, 'IT', 8, 'Executive'),
(290, 49, 1, 1, 12, 'Logistics', 9, 'Executive'),
(291, 49, 1, 1, 13, 'Maintenance', 12, 'FES'),
(292, 49, 1, 1, 14, 'MIS and IT', 13, 'Assistant Manager'),
(293, 49, 1, 1, 15, 'PES ', 14, 'Manager'),
(294, 49, 1, 1, 15, 'PES ', 15, 'Executive - Veterinary'),
(295, 49, 1, 1, 15, 'PES ', 16, 'Assistant - Veterinary '),
(296, 49, 1, 1, 15, 'PES ', 17, 'LSA'),
(297, 49, 1, 1, 16, 'PIB', 18, 'Assistant Manager'),
(298, 49, 1, 1, 17, 'Procurement', 10, 'Cluster Manager'),
(299, 49, 1, 1, 17, 'Procurement', 11, 'Area Officer'),
(300, 49, 1, 2, 10, 'Human Resource', 5, 'Manager'),
(301, 49, 1, 2, 10, 'Human Resource', 6, 'Executive'),
(302, 49, 1, 3, 1, 'Administration', 1, 'Chief Executive');

-- --------------------------------------------------------

--
-- Table structure for table `sp_petro_card`
--

CREATE TABLE `sp_petro_card` (
  `id` int(11) NOT NULL,
  `petro_card_number` varchar(100) NOT NULL,
  `petro_card_provider` varchar(100) DEFAULT NULL,
  `petro_card_issued_to` varchar(100) DEFAULT NULL,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `scan_of_card` text,
  `is_assigned` int(11) NOT NULL DEFAULT '1' COMMENT '0=>Assigned, 1=>Unassigned',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_previlege_categories`
--

CREATE TABLE `sp_previlege_categories` (
  `id` int(11) NOT NULL,
  `previlege_category` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_procure_collection`
--

CREATE TABLE `sp_procure_collection` (
  `id` int(11) NOT NULL,
  `collection_type` int(11) NOT NULL COMMENT '0 =>MCC\r\n1 => Agent\r\n2 => VLC',
  `collection_id` int(11) NOT NULL,
  `transporter_id` int(11) DEFAULT NULL,
  `collection_shift_id` int(11) NOT NULL COMMENT '0 = >Morning\r\n1 => Evening',
  `total_quantity` double(20,2) NOT NULL,
  `total_fat` double(20,2) NOT NULL,
  `total_snf` double(20,2) NOT NULL,
  `collection_date` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_reasons`
--

CREATE TABLE `sp_reasons` (
  `id` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_reasons`
--

INSERT INTO `sp_reasons` (`id`, `reason`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Not Interested ', 1, '2024-04-08 07:39:17', '2024-04-08 09:45:14'),
(2, 'Financial Issues', 1, '2024-04-08 09:45:22', '2024-04-08 09:45:22'),
(3, 'Interested with other vendor', 1, '2024-04-08 09:45:41', '2024-04-08 09:45:41');

-- --------------------------------------------------------

--
-- Table structure for table `sp_regularization`
--

CREATE TABLE `sp_regularization` (
  `id` int(11) NOT NULL,
  `regularization_type` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_regularization`
--

INSERT INTO `sp_regularization` (`id`, `regularization_type`, `created_at`, `updated_at`) VALUES
(1, 'On Duty', '2022-06-08 11:08:17', '2022-06-08 11:08:17'),
(2, 'Late Arrival', '2022-06-08 11:08:17', '2022-06-08 11:08:17'),
(3, 'Mis Punch', '2022-06-08 11:08:17', '2022-06-08 11:33:09');

-- --------------------------------------------------------

--
-- Table structure for table `sp_required_documents`
--

CREATE TABLE `sp_required_documents` (
  `id` int(11) NOT NULL,
  `document` varchar(100) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_required_documents`
--

INSERT INTO `sp_required_documents` (`id`, `document`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Aadhaar card', 1, '2020-07-14 08:19:07', '2020-07-14 08:19:07'),
(2, 'Pan card', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(5, 'Graduation', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(6, 'Diploma', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(7, 'Post-Graduation', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(8, 'Offer letter', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(10, 'Joining letter', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(11, 'Relieving letter', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(13, 'Domicile certificate', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(14, 'Transfer certificate', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(15, 'Driver License', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(16, 'Cancelled cheque', 1, '2020-07-14 08:24:31', '2020-07-14 08:24:31'),
(18, 'High School certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(19, 'Intermediate certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(20, 'Anti-Ragging Affidavit', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(21, 'Admission form', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(22, 'Signature', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(23, 'Income certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(24, 'Caste Certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(26, 'Transfer certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(27, 'Other course certificate', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(28, 'Last Semester Result', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(30, 'Cancelled cheque', 1, '2020-07-14 08:25:38', '2020-07-14 08:25:38'),
(31, 'High School Marksheet', 1, '2020-08-08 05:41:27', '2020-08-08 05:44:39'),
(32, 'Intermediate Marksheet', 1, '2020-08-08 05:46:29', '2020-08-08 05:46:29');

-- --------------------------------------------------------

--
-- Table structure for table `sp_roles`
--

CREATE TABLE `sp_roles` (
  `id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  `organization_name` varchar(100) NOT NULL,
  `department_id` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `reporting_department_id` int(11) DEFAULT NULL,
  `reporting_department_name` varchar(100) DEFAULT NULL,
  `reporting_role_id` int(11) DEFAULT NULL,
  `reporting_role_name` varchar(100) DEFAULT NULL,
  `responsibilities` longtext,
  `is_outsider` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_roles`
--

INSERT INTO `sp_roles` (`id`, `organization_id`, `organization_name`, `department_id`, `department_name`, `role_name`, `reporting_department_id`, `reporting_department_name`, `reporting_role_id`, `reporting_role_name`, `responsibilities`, `is_outsider`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 'Emobic Pvt Ltd', 24, 'Human Resources', ' HR Manager', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-09-13 05:00:19', '2024-03-13 10:32:18'),
(2, 3, 'Emobic Pvt Ltd', 26, 'Maintenance and support ', 'Manager', NULL, NULL, 0, 'Super User', '', 0, 1, '2023-09-13 05:01:08', '2024-03-13 10:32:22'),
(3, 3, 'Emobic Pvt Ltd', 26, 'Maintenance and support ', 'Support engg.', 26, 'Maintenance and support ', 5, 'Project Coordinator', '', 0, 1, '2023-09-13 05:01:31', '2024-03-13 10:32:24'),
(4, 3, 'Emobic Pvt Ltd', 26, 'Maintenance and support ', 'Project Manager', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-09-16 07:34:15', '2024-03-13 10:32:27'),
(5, 3, 'Emobic Pvt Ltd', 26, 'Maintenance and support ', 'Project Coordinator', 26, 'Maintenance and support ', 4, 'Project Manager', '', 0, 1, '2023-09-16 07:35:03', '2024-03-13 10:32:31'),
(6, 3, 'Emobic Pvt Ltd', 24, 'Human Resources', 'HR Executive', 24, 'Human Resources', 1, ' HR Manager', '', 0, 1, '2023-11-17 17:35:01', '2024-03-13 10:32:36'),
(7, 3, 'Emobic Pvt Ltd', 28, 'IT Department', 'Software Developer', 28, 'IT Department', 9, 'IT Manager', '', 0, 1, '2023-11-18 18:53:36', '2024-03-13 10:33:23'),
(8, 3, 'Emobic Pvt Ltd', 29, 'Management', 'C.E.O', NULL, NULL, 0, 'Super User', '', 0, 1, '2023-11-18 19:58:02', '2024-03-13 10:33:21'),
(9, 3, 'Emobic Pvt Ltd', 28, 'IT Department', 'IT Manager', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-11-18 20:01:46', '2024-03-13 10:33:18'),
(10, 3, 'Emobic Pvt Ltd', 25, 'Sales and Marketing', 'Marketing Manager', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-11-19 20:19:16', '2024-03-13 10:33:15'),
(11, 3, 'Emobic Pvt Ltd', 28, 'IT Department', 'Sr Executive IT', 28, 'IT Department', 9, 'IT Manager', '', 0, 1, '2023-11-19 20:21:36', '2024-03-13 10:33:12'),
(12, 3, 'Emobic Pvt Ltd', 30, 'Stores Department', 'Assistant Manager', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-11-19 20:25:13', '2024-03-13 10:33:08'),
(13, 3, 'Emobic Pvt Ltd', 30, 'Stores Department', 'Store Supervisor', 30, 'Stores Department', 12, 'Assistant Manager', '', 0, 1, '2023-11-19 20:28:18', '2024-03-13 10:33:05'),
(14, 3, 'Emobic Pvt Ltd', 27, 'Accounts Department', 'Accounts Manager', 29, 'Management', 15, 'General Manager', '', 0, 1, '2023-11-19 20:56:09', '2024-03-13 10:33:02'),
(15, 3, 'Emobic Pvt Ltd', 29, 'Management', 'General Manager', NULL, NULL, 0, 'Super User', '', 0, 1, '2023-11-19 21:31:10', '2024-03-13 10:32:57'),
(16, 3, 'Emobic Pvt Ltd', 26, 'Maintenance and support ', 'MIS Exeutive', 26, 'Maintenance and support ', 4, 'Project Manager', '', 0, 1, '2023-11-25 18:54:42', '2024-03-13 10:32:53'),
(17, 3, 'Emobic Pvt Ltd', 25, 'Sales and Marketing', 'Sales Executive', 29, 'Management', 8, 'C.E.O', '', 0, 1, '2023-11-25 18:55:36', '2024-03-13 10:32:49'),
(18, 3, 'Emobic Pvt Ltd', 27, 'Accounts Department', 'Accounts Astt', 27, 'Accounts Department', 14, 'Accounts Manager', '', 0, 1, '2023-11-25 20:18:37', '2024-03-13 10:32:45');

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_activities`
--

CREATE TABLE `sp_role_activities` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `activity` longtext NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_attributes`
--

CREATE TABLE `sp_role_attributes` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_attr_hidden_fields`
--

CREATE TABLE `sp_role_attr_hidden_fields` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_attr_optional_fields`
--

CREATE TABLE `sp_role_attr_optional_fields` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `field_name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_entity_mapping`
--

CREATE TABLE `sp_role_entity_mapping` (
  `id` int(11) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `role_id` int(11) NOT NULL,
  `entity_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_role_entity_mapping`
--

INSERT INTO `sp_role_entity_mapping` (`id`, `entity_type`, `role_id`, `entity_id`) VALUES
(5, 'leave_policy', 5, 2),
(12, 'Holiday', 2, 21),
(50, 'Holiday', 1, 22),
(51, 'Holiday', 1, 23),
(54, 'leave_policy', 1, 1),
(55, 'leave_policy', 2, 1),
(56, 'leave_policy', 3, 1),
(57, 'leave_policy', 4, 1),
(58, 'leave_policy', 8, 1),
(59, 'leave_policy', 9, 1),
(60, 'leave_policy', 11, 1),
(61, 'leave_policy', 17, 1),
(62, 'holiday', 17, 1),
(63, 'holiday', 17, 2);

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_permissions`
--

CREATE TABLE `sp_role_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_role_workflow_permissions`
--

CREATE TABLE `sp_role_workflow_permissions` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `workflow_level_dept_id` int(11) DEFAULT NULL,
  `workflow_level_role_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_routes`
--

CREATE TABLE `sp_routes` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `route` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_salary_addition_types`
--

CREATE TABLE `sp_salary_addition_types` (
  `id` int(11) NOT NULL,
  `addition` varchar(100) NOT NULL,
  `addition_basis` varchar(100) NOT NULL,
  `addition_amount` int(11) NOT NULL,
  `addition_percent_on` varchar(100) DEFAULT NULL,
  `addition_limit` int(11) NOT NULL,
  `addition_upper_limit` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_salary_addition_types`
--

INSERT INTO `sp_salary_addition_types` (`id`, `addition`, `addition_basis`, `addition_amount`, `addition_percent_on`, `addition_limit`, `addition_upper_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'befgbfcqwdc', 'fixed', 50, 'pay_scale', 0, 10, 1, '2020-12-23 11:50:27', '2020-12-23 12:14:33'),
(2, 'SFD', 'percent', 6, 'pay_scale', 0, 5, 1, '2021-03-25 10:36:36', '2021-03-25 10:36:36');

-- --------------------------------------------------------

--
-- Table structure for table `sp_salary_deduction_types`
--

CREATE TABLE `sp_salary_deduction_types` (
  `id` int(11) NOT NULL,
  `deduction` varchar(100) NOT NULL,
  `deduction_basis` varchar(100) NOT NULL,
  `deduction_amount` int(11) NOT NULL,
  `deduction_percent_on` varchar(100) DEFAULT NULL,
  `deduction_limit` int(11) NOT NULL,
  `deduction_upper_limit` float NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_salary_deduction_types`
--

INSERT INTO `sp_salary_deduction_types` (`id`, `deduction`, `deduction_basis`, `deduction_amount`, `deduction_percent_on`, `deduction_limit`, `deduction_upper_limit`, `status`, `created_at`, `updated_at`) VALUES
(1, 'cwdqc', 'fixed', 100, 'pay_scale', 4, 12, 1, '2020-12-23 12:36:57', '2020-12-23 12:36:57'),
(2, 'fg', 'fixed', 56, 'pay_scale', 0, 5, 1, '2021-03-25 10:37:30', '2021-03-25 10:37:30');

-- --------------------------------------------------------

--
-- Table structure for table `sp_salary_head`
--

CREATE TABLE `sp_salary_head` (
  `id` int(11) NOT NULL,
  `salary_head_type` int(11) DEFAULT NULL,
  `salary_head_name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_salary_head`
--

INSERT INTO `sp_salary_head` (`id`, `salary_head_type`, `salary_head_name`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 'Basic', '2024-04-24 21:13:33', '2024-04-24 21:13:33', 1),
(2, 1, 'HRA', '2024-04-22 17:15:32', '2024-04-22 17:15:32', 1),
(3, 1, 'Food', '2024-04-22 17:16:57', '2024-04-22 17:16:57', 1),
(4, 1, 'Conveyonce', '2024-04-22 17:17:43', '2024-04-22 17:17:43', 1),
(5, 1, 'Non Competency Payment', '2024-04-22 17:18:19', '2024-04-22 17:18:19', 1),
(6, 2, 'Comission', '2024-04-22 17:18:39', '2024-04-22 17:18:39', 1),
(7, 2, 'Other ( As per Actual )', '2024-04-22 17:19:13', '2024-04-24 21:07:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_salary_head_type`
--

CREATE TABLE `sp_salary_head_type` (
  `id` int(11) NOT NULL,
  `salary_head_type_name` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_salary_head_type`
--

INSERT INTO `sp_salary_head_type` (`id`, `salary_head_type_name`, `created_at`, `updated_at`) VALUES
(1, 'Fixed', '2024-04-22 02:02:02', '2024-04-22 02:02:02'),
(2, 'Addition', '2024-04-22 02:02:02', '2024-04-22 02:02:02'),
(3, 'Deductions', '2024-04-22 02:02:02', '2024-04-22 02:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `sp_salary_slip_pdf`
--

CREATE TABLE `sp_salary_slip_pdf` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `invoice_path` varchar(150) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_salary_slip_pdf`
--

INSERT INTO `sp_salary_slip_pdf` (`id`, `user_id`, `month`, `year`, `invoice_path`, `created_at`, `updated_at`) VALUES
(32, 247, 1, 2023, '/media/salary_pdf/salary_247_1_2023.pdf', '2024-04-29 16:34:51', '2024-04-29 16:34:51'),
(33, 247, 2, 2024, '/media/salary_pdf/salary_247_2_2024.pdf', '2024-04-29 17:08:20', '2024-04-29 17:08:20'),
(34, 232, 1, 2024, '/media/salary_pdf/salary_232_1_2024.pdf', '2024-05-07 17:16:58', '2024-05-07 17:16:58'),
(35, 232, 2, 2024, '/media/salary_pdf/salary_232_2_2024.pdf', '2024-05-07 17:20:46', '2024-05-07 17:20:46'),
(36, 232, 3, 2024, '/media/salary_pdf/salary_232_3_2024.pdf', '2024-05-10 15:25:24', '2024-05-10 15:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `sp_sessions`
--

CREATE TABLE `sp_sessions` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_current` int(11) NOT NULL DEFAULT '0',
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_sessions`
--

INSERT INTO `sp_sessions` (`id`, `session`, `start_date`, `end_date`, `is_current`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2019-2020', '2019-07-01', '2020-07-01', 0, 1, '2020-05-15 08:34:25', '2020-07-20 06:20:42'),
(2, '2020-2021', '2020-07-01', '2021-07-01', 1, 1, '2020-07-18 07:08:59', '2020-07-20 06:20:42'),
(3, '2021-2022', '2021-07-01', '2022-07-01', 0, 1, '2020-07-20 14:28:04', '2020-07-20 14:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `sp_states`
--

CREATE TABLE `sp_states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_states`
--

INSERT INTO `sp_states` (`id`, `country_id`, `country_name`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, 'India', 'UP', '2020-10-15 06:30:17', '2020-10-15 06:31:42'),
(2, 1, 'India', 'Rajasthan', '2022-09-22 04:07:53', '2022-09-22 04:07:53');

-- --------------------------------------------------------

--
-- Table structure for table `sp_sub_modules`
--

CREATE TABLE `sp_sub_modules` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `sub_module_name` varchar(100) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_sub_modules`
--

INSERT INTO `sp_sub_modules` (`id`, `module_id`, `module_name`, `sub_module_name`, `link`, `icon`, `status`, `created_at`, `updated_at`) VALUES
(1, 8, 'Master Management', 'Manage Organizations', 'src:organizations', NULL, 1, '2020-10-10 11:33:49', '2024-04-12 12:01:53'),
(2, 1, 'Roles & Permission', 'Manage Roles', 'src:roles', NULL, 1, '2020-10-10 11:33:49', '2021-03-27 06:40:02'),
(3, 2, 'Employee Management', 'Manage Employees', 'src:users', NULL, 1, '2020-10-10 11:33:49', '2022-05-23 12:37:12'),
(4, 2, 'Employee Management', 'Daily Attendance Report', 'src:daily-attendance-report', NULL, 1, '2020-10-10 11:33:49', '2022-07-21 03:42:02'),
(5, 2, 'Employee Management', 'Monthly Attendance Report', 'src:monthly-attendance-report', NULL, 0, '2020-10-10 11:33:49', '2024-04-03 08:06:25'),
(13, 8, 'Master Management', 'Manage Holidays', 'src:holidays', NULL, 1, '2020-10-10 11:33:49', '2024-04-03 07:59:54'),
(14, 4, 'Lead Management', 'Lead Management', 'src:index', NULL, 1, '2020-10-10 11:33:49', '2024-04-08 10:48:02'),
(15, 4, 'Lead Management', 'Upcoming Renewals', 'src:upcoming-renewals', NULL, 1, '2020-10-10 11:33:49', '2024-04-18 10:25:40'),
(23, 7, 'Logistics Management', 'Vehicle Management', '', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:21:58'),
(24, 7, 'Logistics Management', 'Driver Registration', '', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:01'),
(25, 7, 'Logistics Management', 'vehicle Tracking', '', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:05'),
(26, 8, 'Master Management', 'Manage Masters', 'src:master-management', NULL, 1, '2020-11-04 06:46:55', '2024-04-03 08:10:09'),
(32, 8, 'Master Management', 'Manage Leave Policies', 'src:leave-policies', NULL, 1, '2020-10-10 11:33:49', '2024-04-03 08:00:32'),
(33, 9, 'Leaves & Holiday Management', 'Manage Holidays', 'src:holidays', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:16'),
(34, 10, 'Academics', 'Manage Students', 'src:students', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:22'),
(35, 11, 'Student Attendance', 'Student Attendance', '', NULL, 0, '2020-10-10 11:33:49', '2022-05-23 12:39:36'),
(36, 11, 'Student Attendance', 'Student Attendance Report', 'src:attendance/student-attendance-report', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:29'),
(37, 2, 'Employee Management', 'Manage Contact Cards', '', NULL, 0, '2020-10-10 11:33:49', '2022-05-23 12:37:35'),
(38, 11, 'Student Attendance', 'Attendance Summary', 'src:attendance/attendance-summary', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:37'),
(39, 11, 'Student Attendance', 'Attendance Stats', 'src:attendance/attendance-stats', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 05:22:39'),
(40, 2, 'Employee Management', 'Employee Salary Slip', 'src:salary-slip', NULL, 1, '2020-10-10 11:33:49', '2024-04-29 11:47:41'),
(44, 22, 'Employee Management', 'Attendance Report', 'src:attendance/employee-attendance-report', NULL, 0, '2020-10-10 11:33:49', '2022-06-07 09:19:20'),
(45, 2, 'Employee Management', 'Mark Attendance', '', NULL, 0, '2020-10-10 11:33:49', '2023-10-05 11:05:03'),
(46, 10, 'Academics', 'View Documents', 'src:view-documents', NULL, 1, '2020-10-10 11:33:49', '2021-12-24 16:18:53'),
(48, 2, 'Employee Management', 'Attendance Regularization Request', 'src:regularization-report', NULL, 1, '2020-10-10 11:33:49', '2024-04-20 11:04:26'),
(49, 2, 'Employee Management', 'Manage Leave Report', 'src:leave-report', NULL, 1, '2020-10-10 11:33:49', '2024-04-03 08:08:55'),
(50, 222, 'Employee Management', 'Monthly Attendance Report', 'src:monthly-attendance-report', NULL, 0, '2020-10-10 11:33:49', '2024-04-03 08:06:39'),
(51, 222, 'Employee Management', 'Travel Allowance', 'src:ta-request', NULL, 0, '2023-10-05 11:04:26', '2024-04-03 07:57:48');

-- --------------------------------------------------------

--
-- Table structure for table `sp_tags`
--

CREATE TABLE `sp_tags` (
  `id` int(11) NOT NULL,
  `tag` varchar(20) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_tags`
--

INSERT INTO `sp_tags` (`id`, `tag`, `color`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Manager', '#2878B5', NULL, '2020-06-18 10:00:48', '2020-06-18 11:57:25'),
(2, 'Vendor', '#85D282 ', NULL, '2020-06-18 10:00:48', '2020-06-18 11:57:48'),
(3, 'Student', '#2878B5', NULL, '2020-07-25 11:44:58', '2020-07-25 11:44:58'),
(4, 'Assciate', '#2878B5', NULL, '2020-07-25 12:28:37', '2020-07-25 12:28:37'),
(5, 'Driver', '#2878B5', NULL, '2020-07-27 06:22:51', '2020-07-27 06:22:51'),
(6, 'Associate', '#2878B5', NULL, '2020-07-27 09:54:24', '2020-07-27 09:54:24'),
(7, 'HR', '#2878B5', NULL, '2020-08-04 13:59:09', '2020-08-04 13:59:09'),
(8, 'Team Lead', '#2878B5', NULL, '2020-08-05 12:34:58', '2020-08-05 12:34:58'),
(9, 'UX Designer', '#2878B5', NULL, '2020-08-05 12:34:58', '2020-08-05 12:34:58'),
(25, 'Associate Acc Head', '#2878B5', NULL, '2021-03-26 13:36:43', '2021-03-26 13:36:43');

-- --------------------------------------------------------

--
-- Table structure for table `sp_ta_request`
--

CREATE TABLE `sp_ta_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `visit_place` varchar(255) DEFAULT NULL,
  `visit_from_date` date DEFAULT NULL,
  `visit_to_date` date DEFAULT NULL,
  `total_expenses` float DEFAULT NULL,
  `company_paid` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_ta_request`
--

INSERT INTO `sp_ta_request` (`id`, `user_id`, `visit_place`, `visit_from_date`, `visit_to_date`, `total_expenses`, `company_paid`, `balance`, `status`, `created_at`, `updated_at`) VALUES
(1, 214, 'Delhi', '2023-12-03', '2023-12-03', 300, 0, 300, 0, '2023-12-02 13:05:31', '2023-12-02 13:05:31'),
(2, 64, 'lucknow', '2023-12-07', '2023-12-08', 1300, 10, 1290, 0, '2023-12-07 16:46:23', '2023-12-07 16:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `sp_ta_request_details`
--

CREATE TABLE `sp_ta_request_details` (
  `id` int(11) NOT NULL,
  `ta_request_id` int(11) NOT NULL,
  `ta_date` date DEFAULT NULL,
  `amount` float DEFAULT '0',
  `payment_type` varchar(50) DEFAULT NULL,
  `bill_image` varchar(255) DEFAULT NULL,
  `hotel_name` varchar(100) DEFAULT NULL,
  `remark` varchar(150) DEFAULT NULL,
  `ta_details_type` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_ta_request_details`
--

INSERT INTO `sp_ta_request_details` (`id`, `ta_request_id`, `ta_date`, `amount`, `payment_type`, `bill_image`, `hotel_name`, `remark`, `ta_details_type`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 200, NULL, 'media/attachments/attachment_1701502530_0.jpg', 'ggjs', NULL, 0, '2023-12-02 13:05:31', '2023-12-02 13:05:31'),
(2, 1, '2023-12-03', 100, 'Cash', 'media/attachments2/attachment_1701502530_0.jpg', NULL, 'fff', 1, '2023-12-02 13:05:31', '2023-12-02 13:05:31'),
(3, 2, NULL, 100, NULL, 'media/attachments/attachment_1701947783_0.jpg', 'ok', NULL, 0, '2023-12-07 16:46:23', '2023-12-07 16:46:23'),
(4, 2, '2023-12-07', 1200, NULL, 'media/attachments3/attachment_1701947783_0.jpg', NULL, '12345', 2, '2023-12-07 16:46:23', '2023-12-07 16:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `sp_towns`
--

CREATE TABLE `sp_towns` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `town` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_users`
--

CREATE TABLE `sp_users` (
  `id` int(11) NOT NULL,
  `salutation` varchar(10) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `middle_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `store_name` varchar(255) DEFAULT NULL,
  `store_image` varchar(100) DEFAULT NULL,
  `official_email` varchar(100) DEFAULT NULL,
  `primary_contact_number` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plain_password` varchar(50) DEFAULT NULL,
  `emp_sap_id` varchar(50) NOT NULL,
  `organization_id` int(11) DEFAULT NULL,
  `organization_name` varchar(222) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `department_name` varchar(222) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `role_name` varchar(222) DEFAULT NULL,
  `reporting_to_id` int(11) DEFAULT NULL,
  `reporting_to_name` varchar(255) DEFAULT NULL,
  `profile_image` varchar(100) DEFAULT NULL,
  `device_id` varchar(50) DEFAULT NULL,
  `firebase_token` varchar(255) DEFAULT NULL,
  `web_auth_token` varchar(255) DEFAULT NULL,
  `auth_otp` varchar(10) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `last_ip` varchar(255) DEFAULT NULL,
  `user_type` int(11) NOT NULL DEFAULT '1' COMMENT '1=>employee 2=>operational, 3=>non_operational',
  `is_distributor` int(11) NOT NULL DEFAULT '0',
  `is_super_stockist` int(11) NOT NULL DEFAULT '0',
  `is_retailer` int(11) NOT NULL DEFAULT '0',
  `is_tagged` int(11) NOT NULL DEFAULT '0',
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `self_owned` int(11) NOT NULL DEFAULT '0',
  `status` int(11) DEFAULT '1',
  `api_token` varchar(255) DEFAULT NULL,
  `finger_iso_1` longtext,
  `finger_iso_2` longtext,
  `fencing_timing` varchar(100) DEFAULT NULL,
  `attendence_mode` int(11) DEFAULT NULL,
  `periphery` varchar(100) DEFAULT NULL,
  `aten_timing` varchar(100) DEFAULT NULL,
  `timing` varchar(100) DEFAULT NULL,
  `id_card_attempts_left` int(11) NOT NULL DEFAULT '3',
  `is_id_card_generated` int(11) NOT NULL DEFAULT '0',
  `id_card_link` varchar(255) DEFAULT NULL,
  `id_card_created_at` datetime DEFAULT NULL,
  `login_status` int(11) NOT NULL DEFAULT '0',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lead_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_users`
--

INSERT INTO `sp_users` (`id`, `salutation`, `alias`, `first_name`, `middle_name`, `last_name`, `store_name`, `store_image`, `official_email`, `primary_contact_number`, `password`, `plain_password`, `emp_sap_id`, `organization_id`, `organization_name`, `department_id`, `department_name`, `role_id`, `role_name`, `reporting_to_id`, `reporting_to_name`, `profile_image`, `device_id`, `firebase_token`, `web_auth_token`, `auth_otp`, `last_login`, `last_ip`, `user_type`, `is_distributor`, `is_super_stockist`, `is_retailer`, `is_tagged`, `latitude`, `longitude`, `self_owned`, `status`, `api_token`, `finger_iso_1`, `finger_iso_2`, `fencing_timing`, `attendence_mode`, `periphery`, `aten_timing`, `timing`, `id_card_attempts_left`, `is_id_card_generated`, `id_card_link`, `id_card_created_at`, `login_status`, `created_by`, `created_at`, `updated_at`, `lead_count`) VALUES
(1, 'Mr', NULL, 'Sort', 'String', 'Solution', NULL, NULL, 'admin@gmail.com', '7081628886', 'pbkdf2_sha256$216000$76PwCjlwIFrm$ZMUyVpCaljA/RgJZNL5ite3oF1hUE1Zi5Bgk0GA/KV4=', 'admin@salesport', '2122121', 1, '\nEmobic Pvt Ltd', 1, 'IT Wing', 0, 'CTO', 16, 'Dinesh', NULL, 'd11e4dcb8eae9672', 'dF0q58G1S8moLnUvc88MA8:APA91bGH5pRt0j4d2Nej-0x-XmP6kXzohFD6EEsabdzUSyXlSZW7BD0R9fob4Bg4FY-Mbg2Fh2VB-IJvRfg1UoRmI-jtPzTdvIqeL_HT0TKMuMjh_PhuNhE8v-scOU9K5TpLeVsQo8B9', NULL, NULL, '2024-05-10 09:53:57', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, '965734525c16d699ad443e4b780183b8e31fe680', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2020-10-10 05:08:33', '2024-05-10 09:53:56', 20),
(64, 'Mr', '', 'play', '', 'Store', NULL, NULL, 'test@gmail.com', '9898989898', 'pbkdf2_sha256$216000$i3x1dLZlW16w$/gEUU7It/MqiLPT1Fgi8bmCPjY6+eUqa8mH6VEL2Hu4=', '123456', 'TTRACK001', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', '/media/profile_1712141262.jpg      ', 'UKQ1.230924.001', 'fVMj4DbqSuqIDtTPJrH-1w:APA91bE-CWT2f-iscB5WimAUxbn3a2q03XAKYatLFAIiT-fl5eKgu5lTE9f9CD_a56dLNG_4E9grULMU-hOCgffnKC-2QFf1mZ2vHUmt4xnd6WqqFFeaHJIKhNk26ViajVQap2zpj0kF', 'AppVersion:0.0.18, sdkInt:34,release:14,manufacturer:realme,brand:realme,device:RE54CBL1', NULL, '2024-04-18 11:23:21', NULL, 1, 0, 0, 0, 0, '12.9716', '77.5946', 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2022-09-24 05:34:50', '2024-04-30 06:16:04', 20),
(206, 'Mr', '', 'DEMO', '', 'NAME', NULL, NULL, 'raja1999chaudhary@gmail.com', '9335591006', 'pbkdf2_sha256$260000$WX44tj2Wbsti8NJYZ1pntU$4vic9/8TXQ30SAGwbvIBYYFCYqYGORM3sHkCkrjFq30=', '123456', 'TTRACK002', 3, '\nEmobic Pvt Ltd', 29, 'Management', 8, 'C.E.O', 1, 'T  Track', NULL, 'UP1A.231005.007_INMOD1', 'c769qxrqRCOheKcX7B2_CY:APA91bFrOarQhboprVT2f_UivI855fkXkw5bBMKX1SrftB5NZLCSS40cLpc_QtsZo_v8OKlds_Q1cEMqNR04t5ICeKAd94FMdPhEyjlngnmb-kSUmntjwXGVXylOAy5Tm4YcxQUs9nef', 'AppVersion:0.0.18, sdkInt:34,release:14,manufacturer:vivo,brand:vivo,device:V2231', NULL, '2024-04-12 17:27:50', NULL, 1, 0, 0, 0, 0, '26.8521161', '81.0026964', 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, '6:00 AM', 3, 0, NULL, NULL, 0, 0, '2023-11-25 17:31:08', '2024-04-12 17:27:50', 20),
(207, 'Mr', '', 'demo', '', 'cx', NULL, NULL, 'uu@gmail.com', '5445454554326', 'pbkdf2_sha256$216000$RvDoI47BZTtL$bx09v/LNMKUhaoV84cElxN7V7RRJfuywyqI3oF2JNCM=', '123456', 'TTRACK24', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-03-31 11:02:01', '2024-03-31 11:02:01', 0),
(212, 'Mr', '', 'eyj', '', 'bnfb', NULL, NULL, 'viveai884@gmail.com', '131251313641534', 'pbkdf2_sha256$216000$VoIbUxtrRYzE$9lbwu9oWy+fwJfLCSD3VHGlB50Cb/wNuENaz3irnTwA=', '123456', 'TTRACK996', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 10, 'Marketing Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 04:26:58', '2024-04-01 04:26:58', 0),
(213, 'Mr', '', 'dsfsad', '', 'fhgfd', NULL, NULL, 'dfdbb@gmail.com', '169846484654', 'pbkdf2_sha256$216000$njUjr8QCSTOK$q/CwQcU+Ss2nScg/nUDYsFJMLIVPVmn63beXnxMvqP4=', '123456', '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:28:56', '2024-04-01 10:28:56', 0),
(214, 'Mr', '', 'dfdsgf', '', 'fdhgfg', NULL, NULL, 'byygd@gmail.com', '5566556453453', 'pbkdf2_sha256$216000$YICHqY4cauBZ$uyvD/9dnl8YzPwWVZabdgYz9ZCZ8SG32MhJj3HwmPuU=', '123456', 'TTRACK954', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:29:37', '2024-04-01 10:29:37', 0),
(216, 'Mr', '', 'DD', '', 'VGFDG', NULL, NULL, 'dvd@gmail.com', '54765474454858', 'pbkdf2_sha256$216000$uVNRpamo9xmk$IMT8vMUR+ex5Pj1fRDVXDsMgP/+3LAoXpahlNWlfNj0=', '123456', 'TTRACK9411', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 10, 'Marketing Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:45:43', '2024-04-01 10:45:43', 0),
(217, 'Mr', '', 'dfr', '', 'fhbbfhg', NULL, NULL, 'dhgdf@gmail.com', '76887676876868', 'pbkdf2_sha256$216000$ufSX8jbWUz2H$aoE4l3hQBheB2CxzIGKmoA1R9TrA6YJCV2d75blnuvU=', '123456', 'TTRACK9645', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 10, 'Marketing Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:48:38', '2024-04-01 10:48:38', 0),
(218, 'Mr', '', 'sdfdf', '', 'dfsdf', NULL, NULL, 'PP@gmail.com', '41554645644565', 'pbkdf2_sha256$216000$IOkEO4Mm2Rro$RkpJM3wcjOsF9KGvG02y9Pb+hhO2rXvjzZIi7spD+lg=', '123456', 'TTRACK1452', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '2', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:52:22', '2024-04-01 10:52:22', 0),
(219, 'Mr', '', 'rtrf', '', 'dfsda', NULL, NULL, 'hgfdgf@gmail.com', '54453524452452', 'pbkdf2_sha256$216000$EzFZPR6F7jCW$VzVlvuOhqMvhGEPgZS9o1NbYK0aukLQYtEeTVMuZhTE=', '123456', 'TTRACK9254', 3, '\nEmobic Pvt Ltd', 26, 'Maintenance and support ', 2, 'Manager', 1, 'TTrack Admin TTrack', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 10:59:49', '2024-04-01 10:59:49', 0),
(220, 'Mr', '', 'hghf', '', 'fgfxg', NULL, NULL, 'fcnjiv@gmail.com', '5464646464744', 'pbkdf2_sha256$216000$VwwyKtHsMNvy$iRd5FtPbEkDWGfsWZ6Zt+qlQY6c7d/cN4CL1PMHupIk=', '123456', 'TTRACK154', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 11:04:01', '2024-04-01 11:04:01', 0),
(221, 'Mr', '', 'dfdsa', '', 'fgfg', NULL, NULL, 'dfg@gmail.com', '541415341315', 'pbkdf2_sha256$216000$3lZWFvyEvraI$/Evx6ow3gLyVtX3WV5hoO8/3pC9SE4wTqWxK05iTt/o=', '123456', 'TTRACK045', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 6, 'HR Executive', 207, 'demo  cx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '12', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 11:36:45', '2024-04-01 11:36:45', 0),
(222, 'Mr', '', 'dfsd', '', 'fgfds', NULL, NULL, 'raja@gmail.com', '545454468484', 'pbkdf2_sha256$216000$3p7QRtF8QEM1$67Ey+Xl0u7L2RVScsTQeyirfd5sGmyJlmW2x+EKXef4=', '123456', 'TTRACK92', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '58', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-01 11:54:49', '2024-04-01 11:54:49', 0),
(223, 'Mr', '', 'fbhtgj', '', 'bdkjb', NULL, NULL, 'abhimishrait@gmail.com', '446464665464', 'pbkdf2_sha256$216000$yVriYuvZ8aQ2$5gj4t+8mDFWnooal6csZlD1EikKCRQHP0ZqaA8ruLC0=', '123456', 'TTRACK924', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 17, 'Sales Executive', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, '2024-04-04 05:32:13', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-03 12:19:42', '2024-04-04 05:32:13', 0),
(224, 'Mr', '', 'Abhishek', 'Kumar', 'Mishra', NULL, NULL, 'abhishek@sortstring.com', '768937475', 'pbkdf2_sha256$216000$uVBTEHZorkdC$pbpYycToJi5eiv7HTK9wPdoq2gvylQTJlfff13gBX2E=', '123456', 'TTRACK925', 3, '\nEmobic Pvt Ltd', 29, 'Management', 8, 'C.E.O', 1, 'Sort String Solution', 'media/profileImage/employee_photo_224.png      ', NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 11:04:57', '2024-04-04 11:04:57', 0),
(225, 'Mr', '', 'dhifrg', '', 'bhgfdh', NULL, NULL, 'vdayft@gmail.com', '76543434564', 'pbkdf2_sha256$216000$cSHxqGp4Cy3N$pwA9CCNvRQJxiRn2zjqrrjgILIT7L4KCSQgMOoax93g=', '123456', 'TTRACK565', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '255', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 11:37:07', '2024-04-04 11:37:07', 0),
(226, 'Mr', '', 'Prabhat', '', 'Chaudhary', NULL, NULL, 'deepakmalik7232@gmail.com', '09335591006', 'pbkdf2_sha256$216000$XlmEXXaOqgih$6+qRubQeIZiA6GHO5OHmhr1zXRS/VO/0c6NPkjExzw4=', '123456', '2314324242', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 11:43:46', '2024-04-04 11:43:46', 0),
(227, 'Mr', '', 'tgkjfn', '', 'jbkfhbk', NULL, NULL, 'sdfhvnbyug@gmail.com', '65456456651', 'pbkdf2_sha256$216000$QHM0gdNmbxZ9$tqV9uhH3xM31IhOeJbeBMkpgpfidwpv78xLOWZxXU5Q=', '123456', 'TTRACK222', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 224, 'Abhishek Kumar Mishra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '6565', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 13:00:33', '2024-04-04 13:00:33', 0),
(228, 'Mr', '', 'bnrehk', '', 'jhhu', NULL, NULL, 'ihuilodk@gmail.com', '7854654665', 'pbkdf2_sha256$216000$unJEI0dZFsxE$POXKZzsRHwJlzqt7bDoixDy8EIgCxXi23X+/Gv/Hntw=', '123456', 'TTRACK6565', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 6, 'HR Executive', 207, 'demo  cx', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '563', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 13:05:50', '2024-04-04 13:05:50', 0),
(229, 'Mr', '', 'rgdrs', '', 'fdx', NULL, NULL, 'jhhjjk@gmail.com', '4855465486', 'pbkdf2_sha256$216000$ADTJMF0Nf86D$+S/IHrKRL53IODpfNc3VFYfBnnN3DQ5ERuMp4GN4EJw=', '123456', ' TTRACK656', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 17, 'Sales Executive', 224, 'Abhishek Kumar Mishra', NULL, 'QP1A.190711.020', 'dAis_VHWSQKhxPoFFZoyJz:APA91bHNItTd7LpixPH4dZayoxNxCcDWMKP2UHuyezRBdndRwaFM3aariUQY2EZUuSw_6B-gBb7AWZrO03fRKfQnwJ8Iprr62TXsTQsyv1ZoyuUUYk17jhxLUc9C5UEtBLh4hBJtvgth', 'AppVersion:0.0.17, sdkInt:29,release:10,manufacturer:Xiaomi,brand:POCO,device:angelicain', NULL, '2024-04-11 10:55:38', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '6545', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 13:35:04', '2024-04-11 10:55:39', 0),
(230, 'Mr', '', 'Abhishek', 'Kumar', 'Mishra', NULL, NULL, 'fygsdjg@gmail.com', '9452672531', 'pbkdf2_sha256$216000$0royFyv1SrOk$qUWnGyd9YCJy3bdvXWwygZ9TeeQdCq7+fIETwUU/984=', '123456', 'TTRACK656', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, 'UP1A.230620.001', 'dpW6GXwGR6-NDJ6sB8h1k0:APA91bEPOS1olWNmcW34eS7i_XqrkYjhiOxxisoq5RYpw2n4S1Md9Nb4lZWN6gyw0FFu2Qsbbnjnxwt-OwiEjRs9k3YnyvRpjyo4mhjwMt73Rhwut1SEQosAuoNCvh9VNUj7EpFfkAPZ', 'AppVersion:0.0.18, sdkInt:34,release:14,manufacturer:OPPO,brand:OPPO,device:OP52F3L1', NULL, '2024-04-12 17:21:13', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '5454', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 13:36:23', '2024-04-12 17:21:14', 0),
(231, 'Mr', '', 'Rishabh', '', 'Singh', NULL, NULL, 'fds@gmail.com', '7705056122', 'pbkdf2_sha256$216000$TJozUwG4mZTQ$pivzg6D9RSsNrwvAdEWd60T381cnlhdBI7JmyuDalUY=', '123456', 'TTRACK6568', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, 'QKQ1.190915.002', 'f1QWtFXFTkytRGkeoTr-qW:APA91bGQwr3JusUiQ4IQ4eWRP5gIp4iAeRN_BEPqMyxtYm2a4htXSaQ3nw5Zhd9KLa_PCZnFMxTl2cDuy0gDab9xlkE-e2Vd84rCMh9dYLz96D1fnAN4v2Ddbn8vfsdFrt7d8oeFu4la', 'AppVersion:0.0.18, sdkInt:29,release:10,manufacturer:Xiaomi,brand:xiaomi,device:violet', NULL, '2024-04-16 06:44:23', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '32', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-04 13:41:38', '2024-04-16 06:44:23', 0),
(232, 'Mr', '', 'Rahul', '', 'Chauhan', NULL, NULL, 'test2@gmail.com', '7355055909', 'pbkdf2_sha256$216000$KxS9qOA95dtp$5d4iZtZZvjrt9S7YSgYLYJ+v9mkud6Z01Mna6pMjSGc=', '123456', 'TTRACK6569', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 17, 'Sales Executive', 224, 'Abhishek Kumar Mishra', 'media/profileImage/employee_photo_232.png    ', 'QKQ1.190915.002', 'ewrvjRi0SsWTX8dS_lGHoA:APA91bF7efNo1QkNOgpFuywZOuOzAPqVYzdho8-9Lpg4jRQGLpSN4ZVeq2pJqVU0cdcrPTY3Ny3N_uC0DTsnMDNTyGBgKgyBtMyRF7e8a2EkD1S8mMCDWEfs8ddIC3Tq9Co1LXRVN-BE', 'AppVersion:0.0.18, sdkInt:29,release:10,manufacturer:Xiaomi,brand:xiaomi,device:violet', NULL, '2024-04-16 09:29:50', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-12 10:38:29', '2024-04-30 06:33:58', 0),
(233, 'Mr', '', 'test', '', 'employee', NULL, NULL, 'cghukhkj@gmail.com', '54545784554', 'pbkdf2_sha256$216000$AOLU4HYSoiQS$phK+FmmgQ63klJ3Hf8d+KyrD8aFgxp/bJPVbY58RY/8=', '123456', 'TTRACK5325', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, 'QP1A.190711.020', 'fQEYQSXGTcmaRPsA3Hy-pD:APA91bEzIHfyAwK04q6r-KhVuD_SgI3xCKMmBezOoSMTVHrwDlRNGJKHP1cclyqgEMh3k4YTrUggkoOrbpz3BcaOF7l0S8nGBK3eiFp71cd8NrYYdKTDbmAyMpWb0ODivaN-yf7EtbVF', 'AppVersion:0.0.18, sdkInt:29,release:10,manufacturer:Xiaomi,brand:POCO,device:angelicain', NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '100', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-12 23:55:41', '2024-04-20 09:45:39', 0),
(234, 'Mr', '', 'test', '', 'user', NULL, NULL, 'fgiuij@gmail.com', '59565656565', 'pbkdf2_sha256$216000$Ggx1YGao9deP$VOFD6iJKO/NXa0A+hFTdGWonrjX1/A9XK1aYvuHB3Ow=', '123456', 'TTRACK9656', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 224, 'Abhishek Kumar Mishra', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '121', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-15 06:47:52', '2024-04-15 06:47:52', 0),
(235, 'Mr', '', 'bfbkv', '', 'njfjdc', NULL, NULL, 'gkjfsdl@gmail.com', '65465456564', 'pbkdf2_sha256$216000$clQVn7lNdNWi$kAYi+TxDIvd0OBWcI0FD7DRYmgak72Q6jNcwKB/DyCY=', '123456', '', NULL, NULL, NULL, NULL, NULL, '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-18 11:46:40', '2024-04-18 11:46:40', 0),
(236, 'Mr', '', 'rakjdsrkjs', '', 'frdbjk', NULL, NULL, 'bhjsdjh@gmail.com', '6545645455', 'pbkdf2_sha256$216000$MN0tLIGCR4zE$P7H36OgcF2ZtBuqeM2Lj1APstIiyN4Lo78hAhmEBf7I=', '123456', 'TTRACK5420', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-18 11:49:47', '2024-04-18 11:49:47', 0),
(237, 'Mr', '', 'dfjhsgkcix', '', 'fgkjdfsdl', NULL, NULL, 'gkbdjfsj@gmail.com', '546465832534', 'pbkdf2_sha256$216000$pm9uVfsuC4Ui$viz+UpZQ0GqMWvlajfqZ/ugfcOdcoa3LI3JgRayUuFk=', '123456', 'TTRack4556', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 6, 'HR Executive', 207, 'demo  cx', NULL, NULL, NULL, NULL, NULL, '2024-04-21 11:15:43', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '22', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-18 12:23:52', '2024-04-21 11:15:42', 0),
(238, 'Mr', '', 'jdrfkijrejk', '', 'bvhjsdoiuj', NULL, NULL, 'kjfdkjlkj@gmail.com', '68778665454', 'pbkdf2_sha256$216000$PeTpI8xrY8uP$ZNFTnKfZ1aftekFGdDtqt8EUN07SjYoDeBAP6cD3mZc=', '123456', 'dbkhfjax', 3, '\nEmobic Pvt Ltd', 26, 'Maintenance and support ', 2, 'Manager', 1, 'Sort String Solution', NULL, NULL, NULL, NULL, NULL, '2024-04-20 09:47:59', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '420', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-18 12:32:22', '2024-04-20 09:47:58', 0),
(244, 'Mr', '', 'vjgrjil', '', 'JGJGSR', NULL, NULL, 'FGVHK@GMAIL.COM', '78974554654', 'pbkdf2_sha256$216000$OZxseaieb0ta$KluVGVy0y/yuFvKlqKTxppWIVWuaTSpJYn5NebL/klY=', '123456', 'TRK0245', 3, '\nEmobic Pvt Ltd', 24, 'Human Resources', 1, ' HR Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '520', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-20 15:54:11', '2024-04-20 15:54:11', 0),
(246, 'Mr', '', 'Test', '', 'Third', NULL, NULL, 'testsecond899@gmail.com', '5554545458', 'pbkdf2_sha256$216000$cF3J7vQ3dwZo$xbsj0IwfczcCTURGUL0abEYkK1Gl0W+7XNXkxKMuzSU=', '123456', 'TRK0247', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 10, 'Marketing Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, '2024-04-22 04:05:03', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-20 16:03:12', '2024-04-22 04:05:02', 0),
(247, 'Mr', '', 'Test', '', 'Four', NULL, NULL, 'Test1235@gmail.com', '89658658965', 'pbkdf2_sha256$216000$460OocyZ96Zy$RPTA6PvFrMqyOY3lKxjvcjRCUCRMv6lfyAHDEL+XaIo=', '123456', 'TRK0248', 3, '\nEmobic Pvt Ltd', 25, 'Sales and Marketing', 10, 'Marketing Manager', 206, 'DEMO  NAME', NULL, NULL, NULL, NULL, NULL, '2024-05-10 09:53:41', NULL, 1, 0, 0, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, '500', NULL, NULL, 3, 0, NULL, NULL, 0, 0, '2024-04-20 16:08:38', '2024-05-10 09:53:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_academic_details`
--

CREATE TABLE `sp_user_academic_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `admission_procedure_id` int(11) DEFAULT NULL,
  `registration_no` varchar(55) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `teacher_guardian_id` int(11) DEFAULT NULL,
  `teacher_guardian_name` varchar(55) DEFAULT NULL,
  `date_of_admission` date DEFAULT NULL,
  `year_id` varchar(22) DEFAULT NULL,
  `semester_id` varchar(55) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_attendance`
--

CREATE TABLE `sp_user_attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `attendance_date_time` datetime NOT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  `dis_ss_id` int(11) DEFAULT NULL,
  `latitude` varchar(50) DEFAULT NULL,
  `longitude` varchar(50) DEFAULT NULL,
  `attendance_img` varchar(200) DEFAULT NULL,
  `attendance_type` int(11) DEFAULT NULL,
  `Eod` varchar(600) DEFAULT NULL,
  `working_shift_id` int(11) DEFAULT NULL,
  `is_generated` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_attendance`
--

INSERT INTO `sp_user_attendance` (`id`, `user_id`, `attendance_date_time`, `start_time`, `end_time`, `dis_ss_id`, `latitude`, `longitude`, `attendance_img`, `attendance_type`, `Eod`, `working_shift_id`, `is_generated`, `status`, `created_at`, `updated_at`) VALUES
(1, 232, '2024-04-12 16:45:20', '16:45:25', NULL, 232, '26.8520727', '81.0026026', '/media/attendance1712920525.jpg', 1, NULL, NULL, 0, 1, '2024-04-12 11:15:25', '2024-04-12 11:15:25'),
(2, 232, '2024-04-14 11:28:09', '11:28:11', NULL, 232, '26.8493615', '80.9847852', '/media/attendance1713074291.jpg', 1, NULL, NULL, 0, 1, '2024-04-14 05:58:11', '2024-04-14 05:58:11'),
(3, 231, '2024-04-16 12:41:04', '12:41:06', NULL, 231, '26.8521157', '81.0026726', '/media/attendance1713251466.jpg', 1, NULL, NULL, 0, 1, '2024-04-16 07:11:07', '2024-04-16 07:11:07'),
(4, 231, '2024-04-16 13:30:26', NULL, '13:30:27', NULL, '26.8521134', '81.0026823', NULL, 1, 'No Work', NULL, 0, 1, '2024-04-16 08:00:28', '2024-04-16 08:00:28'),
(5, 64, '2024-04-18 19:13:58', '19:14:02', NULL, 64, '26.8521017', '81.0026897', '/media/attendance1713447842.jpg', 1, NULL, NULL, 0, 1, '2024-04-18 13:44:03', '2024-04-18 13:44:03'),
(6, 64, '2024-04-19 18:14:21', '18:14:27', NULL, 64, '26.8520992', '81.0026934', '/media/attendance1713530667.jpg', 1, NULL, NULL, 0, 1, '2024-04-19 12:44:28', '2024-04-19 12:44:28'),
(7, 64, '2024-04-19 18:16:20', NULL, '18:16:22', NULL, '26.8521101', '81.0026725', NULL, 1, 'Done', NULL, 0, 1, '2024-04-19 12:46:22', '2024-04-19 12:46:22'),
(8, 233, '2024-04-01 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(9, 233, '2024-04-01 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(10, 233, '2024-04-02 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(11, 233, '2024-04-02 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(12, 233, '2024-04-03 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(13, 233, '2024-04-03 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(14, 233, '2024-04-04 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(15, 233, '2024-04-04 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(16, 233, '2024-04-05 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(17, 233, '2024-04-05 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(18, 233, '2024-04-06 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(19, 233, '2024-04-06 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(20, 233, '2024-04-08 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(21, 233, '2024-04-08 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(22, 233, '2024-04-09 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(23, 233, '2024-04-09 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(24, 233, '2024-04-10 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(25, 233, '2024-04-10 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(26, 233, '2024-04-11 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(27, 233, '2024-04-11 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(28, 233, '2024-04-12 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(29, 233, '2024-04-12 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(30, 233, '2024-04-13 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(31, 233, '2024-04-13 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(32, 233, '2024-04-15 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(33, 233, '2024-04-15 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(34, 233, '2024-04-16 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(35, 233, '2024-04-16 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(36, 233, '2024-04-17 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(37, 233, '2024-04-17 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(38, 233, '2024-04-18 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(39, 233, '2024-04-18 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(40, 233, '2024-04-19 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(41, 233, '2024-04-19 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(42, 233, '2024-04-20 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(43, 233, '2024-04-20 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 09:49:05', '2024-04-20 09:49:05'),
(44, 206, '2024-04-12 22:59:00', '22:59:00', NULL, 206, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:07:46', '2024-04-20 12:07:46'),
(45, 206, '2024-04-12 22:59:00', '22:59:00', NULL, 206, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:08:19', '2024-04-20 12:08:19'),
(46, 206, '2024-04-12 22:59:00', '22:59:00', NULL, 206, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:25:22', '2024-04-20 12:25:22'),
(47, 232, '2024-04-11 09:30:00', '09:30:00', NULL, 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(48, 232, '2024-04-11 17:30:00', NULL, '17:30:00', 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(49, 232, '2024-04-12 09:30:00', '09:30:00', NULL, 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(50, 232, '2024-04-12 17:30:00', NULL, '17:30:00', 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:27:04', '2024-04-20 12:27:04'),
(51, 233, '2024-04-01 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(52, 233, '2024-04-01 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(53, 233, '2024-04-02 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(54, 233, '2024-04-02 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(55, 233, '2024-04-03 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(56, 233, '2024-04-03 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(57, 233, '2024-04-04 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(58, 233, '2024-04-04 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(59, 233, '2024-04-05 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(60, 233, '2024-04-05 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(61, 233, '2024-04-06 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(62, 233, '2024-04-06 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(63, 233, '2024-04-08 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(64, 233, '2024-04-08 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(65, 233, '2024-04-09 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(66, 233, '2024-04-09 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(67, 233, '2024-04-10 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(68, 233, '2024-04-10 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(69, 233, '2024-04-11 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(70, 233, '2024-04-11 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(71, 233, '2024-04-12 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(72, 233, '2024-04-12 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:01', '2024-04-20 12:28:01'),
(73, 233, '2024-04-13 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(74, 233, '2024-04-13 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(75, 233, '2024-04-15 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(76, 233, '2024-04-15 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(77, 233, '2024-04-16 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(78, 233, '2024-04-16 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(79, 233, '2024-04-17 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(80, 233, '2024-04-17 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(81, 233, '2024-04-18 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(82, 233, '2024-04-18 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(83, 233, '2024-04-19 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(84, 233, '2024-04-19 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(85, 233, '2024-04-20 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(86, 233, '2024-04-20 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:28:02', '2024-04-20 12:28:02'),
(87, 233, '2024-03-01 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(88, 233, '2024-03-01 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(89, 233, '2024-03-02 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(90, 233, '2024-03-02 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(91, 233, '2024-03-04 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(92, 233, '2024-03-04 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(93, 233, '2024-03-05 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(94, 233, '2024-03-05 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(95, 233, '2024-03-06 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(96, 233, '2024-03-06 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(97, 233, '2024-03-07 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(98, 233, '2024-03-07 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(99, 233, '2024-03-08 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(100, 233, '2024-03-08 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(101, 233, '2024-03-09 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(102, 233, '2024-03-09 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(103, 233, '2024-03-11 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(104, 233, '2024-03-11 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(105, 233, '2024-03-12 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(106, 233, '2024-03-12 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(107, 233, '2024-03-13 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(108, 233, '2024-03-13 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(109, 233, '2024-03-14 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(110, 233, '2024-03-14 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(111, 233, '2024-03-15 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(112, 233, '2024-03-15 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(113, 233, '2024-03-16 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(114, 233, '2024-03-16 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(115, 233, '2024-03-18 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(116, 233, '2024-03-18 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(117, 233, '2024-03-19 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(118, 233, '2024-03-19 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(119, 233, '2024-03-20 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(120, 233, '2024-03-20 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(121, 233, '2024-03-21 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(122, 233, '2024-03-21 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(123, 233, '2024-03-22 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(124, 233, '2024-03-22 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(125, 233, '2024-03-23 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(126, 233, '2024-03-23 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(127, 233, '2024-03-25 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(128, 233, '2024-03-25 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 12:29:45', '2024-04-20 12:29:45'),
(129, 232, '2024-04-15 09:30:00', '09:30:00', NULL, 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(130, 232, '2024-04-15 17:30:00', NULL, '17:30:00', 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(131, 232, '2024-04-16 09:30:00', '09:30:00', NULL, 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(132, 232, '2024-04-16 17:30:00', NULL, '17:30:00', 232, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-20 13:24:03', '2024-04-20 13:24:03'),
(133, 232, '2024-04-22 11:59:18', '11:59:26', NULL, 232, '26.8520508', '81.0025884', '/media/attendance1713767366.jpg', 1, NULL, NULL, 0, 1, '2024-04-22 06:29:27', '2024-04-22 06:29:27'),
(134, 233, '2024-03-26 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(135, 233, '2024-03-26 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(136, 233, '2024-03-27 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(137, 233, '2024-03-27 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(138, 233, '2024-03-28 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(139, 233, '2024-03-28 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(140, 233, '2024-03-29 09:30:00', '09:30:00', NULL, 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(141, 233, '2024-03-29 17:30:00', NULL, '17:30:00', 233, NULL, NULL, NULL, 1, NULL, NULL, 0, 1, '2024-04-22 07:12:47', '2024-04-22 07:12:47'),
(142, 232, '2024-05-06 12:29:56', '12:30:02', NULL, 232, '26.8521444', '81.0026959', '/media/attendance1714978802.jpg', 1, NULL, NULL, 0, 1, '2024-05-06 07:00:03', '2024-05-06 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_bank_details`
--

CREATE TABLE `sp_user_bank_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_id` int(11) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `ifsc_code` varchar(20) DEFAULT NULL,
  `bank_account_no` varchar(20) DEFAULT NULL,
  `account_holder_name` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_biometric_details`
--

CREATE TABLE `sp_user_biometric_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `finger_1` longtext,
  `finger_2` longtext,
  `finger_3` longtext,
  `finger_4` longtext,
  `finger_5` longtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_business_details`
--

CREATE TABLE `sp_user_business_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `business_type_id` int(11) DEFAULT NULL,
  `business_type` varchar(50) DEFAULT NULL,
  `contact_persons` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_contacts`
--

CREATE TABLE `sp_user_contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_type_id` int(11) NOT NULL,
  `contact_type` varchar(20) NOT NULL,
  `contact_number` varchar(10) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_documents`
--

CREATE TABLE `sp_user_documents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `document_id` int(11) DEFAULT NULL,
  `document_name` varchar(100) DEFAULT NULL,
  `ducument_number` varchar(50) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `qatar_id` varchar(255) DEFAULT NULL,
  `pan_card` varchar(255) DEFAULT NULL,
  `passport_card` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `educationaldoc` varchar(255) DEFAULT NULL,
  `visaletter` varchar(255) DEFAULT NULL,
  `offerletter` varchar(255) DEFAULT NULL,
  `qatar_id_expairy` date DEFAULT NULL,
  `passport_card_expairy` date DEFAULT NULL,
  `resume_expairy` date DEFAULT NULL,
  `educationaldoc_expairy` date DEFAULT NULL,
  `offerletter_expairy` date DEFAULT NULL,
  `visaletter_expairy` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_documents`
--

INSERT INTO `sp_user_documents` (`id`, `user_id`, `document_id`, `document_name`, `ducument_number`, `document_path`, `created_at`, `updated_at`, `qatar_id`, `pan_card`, `passport_card`, `resume`, `educationaldoc`, `visaletter`, `offerletter`, `qatar_id_expairy`, `passport_card_expairy`, `resume_expairy`, `educationaldoc_expairy`, `offerletter_expairy`, `visaletter_expairy`) VALUES
(33, 64, NULL, NULL, NULL, NULL, '2024-04-01 10:06:22', '2024-04-01 10:06:22', '/media/qatar_id_1711965981.pdf    ', NULL, '/media/pan_card_1711965981.pdf    ', '/media/resume_1711966393.pdf   ', '/media/educationaldoc_1711966393.pdf   ', '/media/visaletter_1711966393.pdf   ', '/media/offerletter_1711966393.pdf   ', '2024-04-22', '2024-04-21', '2024-04-23', NULL, NULL, NULL),
(34, 218, NULL, NULL, NULL, NULL, '2024-04-01 10:53:02', '2024-04-01 10:53:02', NULL, NULL, '/media/pan_card_1711968824.pdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 219, NULL, NULL, NULL, NULL, '2024-04-01 11:01:03', '2024-04-01 11:01:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 220, NULL, NULL, NULL, NULL, '2024-04-01 11:32:30', '2024-04-01 11:32:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 221, NULL, NULL, NULL, NULL, '2024-04-01 11:42:29', '2024-04-01 11:42:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 222, NULL, NULL, NULL, NULL, '2024-04-01 11:55:24', '2024-04-01 11:55:24', '/media/Vivek%20Bajpai.pdf            ', NULL, '/media/Vivek%20Bajpai_Fx8EcDP.pdf            ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 206, NULL, NULL, NULL, NULL, '2024-04-01 12:36:34', '2024-04-01 12:36:34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 223, NULL, NULL, NULL, NULL, '2024-04-03 12:21:41', '2024-04-03 12:21:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 224, NULL, NULL, NULL, NULL, '2024-04-04 11:12:28', '2024-04-04 11:12:28', '/media/qatar_id_1712229148.pdf ', NULL, '/media/pan_card_1712229148.pdf ', '/media/resume_1712229148.pdf ', '/media/educationaldoc_1712229148.pdf ', '/media/visaletter_1712229148.pdf ', '/media/offerletter_1712229148.pdf ', NULL, NULL, NULL, NULL, NULL, NULL),
(42, 225, NULL, NULL, NULL, NULL, '2024-04-04 11:38:01', '2024-04-04 11:38:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 227, NULL, NULL, NULL, NULL, '2024-04-04 13:04:56', '2024-04-04 13:04:56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 228, NULL, NULL, NULL, NULL, '2024-04-04 13:09:16', '2024-04-04 13:09:16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 229, NULL, NULL, NULL, NULL, '2024-04-04 13:35:44', '2024-04-04 13:35:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 230, NULL, NULL, NULL, NULL, '2024-04-04 13:36:46', '2024-04-04 13:36:46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 231, NULL, NULL, NULL, NULL, '2024-04-04 13:42:32', '2024-04-04 13:42:32', '/media/qatar_id_1712290355.pdf     ', NULL, NULL, '/media/resume_1712290413.pdf    ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 232, NULL, NULL, NULL, NULL, '2024-04-12 10:49:54', '2024-04-12 10:49:54', '/media/qatar_id_1712918994.pdf         ', NULL, '/media/pan_card_1712918994.pdf         ', '/media/resume_1712918994.pdf         ', NULL, NULL, NULL, '2024-04-22', '2024-04-21', '2024-04-23', NULL, NULL, NULL),
(49, 233, NULL, NULL, NULL, NULL, '2024-04-12 23:56:46', '2024-04-12 23:56:46', '/media/TaRequest.pdf ', NULL, '/media/TaRequest%20(1).pdf ', '/media/TaRequest_eLlNYwB.pdf ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 234, NULL, NULL, NULL, NULL, '2024-04-15 06:49:50', '2024-04-15 06:49:50', '/media/qatar_id_1713418051.pdf   ', NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-11', '2024-04-24', '2024-04-30', '2024-04-30', NULL, NULL),
(51, 236, NULL, NULL, NULL, NULL, '2024-04-18 12:15:41', '2024-04-18 12:15:41', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 237, NULL, NULL, NULL, NULL, '2024-04-18 12:25:58', '2024-04-18 12:25:58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-30', NULL, NULL, NULL, '2024-04-26'),
(53, 238, NULL, NULL, NULL, NULL, '2024-04-18 12:33:06', '2024-04-18 12:33:06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-25', '2024-04-26', NULL, NULL, NULL, NULL),
(54, 244, NULL, NULL, NULL, NULL, '2024-04-20 15:54:45', '2024-04-20 15:54:45', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 246, NULL, NULL, NULL, NULL, '2024-04-20 16:03:38', '2024-04-20 16:03:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 247, NULL, NULL, NULL, NULL, '2024-04-20 16:09:19', '2024-04-20 16:09:19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2024-04-24', '2024-04-27', '2024-04-30', '2024-04-28', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_financial_details`
--

CREATE TABLE `sp_user_financial_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_health_insurance` int(11) NOT NULL DEFAULT '0',
  `health_insurance` varchar(255) DEFAULT NULL,
  `wage_tax` varchar(50) DEFAULT NULL,
  `salary_saving_scheme` varchar(50) DEFAULT NULL,
  `gstin` varchar(20) DEFAULT NULL,
  `salary_additions` varchar(10) DEFAULT NULL,
  `salary_deductions` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_leaves`
--

CREATE TABLE `sp_user_leaves` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `handover_user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_status` int(11) NOT NULL DEFAULT '0',
  `leave_type` varchar(50) NOT NULL,
  `leave_from_date` datetime DEFAULT NULL,
  `leave_to_date` datetime DEFAULT NULL,
  `leave_detail` text NOT NULL,
  `remark` text,
  `attachment` varchar(255) DEFAULT NULL,
  `is_first_half_day` int(11) DEFAULT '0',
  `is_last_half_day` int(11) DEFAULT '0',
  `is_document_required` int(11) NOT NULL DEFAULT '0',
  `is_document_upload` int(11) NOT NULL DEFAULT '0',
  `is_document_required_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_leaves`
--

INSERT INTO `sp_user_leaves` (`id`, `user_id`, `handover_user_id`, `user_name`, `leave_type_id`, `leave_status`, `leave_type`, `leave_from_date`, `leave_to_date`, `leave_detail`, `remark`, `attachment`, `is_first_half_day`, `is_last_half_day`, `is_document_required`, `is_document_upload`, `is_document_required_count`, `created_at`, `updated_at`) VALUES
(1, 232, 230, 'Rahul  Chauhan', 1, 3, 'Casual Leave', '2024-04-17 00:00:00', '2024-04-18 00:00:00', 'test', NULL, '/media/leave_attachment_1712923812.jpg', 0, 0, 0, 0, 0, '2024-04-12 12:10:13', '2024-04-20 13:20:11');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_leave_document`
--

CREATE TABLE `sp_user_leave_document` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_leave_id` int(11) NOT NULL,
  `leave_type_document_id` int(11) DEFAULT NULL,
  `document` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_leave_policy_ledger`
--

CREATE TABLE `sp_user_leave_policy_ledger` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `leave_policy_id` int(11) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `month_leave_count` decimal(10,2) NOT NULL,
  `consecutive_leave` decimal(10,2) NOT NULL,
  `credit` float DEFAULT NULL,
  `debit` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(100) DEFAULT NULL,
  `leave_date` date DEFAULT NULL,
  `year_leave_count` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_user_leave_policy_ledger`
--

INSERT INTO `sp_user_leave_policy_ledger` (`id`, `user_id`, `leave_policy_id`, `leave_type_id`, `month_leave_count`, `consecutive_leave`, `credit`, `debit`, `balance`, `created_at`, `updated_at`, `remark`, `leave_date`, `year_leave_count`) VALUES
(83, 64, 1, 1, 2.00, 2.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 18.00),
(84, 64, 1, 5, 2.00, 1.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 12.00),
(85, 206, 1, 1, 2.00, 2.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 18.00),
(86, 206, 1, 5, 2.00, 1.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 12.00),
(87, 207, 1, 1, 2.00, 2.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 18.00),
(88, 207, 1, 5, 2.00, 1.00, 2, NULL, 2, '2024-04-03 23:35:33', '2024-04-03 23:35:33', NULL, '2024-04-03', 12.00),
(89, 64, 1, 1, 2.00, 2.00, NULL, 2, 0, '2024-04-03 23:39:23', '2024-04-03 23:39:23', NULL, '2024-04-03', NULL),
(90, 64, 1, 1, 2.00, 2.00, 2, NULL, 2, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 18.00),
(91, 64, 1, 5, 2.00, 1.00, 2, NULL, 4, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 12.00),
(92, 206, 1, 1, 2.00, 2.00, 2, NULL, 4, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 18.00),
(93, 206, 1, 5, 2.00, 1.00, 2, NULL, 4, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 12.00),
(94, 207, 1, 1, 2.00, 2.00, 2, NULL, 4, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 18.00),
(95, 207, 1, 5, 2.00, 1.00, 2, NULL, 4, '2024-04-03 23:43:22', '2024-04-03 23:43:22', NULL, '2024-04-03', 12.00),
(96, 64, 1, 1, 2.00, 2.00, 2, NULL, 4, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 18.00),
(97, 64, 1, 5, 2.00, 1.00, 2, NULL, 6, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 12.00),
(98, 206, 1, 1, 2.00, 2.00, 2, NULL, 6, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 18.00),
(99, 206, 1, 5, 2.00, 1.00, 2, NULL, 6, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 12.00),
(100, 207, 1, 1, 2.00, 2.00, 2, NULL, 6, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 18.00),
(101, 207, 1, 5, 2.00, 1.00, 2, NULL, 6, '2024-04-03 23:43:38', '2024-04-03 23:43:38', NULL, '2024-04-03', 12.00),
(102, 206, 1, 1, 2.00, 2.00, NULL, 2, 4, '2024-04-04 11:15:43', '2024-04-04 11:15:43', NULL, '2024-04-04', NULL),
(103, 207, 1, 1, 2.00, 2.00, 2, NULL, 8, '2024-04-04 13:00:01', '2024-04-04 13:00:01', 'fdas', '2024-04-03', NULL),
(104, 207, 1, 1, 2.00, 2.00, 2, NULL, 10, '2024-04-04 13:01:40', '2024-04-04 13:01:40', 'gfdsa', '2024-04-02', NULL),
(105, 232, 1, 1, 2.00, 2.00, NULL, 2, 8, '2024-04-04 13:02:19', '2024-04-04 13:02:19', 'efgd', '2024-03-12', NULL),
(106, 232, 1, 1, 2.00, 2.00, NULL, 2, 6, '2024-04-12 16:52:32', '2024-04-12 16:52:32', 'y7uyht', '2024-04-10', NULL),
(107, 232, 1, 1, 2.00, 2.00, 5, NULL, 11, '2024-04-12 16:52:58', '2024-04-12 16:52:58', 'ohiugj', '2024-04-03', NULL),
(108, 232, 1, 1, 1.00, 2.00, NULL, 1, 10, '2024-04-12 17:49:48', '2024-04-12 17:49:48', NULL, '2024-04-12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_location_logs`
--

CREATE TABLE `sp_user_location_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `particular` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_notifications`
--

CREATE TABLE `sp_user_notifications` (
  `id` int(11) NOT NULL,
  `row_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `model_name` varchar(50) NOT NULL,
  `notification` longtext NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT '0',
  `created_by_user_id` int(11) NOT NULL,
  `created_by_user_name` varchar(225) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_official_details`
--

CREATE TABLE `sp_user_official_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `designation_id` int(11) DEFAULT NULL,
  `designation` varchar(50) DEFAULT NULL,
  `pay_grade_id` int(11) DEFAULT NULL,
  `pay_grade` varchar(20) DEFAULT NULL,
  `employment_term` varchar(20) DEFAULT NULL,
  `additional_responsibilities` varchar(50) DEFAULT NULL,
  `working_hour` int(11) DEFAULT NULL,
  `date_of_joining` date DEFAULT NULL,
  `previous_employer` varchar(100) DEFAULT NULL,
  `years_of_experience` int(11) DEFAULT '0',
  `gstin` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_otp`
--

CREATE TABLE `sp_user_otp` (
  `id` int(11) NOT NULL,
  `mobile_no` varchar(10) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `otp` varchar(10) NOT NULL,
  `user_type` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_otp`
--

INSERT INTO `sp_user_otp` (`id`, `mobile_no`, `user_id`, `otp`, `user_type`, `created_at`, `updated_at`) VALUES
(45, '9452672531', 230, '4637', 1, '2024-04-12 18:52:43', '2024-04-12 18:52:43'),
(290, '9898989898', 64, '1234', 1, '2024-04-21 12:36:45', '2024-04-21 12:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_personal_details`
--

CREATE TABLE `sp_user_personal_details` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `father_first_name` varchar(50) DEFAULT NULL,
  `father_last_name` varchar(50) DEFAULT NULL,
  `mother_first_name` varchar(50) DEFAULT NULL,
  `mother_last_name` varchar(50) DEFAULT NULL,
  `spouse_name` varchar(100) DEFAULT NULL,
  `spouse_employer` varchar(100) DEFAULT NULL,
  `spouse_work_phone` varchar(15) DEFAULT NULL,
  `no_of_children` int(11) DEFAULT '0',
  `gender` varchar(10) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_of_birth` varchar(100) DEFAULT NULL,
  `martial_status` varchar(15) DEFAULT NULL,
  `blood_group` varchar(5) DEFAULT NULL,
  `disability` varchar(100) DEFAULT NULL,
  `identification_mark` varchar(200) DEFAULT NULL,
  `caste_category` varchar(20) DEFAULT NULL,
  `income_category_id` int(11) DEFAULT NULL,
  `income_category` varchar(100) DEFAULT NULL,
  `previlege_category_id` int(11) DEFAULT NULL,
  `previlege_category` varchar(100) DEFAULT NULL,
  `c_country` varchar(10) DEFAULT NULL,
  `c_state` int(11) DEFAULT NULL,
  `c_city` int(11) DEFAULT NULL,
  `c_address_line_1` varchar(100) DEFAULT NULL,
  `c_address_line_2` varchar(100) DEFAULT NULL,
  `c_pincode` varchar(8) DEFAULT NULL,
  `p_country` varchar(10) DEFAULT NULL,
  `p_state` int(11) DEFAULT NULL,
  `p_city` int(11) DEFAULT NULL,
  `p_address_line_1` varchar(100) DEFAULT NULL,
  `p_address_line_2` varchar(100) DEFAULT NULL,
  `p_pincode` varchar(8) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_regularization`
--

CREATE TABLE `sp_user_regularization` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(222) NOT NULL,
  `regularization_type_id` int(11) NOT NULL,
  `regularization_type_name` varchar(222) NOT NULL,
  `from_date` date DEFAULT NULL,
  `from_time` varchar(22) DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `to_time` varchar(22) DEFAULT NULL,
  `mobile_no` varchar(10) DEFAULT NULL,
  `place` varchar(222) DEFAULT NULL,
  `reason_for_leave` varchar(255) DEFAULT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `hod` varchar(255) DEFAULT NULL,
  `regularization_status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_regularization`
--

INSERT INTO `sp_user_regularization` (`id`, `user_id`, `user_name`, `regularization_type_id`, `regularization_type_name`, `from_date`, `from_time`, `to_date`, `to_time`, `mobile_no`, `place`, `reason_for_leave`, `manager`, `hod`, `regularization_status`, `created_at`, `updated_at`) VALUES
(1, 232, 'Rahul  Chauhan', 1, 'On Duty', '2024-04-11', NULL, '2024-04-12', NULL, '8888525588', 'dddd', 'ddd', NULL, NULL, 4, '2024-04-12 12:32:21', '2024-04-20 12:27:28'),
(2, 206, 'DEMO  NAME', 2, 'Late Arrival', '2024-04-12', '22:59', NULL, NULL, '552.5.9.', NULL, 'g gg crcrcre', NULL, NULL, 4, '2024-04-12 17:29:23', '2024-04-20 12:27:31'),
(3, 233, 'test  employee', 1, 'On Duty', '2024-04-01', NULL, '2024-04-20', NULL, '8299224866', 'luck', 'twat', NULL, NULL, 3, '2024-04-20 09:46:33', '2024-04-20 12:27:35'),
(4, 233, 'test  employee', 1, 'On Duty', '2024-03-01', NULL, '2024-03-25', NULL, '5758956865', 'hdhdnf', 'bcufufutut', NULL, NULL, 3, '2024-04-20 12:29:33', '2024-04-20 12:29:33'),
(5, 233, 'test  employee', 1, 'On Duty', '2024-03-26', NULL, '2024-03-29', NULL, '9563535656', 'dyfjgi', 'fufijifyko', NULL, NULL, 4, '2024-04-20 12:30:58', '2024-04-20 12:30:58'),
(6, 233, 'test  employee', 1, 'On Duty', '2024-03-26', NULL, '2024-03-29', NULL, '8852785858', 'hchfufuf', 'Yfyfyfhcuf', NULL, NULL, 3, '2024-04-20 12:32:55', '2024-04-20 12:32:55'),
(7, 233, 'test  employee', 1, 'On Duty', '2024-02-01', NULL, '2024-02-13', NULL, '6868586868', 'rxxtjf', 'gxhxup', NULL, NULL, 4, '2024-04-20 12:33:36', '2024-04-20 12:33:36'),
(8, 232, 'Rahul  Chauhan', 1, 'On Duty', '2024-04-15', NULL, '2024-04-16', NULL, '8454656595', 'bdyd', ', bdmd', NULL, NULL, 3, '2024-04-20 13:22:25', '2024-04-20 13:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_role_permissions`
--

CREATE TABLE `sp_user_role_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `workflow` text,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_role_permissions`
--

INSERT INTO `sp_user_role_permissions` (`id`, `user_id`, `role_id`, `module_id`, `sub_module_id`, `permission_id`, `permission_slug`, `workflow`, `from_date`, `to_date`, `created_at`, `updated_at`) VALUES
(497, 3, 2, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(498, 3, 2, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(499, 3, 2, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(500, 3, 2, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(501, 3, 2, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(503, 15, 3, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(504, 15, 3, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(505, 15, 3, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(506, 15, 3, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(507, 15, 3, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(509, 24, 3, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(510, 24, 3, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(511, 24, 3, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(512, 24, 3, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(513, 24, 3, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(515, 37, 4, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(516, 37, 4, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(517, 37, 4, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(518, 37, 4, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(519, 37, 4, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(521, 13, 7, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(522, 13, 7, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(523, 13, 7, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(524, 13, 7, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(525, 13, 7, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(527, 21, 8, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(528, 21, 8, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(529, 21, 8, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(530, 21, 8, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(531, 21, 8, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(533, 29, 8, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(534, 29, 8, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(535, 29, 8, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(536, 29, 8, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(537, 29, 8, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(539, 27, 9, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(540, 27, 9, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(541, 27, 9, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(542, 27, 9, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(543, 27, 9, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(545, 28, 12, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(546, 28, 12, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(547, 28, 12, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(548, 28, 12, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(549, 28, 12, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(551, 47, 12, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(552, 47, 12, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(553, 47, 12, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(554, 47, 12, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(555, 47, 12, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(557, 8, 13, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(558, 8, 13, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(559, 8, 13, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(560, 8, 13, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(561, 8, 13, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(563, 10, 14, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(564, 10, 14, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(565, 10, 14, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(566, 10, 14, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(567, 10, 14, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(569, 18, 15, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(570, 18, 15, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(571, 18, 15, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(572, 18, 15, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(573, 18, 15, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(575, 40, 15, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(576, 40, 15, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(577, 40, 15, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(578, 40, 15, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(579, 40, 15, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(581, 26, 16, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(582, 26, 16, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(583, 26, 16, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(584, 26, 16, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(585, 26, 16, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(587, 41, 17, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(588, 41, 17, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(589, 41, 17, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(590, 41, 17, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(591, 41, 17, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(593, 45, 17, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(594, 45, 17, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(595, 45, 17, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(596, 45, 17, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(597, 45, 17, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(599, 7, 18, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(600, 7, 18, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(601, 7, 18, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(602, 7, 18, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(603, 7, 18, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(605, 14, 10, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(606, 14, 10, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(607, 14, 10, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(608, 14, 10, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(609, 14, 10, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(611, 36, 10, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(612, 36, 10, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(613, 36, 10, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(614, 36, 10, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(615, 36, 10, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(617, 42, 10, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(618, 42, 10, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(619, 42, 10, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(620, 42, 10, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(621, 42, 10, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(623, 4, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(624, 4, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(625, 4, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(626, 4, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(627, 4, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(629, 20, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(630, 20, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(631, 20, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(632, 20, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(633, 20, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(635, 23, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(636, 23, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(637, 23, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(638, 23, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(639, 23, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(641, 33, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(642, 33, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(643, 33, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(644, 33, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(645, 33, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(647, 35, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(648, 35, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(649, 35, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(650, 35, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(651, 35, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(653, 38, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(654, 38, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(655, 38, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(656, 38, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(657, 38, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(659, 46, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(660, 46, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(661, 46, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(662, 46, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(663, 46, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(665, 48, 11, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(666, 48, 11, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(667, 48, 11, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(668, 48, 11, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(669, 48, 11, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(671, 6, 5, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(672, 6, 5, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(673, 6, 5, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(674, 6, 5, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(675, 6, 5, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(677, 30, 6, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(678, 30, 6, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(679, 30, 6, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(680, 30, 6, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(681, 30, 6, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(683, 11, 23, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(684, 11, 23, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(685, 11, 23, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(686, 11, 23, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(687, 11, 23, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(689, 25, 24, 2, 49, 2, 'add', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(690, 25, 24, 2, 49, 3, 'edit', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(691, 25, 24, 2, 49, 4, 'view', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(692, 25, 24, 2, 49, 5, 'delete', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(693, 25, 24, 2, 49, 6, 'export', NULL, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(694, 2, 1, 2, 49, 1, 'list', NULL, NULL, NULL, '2022-09-02 09:34:48', '2022-09-02 09:34:48'),
(695, 55, 1, 2, 49, 1, 'list', NULL, NULL, NULL, '2022-09-19 13:09:49', '2022-09-19 13:09:49'),
(696, 56, 1, 2, 49, 1, 'list', NULL, NULL, NULL, '2022-09-20 05:03:02', '2022-09-20 05:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_role_workflow_permissions`
--

CREATE TABLE `sp_user_role_workflow_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `sub_module_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `permission_slug` varchar(100) NOT NULL,
  `level_id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `workflow_level_dept_id` int(11) DEFAULT NULL,
  `workflow_level_role_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_user_role_workflow_permissions`
--

INSERT INTO `sp_user_role_workflow_permissions` (`id`, `user_id`, `role_id`, `module_id`, `sub_module_id`, `permission_id`, `permission_slug`, `level_id`, `level`, `description`, `workflow_level_dept_id`, `workflow_level_role_id`, `status`, `from_date`, `to_date`, `created_at`, `updated_at`) VALUES
(497, 3, 2, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 8, 2, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(498, 3, 2, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 8, 2, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(499, 3, 2, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 8, 2, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(500, 3, 2, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 8, 2, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(501, 3, 2, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 8, 2, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(503, 15, 3, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(504, 15, 3, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(505, 15, 3, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(506, 15, 3, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(507, 15, 3, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(509, 24, 3, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(510, 24, 3, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(511, 24, 3, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(512, 24, 3, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(513, 24, 3, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 8, 3, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(515, 37, 4, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 9, 4, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(516, 37, 4, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 9, 4, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(517, 37, 4, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 9, 4, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(518, 37, 4, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 9, 4, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(519, 37, 4, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 9, 4, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(521, 13, 7, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 11, 7, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(522, 13, 7, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 11, 7, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(523, 13, 7, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 11, 7, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(524, 13, 7, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 11, 7, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(525, 13, 7, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 11, 7, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(527, 21, 8, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(528, 21, 8, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(529, 21, 8, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(530, 21, 8, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(531, 21, 8, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(533, 29, 8, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(534, 29, 8, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(535, 29, 8, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(536, 29, 8, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(537, 29, 8, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 11, 8, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(539, 27, 9, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 12, 9, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(540, 27, 9, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 12, 9, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(541, 27, 9, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 12, 9, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(542, 27, 9, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 12, 9, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(543, 27, 9, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 12, 9, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(545, 28, 12, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(546, 28, 12, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(547, 28, 12, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(548, 28, 12, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(549, 28, 12, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(551, 47, 12, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(552, 47, 12, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(553, 47, 12, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(554, 47, 12, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(555, 47, 12, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 13, 12, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(557, 8, 13, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 14, 13, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(558, 8, 13, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 14, 13, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(559, 8, 13, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 14, 13, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(560, 8, 13, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 14, 13, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(561, 8, 13, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 14, 13, 1, NULL, NULL, '2022-09-02 09:34:13', '2022-09-02 09:34:13'),
(563, 10, 14, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 14, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(564, 10, 14, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 14, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(565, 10, 14, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 14, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(566, 10, 14, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 14, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(567, 10, 14, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 14, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(569, 18, 15, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(570, 18, 15, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(571, 18, 15, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(572, 18, 15, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(573, 18, 15, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(575, 40, 15, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(576, 40, 15, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(577, 40, 15, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(578, 40, 15, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(579, 40, 15, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 15, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(581, 26, 16, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 16, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(582, 26, 16, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 16, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(583, 26, 16, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 16, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(584, 26, 16, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 16, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(585, 26, 16, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 16, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(587, 41, 17, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(588, 41, 17, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(589, 41, 17, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(590, 41, 17, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(591, 41, 17, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(593, 45, 17, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(594, 45, 17, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(595, 45, 17, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(596, 45, 17, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(597, 45, 17, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 15, 17, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(599, 7, 18, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 16, 18, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(600, 7, 18, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 16, 18, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(601, 7, 18, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 16, 18, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(602, 7, 18, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 16, 18, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(603, 7, 18, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 16, 18, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(605, 14, 10, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(606, 14, 10, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(607, 14, 10, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(608, 14, 10, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(609, 14, 10, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(611, 36, 10, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(612, 36, 10, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(613, 36, 10, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(614, 36, 10, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(615, 36, 10, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(617, 42, 10, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(618, 42, 10, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(619, 42, 10, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(620, 42, 10, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(621, 42, 10, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 10, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(623, 4, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(624, 4, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(625, 4, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(626, 4, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(627, 4, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(629, 20, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(630, 20, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(631, 20, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(632, 20, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(633, 20, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(635, 23, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(636, 23, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(637, 23, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(638, 23, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(639, 23, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(641, 33, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(642, 33, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(643, 33, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(644, 33, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(645, 33, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(647, 35, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(648, 35, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(649, 35, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(650, 35, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(651, 35, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(653, 38, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(654, 38, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(655, 38, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(656, 38, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(657, 38, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(659, 46, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(660, 46, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(661, 46, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(662, 46, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:14', '2022-09-02 09:34:14'),
(663, 46, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(665, 48, 11, NULL, 49, 2, 'add', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(666, 48, 11, NULL, 49, 3, 'edit', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(667, 48, 11, NULL, 49, 4, 'view', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(668, 48, 11, NULL, 49, 5, 'delete', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(669, 48, 11, NULL, 49, 6, 'export', 1, 'Initiate', 'can', 17, 11, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(671, 6, 5, NULL, 49, 2, 'add', 2, 'Forward', 'can', 10, 5, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(672, 6, 5, NULL, 49, 3, 'edit', 2, 'Forward', 'can', 10, 5, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(673, 6, 5, NULL, 49, 4, 'view', 2, 'Forward', 'can', 10, 5, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(674, 6, 5, NULL, 49, 5, 'delete', 2, 'Forward', 'can', 10, 5, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(675, 6, 5, NULL, 49, 6, 'export', 2, 'Forward', 'can', 10, 5, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(677, 30, 6, NULL, 49, 2, 'add', 2, 'Forward', 'can', 10, 6, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(678, 30, 6, NULL, 49, 3, 'edit', 2, 'Forward', 'can', 10, 6, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(679, 30, 6, NULL, 49, 4, 'view', 2, 'Forward', 'can', 10, 6, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(680, 30, 6, NULL, 49, 5, 'delete', 2, 'Forward', 'can', 10, 6, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(681, 30, 6, NULL, 49, 6, 'export', 2, 'Forward', 'can', 10, 6, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(683, 11, 23, NULL, 49, 2, 'add', 3, 'Approve', 'can', 20, 23, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(684, 11, 23, NULL, 49, 3, 'edit', 3, 'Approve', 'can', 20, 23, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(685, 11, 23, NULL, 49, 4, 'view', 3, 'Approve', 'can', 20, 23, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(686, 11, 23, NULL, 49, 5, 'delete', 3, 'Approve', 'can', 20, 23, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(687, 11, 23, NULL, 49, 6, 'export', 3, 'Approve', 'can', 20, 23, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(689, 25, 24, NULL, 49, 2, 'add', 3, 'Approve', 'can', 20, 24, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(690, 25, 24, NULL, 49, 3, 'edit', 3, 'Approve', 'can', 20, 24, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(691, 25, 24, NULL, 49, 4, 'view', 3, 'Approve', 'can', 20, 24, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(692, 25, 24, NULL, 49, 5, 'delete', 3, 'Approve', 'can', 20, 24, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(693, 25, 24, NULL, 49, 6, 'export', 3, 'Approve', 'can', 20, 24, 1, NULL, NULL, '2022-09-02 09:34:15', '2022-09-02 09:34:15'),
(694, 2, 1, NULL, 49, 1, 'list', 3, 'Approve', 'can', 1, 1, 1, NULL, NULL, '2022-09-02 09:34:48', '2022-09-02 09:34:48'),
(695, 55, 1, NULL, 49, 1, 'list', 3, 'Approve', 'can', 1, 1, 1, NULL, NULL, '2022-09-19 13:09:49', '2022-09-19 13:09:49'),
(696, 56, 1, NULL, 49, 1, 'list', 3, 'Approve', 'can', 1, 1, 1, NULL, NULL, '2022-09-20 05:03:02', '2022-09-20 05:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_salary_slip`
--

CREATE TABLE `sp_user_salary_slip` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `fixed_pay_type_ids` varchar(45) DEFAULT NULL,
  `fixed_pay_per_val` varchar(45) DEFAULT NULL,
  `fixed_pay_converted_val` varchar(45) DEFAULT NULL,
  `deduction_type` varchar(45) DEFAULT NULL,
  `additional_type` varchar(45) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ctc` int(11) DEFAULT NULL,
  `monthly_ctc` int(11) DEFAULT NULL,
  `ctc_currency` int(11) DEFAULT NULL,
  `fixed_pay_currency` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_user_salary_slip`
--

INSERT INTO `sp_user_salary_slip` (`id`, `user_id`, `fixed_pay_type_ids`, `fixed_pay_per_val`, `fixed_pay_converted_val`, `deduction_type`, `additional_type`, `status`, `created_at`, `updated_at`, `ctc`, `monthly_ctc`, `ctc_currency`, `fixed_pay_currency`) VALUES
(4, 247, '1,2,3,4', '50,25,10,15', '5000,2500,1000,1500', NULL, '6', 1, '2024-04-24 21:22:25', '2024-04-24 21:22:25', 120000, 10000, 117, '117,117,117,117'),
(5, 232, '1,2,3,4', '50,20,20,10', '20834,8333,8333,4167', NULL, '6', 1, '2024-05-06 12:08:31', '2024-05-06 12:08:31', 500000, 41667, 119, '119,119,119,119');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_tags`
--

CREATE TABLE `sp_user_tags` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_tracking`
--

CREATE TABLE `sp_user_tracking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `velocity` double DEFAULT NULL,
  `distance_travelled` float DEFAULT NULL,
  `travel_charges` double(10,2) DEFAULT NULL,
  `accuracy` float(10,2) DEFAULT NULL,
  `location_direction` float(10,2) DEFAULT NULL,
  `sync_date_time` datetime DEFAULT NULL,
  `flag` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sp_user_tracking`
--

INSERT INTO `sp_user_tracking` (`id`, `user_id`, `latitude`, `longitude`, `velocity`, `distance_travelled`, `travel_charges`, `accuracy`, `location_direction`, `sync_date_time`, `flag`, `created_at`, `updated_at`) VALUES
(5176367, 64, '26.8521434', '81.0026507', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-11-29 06:18:42', '2023-11-29 06:18:42'),
(5176368, 64, '28.4161211', '77.8272079', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 09:38:40', '2023-12-01 09:38:40'),
(5176369, 217, '28.4161132', '77.8272173', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 10:58:43', '2023-12-01 10:58:43'),
(5176370, 215, '28.4161177', '77.8272095', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 11:09:10', '2023-12-01 11:09:10'),
(5176371, 217, '28.4160388', '77.8272097', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 11:11:51', '2023-12-01 11:11:51'),
(5176372, 214, '28.416144', '77.8272294', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 11:31:20', '2023-12-01 11:31:20'),
(5176373, 214, '28.4161397', '77.827226', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-01 11:31:28', '2023-12-01 11:31:28'),
(5176374, 217, '28.4161247', '77.8271987', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-02 05:37:25', '2023-12-02 05:37:25'),
(5176375, 64, '28.4161157', '77.82721', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-02 05:39:42', '2023-12-02 05:39:42'),
(5176376, 214, '28.4161211', '77.8271994', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-02 05:59:28', '2023-12-02 05:59:28'),
(5176377, 209, '28.4161144', '77.8272119', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-02 06:13:18', '2023-12-02 06:13:18'),
(5176378, 214, '28.4161155', '77.8271959', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-02 09:44:24', '2023-12-02 09:44:24'),
(5176379, 217, '28.4161138', '77.8272221', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-06 04:10:13', '2023-12-06 04:10:13'),
(5176380, 209, '28.4161193', '77.8272085', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-06 06:20:14', '2023-12-06 06:20:14'),
(5176381, 214, '28.4161104', '77.8272171', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-06 06:21:16', '2023-12-06 06:21:16'),
(5176382, 214, '28.4140174', '77.8437804', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-06 12:48:09', '2023-12-06 12:48:09'),
(5176383, 217, '28.4046888', '77.8335614', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-06 16:08:52', '2023-12-06 16:08:52'),
(5176384, 217, '28.416114', '77.8272197', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 03:40:19', '2023-12-07 03:40:19'),
(5176385, 214, '28.416111', '77.8272229', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 03:52:40', '2023-12-07 03:52:40'),
(5176386, 64, '26.8521423', '81.0026741', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 11:14:47', '2023-12-07 11:14:47'),
(5176387, 64, '26.8521629', '81.002727', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 11:17:13', '2023-12-07 11:17:13'),
(5176388, 214, '28.4139299', '77.8436976', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 12:30:16', '2023-12-07 12:30:16'),
(5176389, 217, '28.4081148', '77.8390425', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-07 15:11:36', '2023-12-07 15:11:36'),
(5176390, 217, '28.4161132', '77.827215', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-08 04:01:07', '2023-12-08 04:01:07'),
(5176391, 214, '28.4161141', '77.8272188', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-08 04:50:15', '2023-12-08 04:50:15'),
(5176392, 211, '28.4161172', '77.8272086', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-08 04:55:25', '2023-12-08 04:55:25'),
(5176393, 214, '28.4139296', '77.8437206', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-08 12:47:22', '2023-12-08 12:47:22'),
(5176394, 211, '28.4161127', '77.8272196', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 04:21:31', '2023-12-09 04:21:31'),
(5176395, 217, '28.4160503', '77.8273252', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 04:22:22', '2023-12-09 04:22:22'),
(5176396, 213, '28.4161133', '77.8272196', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 04:22:36', '2023-12-09 04:22:36'),
(5176397, 214, '28.4161129', '77.82722', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 05:06:43', '2023-12-09 05:06:43'),
(5176398, 211, '28.4161183', '77.8272067', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 11:29:57', '2023-12-09 11:29:57'),
(5176399, 214, '28.4161097', '77.8272184', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 11:30:10', '2023-12-09 11:30:10'),
(5176400, 213, '28.4161184', '77.8272125', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-09 11:31:05', '2023-12-09 11:31:05'),
(5176401, 211, '28.4161312', '77.8272171', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-10 04:47:31', '2023-12-10 04:47:31'),
(5176402, 214, '28.416113', '77.82722', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-10 05:13:50', '2023-12-10 05:13:50'),
(5176403, 214, '28.4139515', '77.8437504', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-10 14:05:53', '2023-12-10 14:05:53'),
(5176404, 214, '28.416014', '77.8273079', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-12 04:29:16', '2023-12-12 04:29:16'),
(5176405, 211, '28.4161231', '77.827211', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-12 04:33:03', '2023-12-12 04:33:03'),
(5176406, 217, '28.4161134', '77.8272144', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-12 05:03:35', '2023-12-12 05:03:35'),
(5176407, 206, '26.8521558', '81.0026349', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-15 06:40:57', '2023-12-15 06:40:57'),
(5176408, 206, '26.8521424', '81.0026238', NULL, 0, 0.00, 13.10, NULL, '2023-12-15 12:11:29', 0, '2023-12-15 06:41:29', '2023-12-15 06:41:29'),
(5176409, 206, '26.8521271', '81.0026118', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-15 06:41:41', '2023-12-15 06:41:41'),
(5176410, 206, '26.8521331', '81.0026507', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-27 13:19:01', '2023-12-27 13:19:01'),
(5176411, 206, '26.8835381', '80.9952791', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2023-12-31 08:37:20', '2023-12-31 08:37:20'),
(5176412, 206, '26.8521177', '81.0026285', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-04 05:32:08', '2024-01-04 05:32:08'),
(5176413, 206, '26.852121', '81.0026133', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-04 06:04:58', '2024-01-04 06:04:58'),
(5176414, 206, '30.354502', '76.4553568', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-17 18:19:39', '2024-01-17 18:19:39'),
(5176415, 206, '30.3544331', '76.4554681', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-17 18:20:08', '2024-01-17 18:20:08'),
(5176416, 64, '26.8526469', '81.0031641', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-23 10:32:01', '2024-01-23 10:32:01'),
(5176417, 64, '26.8526469', '81.0031641', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-23 10:32:28', '2024-01-23 10:32:28'),
(5176418, 206, '-37.7347916', '144.8877517', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-24 13:49:15', '2024-01-24 13:49:15'),
(5176419, 206, '-37.734797', '144.8877677', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-24 14:04:02', '2024-01-24 14:04:02'),
(5176420, 64, '26.8661228', '80.977394', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-24 14:16:53', '2024-01-24 14:16:53'),
(5176421, 64, '26.8656222', '80.9763171', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-24 14:22:36', '2024-01-24 14:22:36'),
(5176422, 64, '26.8521151', '81.002665', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-25 04:53:55', '2024-01-25 04:53:55'),
(5176423, 64, '26.8520607', '81.0027026', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-25 04:54:13', '2024-01-25 04:54:13'),
(5176424, 206, '26.8521138', '81.0026649', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 06:17:13', '2024-01-29 06:17:13'),
(5176425, 206, '26.8521174', '81.0026648', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 06:17:50', '2024-01-29 06:17:50'),
(5176426, 206, '26.8521155', '81.002667', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 06:26:26', '2024-01-29 06:26:26'),
(5176427, 206, '26.8521143', '81.0026649', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 06:26:48', '2024-01-29 06:26:48'),
(5176428, 206, '26.8521187', '81.0026648', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 07:01:40', '2024-01-29 07:01:40'),
(5176429, 206, '26.8521181', '81.0026663', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 07:02:05', '2024-01-29 07:02:05'),
(5176430, 206, '26.8521163', '81.0026656', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 07:08:24', '2024-01-29 07:08:24'),
(5176431, 206, '26.8521164', '81.0026672', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 07:25:53', '2024-01-29 07:25:53'),
(5176432, 206, '-37.7348294', '144.8878425', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-29 21:12:49', '2024-01-29 21:12:49'),
(5176433, 206, '26.8521044', '81.0026498', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-30 04:31:08', '2024-01-30 04:31:08'),
(5176434, 206, '26.8521121', '81.0026503', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-01-30 04:31:26', '2024-01-30 04:31:26'),
(5176435, 64, '12.986539', '77.6966316', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-02 05:02:13', '2024-02-02 05:02:13'),
(5176436, 206, '-37.7347983', '144.8877929', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-03 01:02:14', '2024-02-03 01:02:14'),
(5176437, 206, '-37.7347766', '144.8877417', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-06 23:15:22', '2024-02-06 23:15:22'),
(5176438, 206, '25.2686964', '51.5195612', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-17 08:35:04', '2024-02-17 08:35:04'),
(5176439, 206, '25.2498434', '51.4744191', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-19 08:33:09', '2024-02-19 08:33:09'),
(5176440, 206, '25.2916109', '51.496936', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-20 19:56:03', '2024-02-20 19:56:03'),
(5176441, 206, '25.2687427', '51.5195637', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-02-22 10:15:43', '2024-02-22 10:15:43'),
(5176442, 206, '26.8521149', '81.0026958', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-04 05:35:05', '2024-04-04 05:35:05'),
(5176443, 232, '26.8520727', '81.0026026', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-12 11:15:25', '2024-04-12 11:15:25'),
(5176444, 232, '26.8493615', '80.9847852', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-14 05:58:11', '2024-04-14 05:58:11'),
(5176445, 231, '26.8521157', '81.0026726', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-16 07:11:07', '2024-04-16 07:11:07'),
(5176446, 231, '26.8521134', '81.0026823', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-16 08:00:28', '2024-04-16 08:00:28'),
(5176447, 64, '26.8521017', '81.0026897', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-18 13:44:03', '2024-04-18 13:44:03'),
(5176448, 64, '26.8520992', '81.0026934', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-19 12:44:28', '2024-04-19 12:44:28'),
(5176449, 64, '26.8521101', '81.0026725', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-19 12:46:22', '2024-04-19 12:46:22'),
(5176450, 232, '26.8520508', '81.0025884', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-04-22 06:29:27', '2024-04-22 06:29:27'),
(5176451, 232, '26.8521444', '81.0026959', NULL, 0, 5.00, NULL, NULL, NULL, 0, '2024-05-06 07:00:03', '2024-05-06 07:00:03');

-- --------------------------------------------------------

--
-- Table structure for table `sp_user_travel_history`
--

CREATE TABLE `sp_user_travel_history` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(500) DEFAULT NULL,
  `distance_in_km` float DEFAULT NULL,
  `charge` float DEFAULT NULL,
  `travel_amount` float DEFAULT NULL,
  `treval_date` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicles`
--

CREATE TABLE `sp_vehicles` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `registration_number` varchar(255) DEFAULT NULL,
  `registered_address` text,
  `password` varchar(255) DEFAULT NULL,
  `plain_password` varchar(255) DEFAULT NULL,
  `ownership_type` varchar(50) NOT NULL,
  `dealer_name` varchar(50) DEFAULT NULL,
  `dealer_address` varchar(100) DEFAULT NULL,
  `dealer_contact_no` varchar(10) DEFAULT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `owner_address` varchar(100) DEFAULT NULL,
  `owner_contact_no` varchar(10) DEFAULT NULL,
  `vehicle_type` varchar(20) DEFAULT NULL,
  `class_of_vehicle` varchar(50) DEFAULT NULL,
  `maker_name` varchar(50) DEFAULT NULL,
  `year_of_manufacture` year(4) DEFAULT NULL,
  `chassis_no` varchar(50) DEFAULT NULL,
  `engine_no` varchar(50) DEFAULT NULL,
  `horsepower` varchar(50) DEFAULT NULL,
  `cubic_capacity` double DEFAULT NULL,
  `maker_classification` varchar(50) DEFAULT NULL,
  `seating_capacity_standard` double DEFAULT NULL,
  `seating_capacity_max` double DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `ac_fitted` varchar(10) DEFAULT NULL,
  `finance` varchar(10) DEFAULT NULL,
  `financer_name` varchar(50) DEFAULT NULL,
  `purchase_date` date DEFAULT NULL,
  `fuel_type` int(11) DEFAULT NULL,
  `purchase_amount` double DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `dl_expiry` date DEFAULT NULL,
  `driver_name` varchar(255) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `route_name` varchar(255) DEFAULT NULL,
  `incharge_id` int(11) DEFAULT NULL,
  `assign_from_date` date DEFAULT NULL,
  `assign_to_date` date DEFAULT NULL,
  `petro_card_id` int(11) DEFAULT NULL,
  `sale_letter` varchar(100) DEFAULT NULL,
  `mileage` double DEFAULT NULL,
  `vehicle_pic` text,
  `api_token` text,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_class`
--

CREATE TABLE `sp_vehicle_class` (
  `id` int(11) NOT NULL,
  `vehicle_class` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_vehicle_class`
--

INSERT INTO `sp_vehicle_class` (`id`, `vehicle_class`, `status`) VALUES
(1, 'Motor Car', 1),
(2, 'SCHOOL BUS', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_financer`
--

CREATE TABLE `sp_vehicle_financer` (
  `id` int(11) NOT NULL,
  `financer` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_fitness_details`
--

CREATE TABLE `sp_vehicle_fitness_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `application_no` varchar(100) DEFAULT NULL,
  `inspection_date` date DEFAULT NULL,
  `fitness_valid_till` date DEFAULT NULL,
  `copy_of_fitness_certificate` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_insurance_details`
--

CREATE TABLE `sp_vehicle_insurance_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `name_of_insurer` varchar(50) DEFAULT NULL,
  `date_of_insurance` date DEFAULT NULL,
  `valid_till` date DEFAULT NULL,
  `premium_amount` double DEFAULT NULL,
  `total_sum_insured` double DEFAULT NULL,
  `insurance_copy` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_insurer`
--

CREATE TABLE `sp_vehicle_insurer` (
  `id` int(11) NOT NULL,
  `name_of_insurer` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_maker`
--

CREATE TABLE `sp_vehicle_maker` (
  `id` int(11) NOT NULL,
  `maker_name` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_maker_classification`
--

CREATE TABLE `sp_vehicle_maker_classification` (
  `id` int(11) NOT NULL,
  `classification` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_pollution_details`
--

CREATE TABLE `sp_vehicle_pollution_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `certificate_sr_no` varchar(50) DEFAULT NULL,
  `date_of_registration` date DEFAULT NULL,
  `pollution_valid_till` date DEFAULT NULL,
  `copy_of_certificate` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_registration_details`
--

CREATE TABLE `sp_vehicle_registration_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `owner_name` varchar(50) DEFAULT NULL,
  `registration_number` varchar(50) NOT NULL,
  `registered_address` varchar(100) DEFAULT NULL,
  `rto` varchar(50) DEFAULT NULL,
  `registration_fees_amount` double DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `registration_valid_till` date DEFAULT NULL,
  `registration_copy` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_roadpermit_details`
--

CREATE TABLE `sp_vehicle_roadpermit_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `permit_no` varchar(50) DEFAULT NULL,
  `permit_registration_date` date DEFAULT NULL,
  `permit_valid_till` date DEFAULT NULL,
  `permitted_route` varchar(50) DEFAULT NULL,
  `purpose` varchar(100) DEFAULT NULL,
  `insurance_copy` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_tracking`
--

CREATE TABLE `sp_vehicle_tracking` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `driver_name` varchar(100) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `route_name` varchar(100) DEFAULT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `velocity` double DEFAULT NULL,
  `distance_travelled` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_types`
--

CREATE TABLE `sp_vehicle_types` (
  `id` int(11) NOT NULL,
  `vehicle_type` varchar(50) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_vehicle_types`
--

INSERT INTO `sp_vehicle_types` (`id`, `vehicle_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '2 wheeler', 1, '2020-07-15 11:40:08', '2020-07-15 11:40:08'),
(2, '3 wheeler', 1, '2020-07-15 11:40:43', '2020-07-15 11:40:43'),
(3, '4 wheeler', 1, '2020-07-15 11:41:34', '2020-07-15 11:41:34');

-- --------------------------------------------------------

--
-- Table structure for table `sp_vehicle_warranty_details`
--

CREATE TABLE `sp_vehicle_warranty_details` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `overall_warranty_period` int(11) DEFAULT NULL,
  `component_warranty` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sp_workflow_levels`
--

CREATE TABLE `sp_workflow_levels` (
  `id` int(11) NOT NULL,
  `level` varchar(15) NOT NULL,
  `priority` varchar(10) DEFAULT NULL,
  `color` varchar(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_workflow_levels`
--

INSERT INTO `sp_workflow_levels` (`id`, `level`, `priority`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Initiate', 'first', '#e10d0d', '2020-06-22 07:56:57', '2020-06-22 10:11:14'),
(2, 'Forward', 'middle', '#ffe000', '2020-06-22 07:56:57', '2020-06-22 10:11:33'),
(3, 'Approve', 'last', '#3ac418', '2020-06-22 07:57:03', '2020-06-22 10:11:52');

-- --------------------------------------------------------

--
-- Table structure for table `sp_working_hours`
--

CREATE TABLE `sp_working_hours` (
  `id` int(11) NOT NULL,
  `work_from` time NOT NULL,
  `work_to` time NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sp_working_hours`
--

INSERT INTO `sp_working_hours` (`id`, `work_from`, `work_to`, `is_active`, `created_at`, `updated_at`) VALUES
(1, '14:25:00', '18:25:00', 1, '2020-07-15 08:56:22', '2020-07-15 08:56:22'),
(2, '14:25:00', '20:25:00', 1, '2020-07-15 08:56:53', '2020-07-15 08:56:53');

-- --------------------------------------------------------

--
-- Table structure for table `sp_working_shifts`
--

CREATE TABLE `sp_working_shifts` (
  `id` int(11) NOT NULL,
  `working_shift` varchar(255) NOT NULL,
  `order_timing` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`id`, `email`, `password`, `name`) VALUES
(1, 'admin@gmail.com', 'bite@2021!', 'Admin'),
(2, 'ceo@bipevns.org', 'ceo@123', 'Admin'),
(3, 'principal@bitevns.org', 'bite@123', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_attendance`
--

CREATE TABLE `tbl_attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `student_id` int(11) DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `semester_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_block`
--

CREATE TABLE `tbl_block` (
  `id` int(11) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `block_name` varchar(100) NOT NULL,
  `code` int(11) DEFAULT NULL,
  `latlong` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_block`
--

INSERT INTO `tbl_block` (`id`, `tehsil_id`, `block_name`, `code`, `latlong`) VALUES
(5, 9, 'Jakhania', 7, '25.7437081,83.3642363'),
(6, 10, 'Saidpur', 17, '25.5517475,83.1768982'),
(7, 9, 'Manihari', 10, '25.3654941,83.2225788'),
(8, 9, 'Sadat', 15, '25.6718735,83.2960653'),
(9, 10, 'Deokali', 5, '25.541468,83.3206505'),
(10, 10, 'Manihari', 11, '25.3654941,83.2225788'),
(11, 10, 'Sadat', 16, '25.6718735,83.2960653'),
(12, 13, 'Cholapur', NULL, NULL),
(13, 14, 'Chiraigawn', NULL, NULL),
(14, 15, 'Lal Ganj', NULL, NULL),
(15, 16, 'Tarawa', NULL, NULL),
(16, 17, 'Zamania', 18, NULL),
(17, 18, 'Barachawar', 1, NULL),
(18, 18, 'Kasimabad', 9, NULL),
(19, 18, 'Bhanwarkol', 3, NULL),
(20, 18, 'Mohammadabad', 13, NULL),
(21, 19, 'Rasra', 1, NULL),
(22, 20, 'Mardah', 12, NULL),
(23, 20, 'Birno', 4, NULL),
(24, 20, 'Ghazipur', 6, NULL),
(25, 20, 'Karanda', 8, NULL),
(26, 17, 'Bhadaura', 2, NULL),
(27, 17, 'Revaitpur', 14, NULL),
(34, 21, 'def', NULL, NULL),
(35, 26, 'dsfd', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_branch`
--

CREATE TABLE `tbl_branch` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `course_type_id` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `branch_code` int(11) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `abbr` varchar(255) NOT NULL,
  `form_amount` int(11) NOT NULL,
  `total_student` int(11) DEFAULT NULL,
  `max_student` int(11) DEFAULT NULL,
  `total_sem` int(11) DEFAULT NULL,
  `total_year` int(11) DEFAULT NULL,
  `eligibility` varchar(255) DEFAULT NULL,
  `course_persuing_id` int(11) DEFAULT NULL,
  `is_admission_closed` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_allocated_shifts`
--

CREATE TABLE `tbl_cl_allocated_shifts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `working_shift_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_allocated_shifts`
--

INSERT INTO `tbl_cl_allocated_shifts` (`id`, `user_id`, `working_shift_id`, `created_at`, `updated_at`) VALUES
(28, 2, 3, '2022-06-08 12:19:08', '2022-06-08 12:19:08'),
(29, 3, 3, '2022-06-08 12:19:23', '2022-06-08 12:19:23'),
(31, 5, 3, '2022-06-08 12:19:54', '2022-06-08 12:19:54'),
(34, 8, 3, '2022-06-08 12:27:48', '2022-06-08 12:27:48'),
(35, 9, 3, '2022-06-08 12:34:26', '2022-06-08 12:34:26'),
(36, 10, 3, '2022-06-08 12:37:27', '2022-06-08 12:37:27'),
(37, 11, 3, '2022-06-08 12:40:17', '2022-06-08 12:40:17'),
(38, 12, 3, '2022-06-08 12:44:46', '2022-06-08 12:44:46'),
(39, 14, 3, '2022-06-08 12:53:16', '2022-06-08 12:53:16'),
(40, 4, 3, '2022-06-08 12:53:48', '2022-06-08 12:53:48'),
(41, 15, 3, '2022-06-08 12:56:53', '2022-06-08 12:56:53'),
(43, 17, 3, '2022-06-08 13:06:13', '2022-06-08 13:06:13'),
(44, 16, 3, '2022-06-08 13:06:22', '2022-06-08 13:06:22'),
(45, 18, 3, '2022-06-08 13:09:42', '2022-06-08 13:09:42'),
(46, 19, 3, '2022-06-08 13:12:46', '2022-06-08 13:12:46'),
(47, 20, 3, '2022-06-08 13:17:48', '2022-06-08 13:17:48'),
(48, 21, 3, '2022-06-08 13:21:17', '2022-06-08 13:21:17'),
(49, 22, 3, '2022-06-08 13:24:48', '2022-06-08 13:24:48'),
(50, 23, 3, '2022-06-08 13:28:35', '2022-06-08 13:28:35'),
(51, 24, 3, '2022-06-08 13:32:33', '2022-06-08 13:32:33'),
(53, 26, 3, '2022-06-08 14:15:35', '2022-06-08 14:15:35'),
(54, 27, 3, '2022-06-08 14:18:43', '2022-06-08 14:18:43'),
(55, 28, 3, '2022-06-08 14:24:12', '2022-06-08 14:24:12'),
(56, 29, 3, '2022-06-08 14:28:45', '2022-06-08 14:28:45'),
(58, 31, 3, '2022-06-08 14:36:06', '2022-06-08 14:36:06'),
(59, 32, 3, '2022-06-08 14:39:13', '2022-06-08 14:39:13'),
(60, 33, 3, '2022-06-08 14:44:01', '2022-06-08 14:44:01'),
(61, 34, 3, '2022-06-08 14:48:18', '2022-06-08 14:48:18'),
(62, 35, 3, '2022-06-08 14:51:46', '2022-06-08 14:51:46'),
(63, 36, 3, '2022-06-08 15:00:04', '2022-06-08 15:00:04'),
(65, 38, 3, '2022-06-08 15:08:39', '2022-06-08 15:08:39'),
(66, 39, 3, '2022-06-08 15:12:11', '2022-06-08 15:12:11'),
(67, 40, 3, '2022-06-08 15:18:44', '2022-06-08 15:18:44'),
(68, 41, 3, '2022-06-08 15:21:52', '2022-06-08 15:21:52'),
(69, 42, 3, '2022-06-08 15:24:43', '2022-06-08 15:24:43'),
(71, 44, 3, '2022-06-08 15:32:10', '2022-06-08 15:32:10'),
(74, 37, 3, '2022-06-08 15:36:33', '2022-06-08 15:36:33'),
(77, 25, 3, '2022-06-28 12:28:29', '2022-06-28 12:28:29'),
(79, 6, 3, '2022-06-28 14:31:06', '2022-06-28 14:31:06'),
(84, 7, 3, '2022-07-08 18:32:25', '2022-07-08 18:32:25'),
(85, 45, 3, '2022-07-11 09:46:09', '2022-07-11 09:46:09'),
(86, 46, 3, '2022-07-15 13:20:30', '2022-07-15 13:20:30'),
(87, 47, 3, '2022-07-15 13:32:12', '2022-07-15 13:32:12'),
(88, 48, 3, '2022-07-15 13:44:36', '2022-07-15 13:44:36'),
(92, 43, 3, '2022-07-16 13:38:33', '2022-07-16 13:38:33'),
(93, 30, 3, '2022-09-02 15:15:03', '2022-09-02 15:15:03'),
(94, 55, 3, '2022-09-19 18:40:01', '2022-09-19 18:40:01'),
(97, 56, 3, '2022-09-23 09:58:56', '2022-09-23 09:58:56'),
(104, 59, 3, '2022-09-23 17:13:18', '2022-09-23 17:13:18'),
(134, 75, 3, '2022-09-24 13:10:48', '2022-09-24 13:10:48'),
(137, 81, 3, '2022-09-24 14:35:53', '2022-09-24 14:35:53'),
(139, 84, 3, '2022-09-24 15:03:16', '2022-09-24 15:03:16'),
(145, 85, 3, '2022-09-24 15:41:27', '2022-09-24 15:41:27'),
(155, 91, 3, '2022-09-26 10:11:29', '2022-09-26 10:11:29'),
(157, 93, 3, '2022-09-26 10:28:18', '2022-09-26 10:28:18'),
(161, 98, 3, '2022-09-26 11:01:55', '2022-09-26 11:01:55'),
(180, 117, 3, '2022-09-26 12:53:30', '2022-09-26 12:53:30'),
(189, 124, 3, '2022-09-26 14:00:30', '2022-09-26 14:00:30'),
(192, 127, 3, '2022-09-26 14:20:37', '2022-09-26 14:20:37'),
(195, 131, 3, '2022-09-26 14:43:29', '2022-09-26 14:43:29'),
(197, 132, 3, '2022-09-26 14:49:05', '2022-09-26 14:49:05'),
(204, 139, 3, '2022-09-26 15:58:53', '2022-09-26 15:58:53'),
(233, 74, 5, '2022-10-03 16:27:38', '2022-10-03 16:27:38'),
(234, 141, 5, '2022-10-03 16:33:11', '2022-10-03 16:33:11'),
(250, 145, 3, '2022-10-31 14:40:34', '2022-10-31 14:40:34'),
(255, 86, 3, '2022-11-01 10:19:07', '2022-11-01 10:19:07'),
(256, 86, 4, '2022-11-01 10:19:07', '2022-11-01 10:19:07'),
(257, 86, 5, '2022-11-01 10:19:07', '2022-11-01 10:19:07'),
(266, 62, 3, '2022-11-01 10:33:13', '2022-11-01 10:33:13'),
(269, 70, 3, '2022-11-01 10:34:04', '2022-11-01 10:34:04'),
(271, 67, 3, '2022-11-01 10:34:45', '2022-11-01 10:34:45'),
(272, 68, 3, '2022-11-01 10:35:22', '2022-11-01 10:35:22'),
(273, 71, 3, '2022-11-01 10:35:43', '2022-11-01 10:35:43'),
(275, 80, 3, '2022-11-01 10:36:21', '2022-11-01 10:36:21'),
(277, 66, 3, '2022-11-01 10:37:22', '2022-11-01 10:37:22'),
(279, 72, 3, '2022-11-01 10:38:01', '2022-11-01 10:38:01'),
(281, 73, 3, '2022-11-01 10:38:39', '2022-11-01 10:38:39'),
(291, 69, 3, '2022-11-02 10:48:01', '2022-11-02 10:48:01'),
(294, 82, 3, '2022-11-02 10:53:37', '2022-11-02 10:53:37'),
(320, 78, 3, '2022-11-03 10:19:52', '2022-11-03 10:19:52'),
(327, 97, 3, '2022-11-03 10:53:34', '2022-11-03 10:53:34'),
(328, 97, 5, '2022-11-03 10:53:34', '2022-11-03 10:53:34'),
(329, 89, 3, '2022-11-03 10:54:32', '2022-11-03 10:54:32'),
(330, 89, 4, '2022-11-03 10:54:32', '2022-11-03 10:54:32'),
(331, 89, 5, '2022-11-03 10:54:32', '2022-11-03 10:54:32'),
(356, 96, 3, '2022-11-04 10:06:19', '2022-11-04 10:06:19'),
(357, 96, 4, '2022-11-04 10:06:19', '2022-11-04 10:06:19'),
(358, 96, 5, '2022-11-04 10:06:19', '2022-11-04 10:06:19'),
(360, 143, 3, '2022-11-04 14:06:09', '2022-11-04 14:06:09'),
(362, 94, 3, '2022-11-07 10:47:12', '2022-11-07 10:47:12'),
(363, 94, 4, '2022-11-07 10:47:12', '2022-11-07 10:47:12'),
(364, 94, 5, '2022-11-07 10:47:12', '2022-11-07 10:47:12'),
(369, 113, 3, '2022-11-09 14:09:06', '2022-11-09 14:09:06'),
(373, 152, 3, '2022-11-09 14:17:40', '2022-11-09 14:17:40'),
(374, 152, 4, '2022-11-09 14:17:40', '2022-11-09 14:17:40'),
(375, 152, 5, '2022-11-09 14:17:40', '2022-11-09 14:17:40'),
(407, 87, 3, '2022-11-18 10:27:24', '2022-11-18 10:27:24'),
(417, 92, 3, '2022-11-18 13:27:52', '2022-11-18 13:27:52'),
(418, 92, 4, '2022-11-18 13:27:52', '2022-11-18 13:27:52'),
(419, 92, 5, '2022-11-18 13:27:52', '2022-11-18 13:27:52'),
(434, 134, 3, '2022-12-12 10:39:56', '2022-12-12 10:39:56'),
(454, 99, 3, '2022-12-14 11:07:52', '2022-12-14 11:07:52'),
(455, 99, 4, '2022-12-14 11:07:52', '2022-12-14 11:07:52'),
(456, 99, 5, '2022-12-14 11:07:52', '2022-12-14 11:07:52'),
(460, 153, 3, '2022-12-14 17:19:59', '2022-12-14 17:19:59'),
(461, 153, 4, '2022-12-14 17:19:59', '2022-12-14 17:19:59'),
(462, 153, 5, '2022-12-14 17:19:59', '2022-12-14 17:19:59'),
(488, 101, 3, '2022-12-24 14:38:18', '2022-12-24 14:38:18'),
(501, 105, 3, '2022-12-26 15:39:17', '2022-12-26 15:39:17'),
(502, 105, 4, '2022-12-26 15:39:17', '2022-12-26 15:39:17'),
(503, 105, 5, '2022-12-26 15:39:17', '2022-12-26 15:39:17'),
(510, 100, 3, '2023-01-10 10:34:05', '2023-01-10 10:34:05'),
(516, 63, 3, '2023-02-22 11:29:25', '2023-02-22 11:29:25'),
(532, 150, 3, '2023-03-16 11:32:26', '2023-03-16 11:32:26'),
(533, 150, 4, '2023-03-16 11:32:26', '2023-03-16 11:32:26'),
(534, 150, 5, '2023-03-16 11:32:26', '2023-03-16 11:32:26'),
(550, 88, 3, '2023-03-25 11:22:12', '2023-03-25 11:22:12'),
(551, 128, 3, '2023-03-25 11:26:45', '2023-03-25 11:26:45'),
(552, 128, 4, '2023-03-25 11:26:45', '2023-03-25 11:26:45'),
(553, 128, 5, '2023-03-25 11:26:45', '2023-03-25 11:26:45'),
(554, 151, 3, '2023-03-25 11:31:27', '2023-03-25 11:31:27'),
(555, 151, 4, '2023-03-25 11:31:27', '2023-03-25 11:31:27'),
(556, 151, 5, '2023-03-25 11:31:27', '2023-03-25 11:31:27'),
(557, 149, 5, '2023-03-25 11:35:48', '2023-03-25 11:35:48'),
(558, 148, 3, '2023-03-25 11:43:54', '2023-03-25 11:43:54'),
(560, 146, 3, '2023-03-25 11:51:33', '2023-03-25 11:51:33'),
(561, 144, 3, '2023-03-25 12:01:53', '2023-03-25 12:01:53'),
(562, 102, 3, '2023-03-25 12:10:53', '2023-03-25 12:10:53'),
(563, 142, 3, '2023-03-25 12:19:31', '2023-03-25 12:19:31'),
(564, 140, 3, '2023-03-25 13:43:56', '2023-03-25 13:43:56'),
(565, 138, 3, '2023-03-25 13:47:15', '2023-03-25 13:47:15'),
(566, 137, 3, '2023-03-25 13:49:54', '2023-03-25 13:49:54'),
(567, 137, 4, '2023-03-25 13:49:54', '2023-03-25 13:49:54'),
(568, 137, 5, '2023-03-25 13:49:54', '2023-03-25 13:49:54'),
(569, 136, 3, '2023-03-25 13:51:54', '2023-03-25 13:51:54'),
(570, 136, 4, '2023-03-25 13:51:54', '2023-03-25 13:51:54'),
(571, 136, 5, '2023-03-25 13:51:54', '2023-03-25 13:51:54'),
(572, 135, 3, '2023-03-25 13:53:47', '2023-03-25 13:53:47'),
(573, 133, 3, '2023-03-25 13:56:36', '2023-03-25 13:56:36'),
(574, 130, 3, '2023-03-25 13:58:42', '2023-03-25 13:58:42'),
(575, 104, 3, '2023-03-25 14:00:42', '2023-03-25 14:00:42'),
(576, 106, 3, '2023-03-25 14:02:12', '2023-03-25 14:02:12'),
(577, 107, 3, '2023-03-25 14:04:29', '2023-03-25 14:04:29'),
(578, 129, 3, '2023-03-25 14:06:39', '2023-03-25 14:06:39'),
(580, 108, 3, '2023-03-25 15:21:35', '2023-03-25 15:21:35'),
(581, 108, 4, '2023-03-25 15:21:35', '2023-03-25 15:21:35'),
(582, 108, 5, '2023-03-25 15:21:35', '2023-03-25 15:21:35'),
(583, 109, 3, '2023-03-25 15:26:12', '2023-03-25 15:26:12'),
(584, 110, 3, '2023-03-25 15:30:49', '2023-03-25 15:30:49'),
(591, 112, 3, '2023-03-25 15:39:11', '2023-03-25 15:39:11'),
(592, 114, 3, '2023-03-25 15:41:59', '2023-03-25 15:41:59'),
(593, 90, 3, '2023-03-25 15:44:50', '2023-03-25 15:44:50'),
(594, 126, 3, '2023-03-25 15:59:32', '2023-03-25 15:59:32'),
(595, 126, 4, '2023-03-25 15:59:32', '2023-03-25 15:59:32'),
(596, 126, 5, '2023-03-25 15:59:32', '2023-03-25 15:59:32'),
(597, 125, 5, '2023-03-25 16:06:19', '2023-03-25 16:06:19'),
(598, 123, 3, '2023-03-25 16:11:06', '2023-03-25 16:11:06'),
(599, 122, 5, '2023-03-25 16:14:10', '2023-03-25 16:14:10'),
(600, 120, 3, '2023-03-25 16:20:12', '2023-03-25 16:20:12'),
(601, 120, 4, '2023-03-25 16:20:12', '2023-03-25 16:20:12'),
(602, 120, 5, '2023-03-25 16:20:12', '2023-03-25 16:20:12'),
(603, 118, 3, '2023-03-25 16:23:41', '2023-03-25 16:23:41'),
(604, 115, 3, '2023-03-27 13:52:41', '2023-03-27 13:52:41'),
(605, 115, 4, '2023-03-27 13:52:41', '2023-03-27 13:52:41'),
(606, 115, 5, '2023-03-27 13:52:41', '2023-03-27 13:52:41'),
(607, 103, 3, '2023-03-27 13:57:00', '2023-03-27 13:57:00'),
(608, 119, 3, '2023-03-27 14:00:05', '2023-03-27 14:00:05'),
(609, 119, 4, '2023-03-27 14:00:05', '2023-03-27 14:00:05'),
(610, 121, 3, '2023-03-27 14:07:10', '2023-03-27 14:07:10'),
(611, 116, 3, '2023-03-27 14:10:17', '2023-03-27 14:10:17'),
(612, 154, 3, '2023-03-27 14:11:08', '2023-03-27 14:11:08'),
(613, 154, 4, '2023-03-27 14:11:08', '2023-03-27 14:11:08'),
(614, 154, 5, '2023-03-27 14:11:08', '2023-03-27 14:11:08'),
(617, 77, 3, '2023-03-27 14:15:22', '2023-03-27 14:15:22'),
(620, 111, 3, '2023-03-29 12:44:03', '2023-03-29 12:44:03'),
(621, 111, 4, '2023-03-29 12:44:03', '2023-03-29 12:44:03'),
(622, 111, 5, '2023-03-29 12:44:03', '2023-03-29 12:44:03'),
(623, 64, 3, '2023-03-29 13:19:36', '2023-03-29 13:19:36'),
(624, 65, 3, '2023-03-29 17:28:38', '2023-03-29 17:28:38'),
(634, 147, 3, '2023-04-11 10:07:29', '2023-04-11 10:07:29'),
(635, 147, 4, '2023-04-11 10:07:29', '2023-04-11 10:07:29'),
(636, 147, 5, '2023-04-11 10:07:29', '2023-04-11 10:07:29'),
(646, 159, 3, '2023-05-26 15:12:29', '2023-05-26 15:12:29'),
(647, 159, 4, '2023-05-26 15:12:29', '2023-05-26 15:12:29'),
(648, 159, 5, '2023-05-26 15:12:29', '2023-05-26 15:12:29'),
(649, 160, 3, '2023-05-26 15:29:28', '2023-05-26 15:29:28'),
(650, 160, 4, '2023-05-26 15:29:28', '2023-05-26 15:29:28'),
(651, 160, 5, '2023-05-26 15:29:28', '2023-05-26 15:29:28'),
(664, 165, 3, '2023-05-30 11:42:29', '2023-05-30 11:42:29'),
(665, 165, 4, '2023-05-30 11:42:29', '2023-05-30 11:42:29'),
(666, 165, 5, '2023-05-30 11:42:29', '2023-05-30 11:42:29'),
(685, 170, 3, '2023-05-30 17:20:40', '2023-05-30 17:20:40'),
(686, 170, 4, '2023-05-30 17:20:40', '2023-05-30 17:20:40'),
(687, 170, 5, '2023-05-30 17:20:40', '2023-05-30 17:20:40'),
(701, 163, 3, '2023-06-01 17:05:06', '2023-06-01 17:05:06'),
(702, 163, 4, '2023-06-01 17:05:06', '2023-06-01 17:05:06'),
(703, 163, 5, '2023-06-01 17:05:06', '2023-06-01 17:05:06'),
(704, 161, 3, '2023-06-01 17:06:02', '2023-06-01 17:06:02'),
(705, 161, 4, '2023-06-01 17:06:02', '2023-06-01 17:06:02'),
(706, 161, 5, '2023-06-01 17:06:02', '2023-06-01 17:06:02'),
(707, 162, 3, '2023-06-01 17:06:36', '2023-06-01 17:06:36'),
(708, 162, 4, '2023-06-01 17:06:36', '2023-06-01 17:06:36'),
(709, 162, 5, '2023-06-01 17:06:36', '2023-06-01 17:06:36'),
(710, 164, 3, '2023-06-01 17:07:08', '2023-06-01 17:07:08'),
(711, 164, 4, '2023-06-01 17:07:08', '2023-06-01 17:07:08'),
(712, 164, 5, '2023-06-01 17:07:08', '2023-06-01 17:07:08'),
(719, 167, 3, '2023-06-01 17:08:43', '2023-06-01 17:08:43'),
(720, 167, 4, '2023-06-01 17:08:43', '2023-06-01 17:08:43'),
(721, 167, 5, '2023-06-01 17:08:43', '2023-06-01 17:08:43'),
(722, 169, 3, '2023-06-01 17:09:12', '2023-06-01 17:09:12'),
(723, 169, 4, '2023-06-01 17:09:12', '2023-06-01 17:09:12'),
(724, 169, 5, '2023-06-01 17:09:12', '2023-06-01 17:09:12'),
(725, 168, 3, '2023-06-01 17:09:37', '2023-06-01 17:09:37'),
(726, 168, 4, '2023-06-01 17:09:37', '2023-06-01 17:09:37'),
(727, 168, 5, '2023-06-01 17:09:37', '2023-06-01 17:09:37'),
(730, 156, 3, '2023-06-29 13:16:58', '2023-06-29 13:16:58'),
(731, 157, 3, '2023-06-29 13:19:17', '2023-06-29 13:19:17'),
(732, 157, 4, '2023-06-29 13:19:17', '2023-06-29 13:19:17'),
(733, 157, 5, '2023-06-29 13:19:17', '2023-06-29 13:19:17'),
(734, 158, 3, '2023-06-29 13:20:59', '2023-06-29 13:20:59'),
(735, 158, 4, '2023-06-29 13:20:59', '2023-06-29 13:20:59'),
(736, 158, 5, '2023-06-29 13:20:59', '2023-06-29 13:20:59'),
(740, 166, 3, '2023-06-29 14:08:26', '2023-06-29 14:08:26'),
(741, 166, 4, '2023-06-29 14:08:26', '2023-06-29 14:08:26'),
(742, 166, 5, '2023-06-29 14:08:26', '2023-06-29 14:08:26'),
(749, 83, 3, '2023-07-12 14:01:19', '2023-07-12 14:01:19'),
(750, 76, 3, '2023-07-12 14:02:33', '2023-07-12 14:02:33'),
(757, 172, 3, '2023-07-31 15:38:08', '2023-07-31 15:38:08'),
(758, 172, 4, '2023-07-31 15:38:08', '2023-07-31 15:38:08'),
(759, 172, 5, '2023-07-31 15:38:08', '2023-07-31 15:38:08'),
(760, 171, 3, '2023-07-31 15:41:25', '2023-07-31 15:41:25'),
(761, 171, 4, '2023-07-31 15:41:25', '2023-07-31 15:41:25'),
(762, 171, 5, '2023-07-31 15:41:25', '2023-07-31 15:41:25'),
(763, 79, 3, '2023-07-31 16:03:23', '2023-07-31 16:03:23'),
(764, 79, 4, '2023-07-31 16:03:23', '2023-07-31 16:03:23'),
(765, 79, 5, '2023-07-31 16:03:23', '2023-07-31 16:03:23'),
(766, 95, 3, '2023-07-31 16:22:16', '2023-07-31 16:22:16'),
(767, 95, 4, '2023-07-31 16:22:16', '2023-07-31 16:22:16'),
(768, 95, 5, '2023-07-31 16:22:16', '2023-07-31 16:22:16'),
(769, 155, 3, '2023-08-02 12:17:33', '2023-08-02 12:17:33'),
(770, 155, 4, '2023-08-02 12:17:33', '2023-08-02 12:17:33'),
(771, 155, 5, '2023-08-02 12:17:33', '2023-08-02 12:17:33'),
(787, 174, 3, '2023-09-04 13:33:15', '2023-09-04 13:33:15'),
(788, 173, 3, '2023-09-04 15:39:11', '2023-09-04 15:39:11'),
(789, 173, 4, '2023-09-04 15:39:11', '2023-09-04 15:39:11'),
(790, 173, 5, '2023-09-04 15:39:11', '2023-09-04 15:39:11'),
(806, 175, 3, '2023-09-04 17:03:35', '2023-09-04 17:03:35'),
(807, 175, 4, '2023-09-04 17:03:35', '2023-09-04 17:03:35'),
(808, 175, 5, '2023-09-04 17:03:35', '2023-09-04 17:03:35'),
(809, 175, 3, '2023-09-05 10:21:31', '2023-09-05 10:21:31'),
(810, 175, 4, '2023-09-05 10:21:31', '2023-09-05 10:21:31'),
(811, 175, 5, '2023-09-05 10:21:31', '2023-09-05 10:21:31'),
(812, 175, 3, '2023-09-05 10:21:49', '2023-09-05 10:21:49'),
(813, 175, 3, '2023-09-05 10:22:32', '2023-09-05 10:22:32'),
(814, 175, 4, '2023-09-05 10:22:32', '2023-09-05 10:22:32'),
(815, 175, 5, '2023-09-05 10:22:32', '2023-09-05 10:22:32'),
(816, 175, 7, '2023-09-05 10:22:32', '2023-09-05 10:22:32'),
(817, 175, 3, '2023-09-05 10:22:51', '2023-09-05 10:22:51'),
(818, 175, 4, '2023-09-05 10:22:51', '2023-09-05 10:22:51'),
(819, 175, 5, '2023-09-05 10:22:51', '2023-09-05 10:22:51'),
(820, 175, 7, '2023-09-05 10:22:51', '2023-09-05 10:22:51'),
(821, 175, 3, '2023-09-05 10:32:13', '2023-09-05 10:32:13'),
(822, 175, 4, '2023-09-05 10:32:13', '2023-09-05 10:32:13'),
(823, 175, 5, '2023-09-05 10:32:13', '2023-09-05 10:32:13'),
(824, 175, 7, '2023-09-05 10:32:13', '2023-09-05 10:32:13'),
(825, 175, 3, '2023-09-05 10:33:30', '2023-09-05 10:33:30'),
(826, 175, 4, '2023-09-05 10:33:30', '2023-09-05 10:33:30'),
(827, 175, 5, '2023-09-05 10:33:30', '2023-09-05 10:33:30'),
(828, 175, 7, '2023-09-05 10:33:30', '2023-09-05 10:33:30'),
(829, 175, 3, '2023-09-05 10:35:36', '2023-09-05 10:35:36'),
(830, 175, 4, '2023-09-05 10:35:36', '2023-09-05 10:35:36'),
(831, 175, 5, '2023-09-05 10:35:36', '2023-09-05 10:35:36'),
(832, 175, 7, '2023-09-05 10:35:36', '2023-09-05 10:35:36'),
(833, 175, 3, '2023-09-05 10:40:05', '2023-09-05 10:40:05'),
(834, 175, 4, '2023-09-05 10:40:05', '2023-09-05 10:40:05'),
(835, 175, 5, '2023-09-05 10:40:05', '2023-09-05 10:40:05'),
(836, 175, 7, '2023-09-05 10:40:05', '2023-09-05 10:40:05'),
(837, 178, 4, '2023-09-05 10:48:39', '2023-09-05 10:48:39'),
(838, 178, 4, '2023-09-05 10:49:09', '2023-09-05 10:49:09'),
(839, 181, 5, '2023-09-05 11:34:15', '2023-09-05 11:34:15'),
(840, 181, 6, '2023-09-05 11:34:15', '2023-09-05 11:34:15'),
(841, 181, 5, '2023-09-05 11:35:04', '2023-09-05 11:35:04'),
(842, 181, 6, '2023-09-05 11:35:04', '2023-09-05 11:35:04'),
(843, 180, 5, '2023-09-05 11:35:56', '2023-09-05 11:35:56'),
(844, 180, 6, '2023-09-05 11:35:56', '2023-09-05 11:35:56'),
(845, 181, 5, '2023-09-05 11:51:21', '2023-09-05 11:51:21'),
(846, 181, 6, '2023-09-05 11:51:21', '2023-09-05 11:51:21'),
(847, 183, 5, '2023-09-05 11:54:27', '2023-09-05 11:54:27'),
(848, 184, 5, '2023-09-05 12:07:32', '2023-09-05 12:07:32'),
(849, 184, 4, '2023-09-05 12:08:48', '2023-09-05 12:08:48'),
(850, 184, 6, '2023-09-05 12:08:48', '2023-09-05 12:08:48'),
(851, 186, 4, '2023-09-05 12:19:15', '2023-09-05 12:19:15'),
(852, 186, 4, '2023-09-05 12:19:53', '2023-09-05 12:19:53'),
(853, 190, 7, '2023-09-05 13:03:45', '2023-09-05 13:03:45'),
(854, 175, 3, '2023-09-05 13:06:27', '2023-09-05 13:06:27'),
(855, 175, 4, '2023-09-05 13:06:27', '2023-09-05 13:06:27'),
(856, 175, 5, '2023-09-05 13:06:27', '2023-09-05 13:06:27'),
(857, 175, 7, '2023-09-05 13:06:27', '2023-09-05 13:06:27'),
(858, 190, 7, '2023-09-05 13:15:15', '2023-09-05 13:15:15'),
(859, 175, 3, '2023-09-05 13:32:19', '2023-09-05 13:32:19'),
(860, 175, 4, '2023-09-05 13:32:19', '2023-09-05 13:32:19'),
(861, 175, 5, '2023-09-05 13:32:19', '2023-09-05 13:32:19'),
(862, 175, 7, '2023-09-05 13:32:19', '2023-09-05 13:32:19'),
(863, 193, 3, '2023-09-05 14:57:05', '2023-09-05 14:57:05'),
(864, 195, 5, '2023-09-05 15:03:08', '2023-09-05 15:03:08'),
(865, 195, 5, '2023-09-05 16:02:29', '2023-09-05 16:02:29'),
(866, 195, 5, '2023-09-05 18:16:40', '2023-09-05 18:16:40'),
(867, 64, 3, '2023-09-06 15:27:53', '2023-09-06 15:27:53'),
(868, 64, 3, '2023-09-06 15:44:33', '2023-09-06 15:44:33'),
(869, 64, 3, '2023-09-06 15:58:30', '2023-09-06 15:58:30'),
(870, 64, 3, '2023-09-12 15:09:02', '2023-09-12 15:09:02'),
(871, 64, 3, '2023-09-12 17:21:13', '2023-09-12 17:21:13'),
(872, 64, 3, '2023-09-12 18:26:57', '2023-09-12 18:26:57'),
(873, 64, 3, '2023-09-13 10:36:37', '2023-09-13 10:36:37'),
(874, 64, 3, '2023-09-13 10:58:06', '2023-09-13 10:58:06'),
(875, 64, 3, '2023-09-13 10:58:16', '2023-09-13 10:58:16'),
(876, 196, 3, '2023-09-13 11:06:31', '2023-09-13 11:06:31'),
(877, 64, 3, '2023-09-13 11:08:10', '2023-09-13 11:08:10'),
(878, 64, 3, '2023-09-13 12:29:59', '2023-09-13 12:29:59'),
(879, 197, 3, '2023-09-13 12:40:10', '2023-09-13 12:40:10'),
(880, 197, 3, '2023-09-13 12:42:26', '2023-09-13 12:42:26'),
(881, 196, 3, '2023-09-13 12:43:40', '2023-09-13 12:43:40'),
(882, 197, 3, '2023-09-13 13:06:09', '2023-09-13 13:06:09'),
(883, 64, 3, '2023-09-13 13:06:20', '2023-09-13 13:06:20'),
(884, 197, 3, '2023-09-13 13:22:56', '2023-09-13 13:22:56'),
(885, 197, 3, '2023-09-13 13:24:04', '2023-09-13 13:24:04'),
(886, 64, 3, '2023-09-13 14:58:11', '2023-09-13 14:58:11'),
(887, 64, 3, '2023-09-13 15:00:01', '2023-09-13 15:00:01'),
(888, 64, 3, '2023-09-13 15:04:31', '2023-09-13 15:04:31'),
(889, 64, 3, '2023-09-13 15:05:23', '2023-09-13 15:05:23'),
(890, 64, 3, '2023-09-13 16:29:42', '2023-09-13 16:29:42'),
(891, 64, 3, '2023-09-13 16:34:01', '2023-09-13 16:34:01'),
(892, 64, 3, '2023-09-13 16:42:02', '2023-09-13 16:42:02'),
(893, 64, 3, '2023-09-13 17:08:45', '2023-09-13 17:08:45'),
(894, 64, 3, '2023-09-13 17:17:41', '2023-09-13 17:17:41'),
(895, 64, 3, '2023-09-13 17:18:53', '2023-09-13 17:18:53'),
(896, 64, 3, '2023-09-13 17:19:11', '2023-09-13 17:19:11'),
(897, 64, 3, '2023-09-13 17:23:53', '2023-09-13 17:23:53'),
(898, 64, 3, '2023-09-13 17:51:37', '2023-09-13 17:51:37'),
(899, 196, 3, '2023-09-13 17:52:38', '2023-09-13 17:52:38'),
(900, 196, 3, '2023-09-13 17:53:25', '2023-09-13 17:53:25'),
(901, 64, 3, '2023-09-13 18:12:21', '2023-09-13 18:12:21'),
(902, 64, 3, '2023-09-13 18:13:00', '2023-09-13 18:13:00'),
(903, 64, 3, '2023-09-13 18:58:02', '2023-09-13 18:58:02'),
(904, 197, 3, '2023-09-13 23:32:28', '2023-09-13 23:32:28'),
(905, 198, 3, '2023-09-14 11:37:01', '2023-09-14 11:37:01'),
(906, 201, 3, '2023-11-06 13:16:33', '2023-11-06 13:16:33'),
(907, 206, 3, '2023-11-25 12:34:32', '2023-11-25 12:34:32'),
(908, 209, 3, '2023-11-25 13:05:44', '2023-11-25 13:05:44'),
(909, 210, 3, '2023-11-25 14:18:13', '2023-11-25 14:18:13'),
(910, 211, 3, '2023-11-25 14:29:18', '2023-11-25 14:29:18'),
(911, 212, 3, '2023-11-25 15:17:14', '2023-11-25 15:17:14'),
(912, 214, 3, '2023-11-25 15:29:56', '2023-11-25 15:29:56'),
(913, 215, 3, '2023-11-25 15:38:09', '2023-11-25 15:38:09'),
(914, 216, 3, '2023-11-25 15:57:07', '2023-11-25 15:57:07'),
(915, 212, 3, '2024-04-01 09:57:49', '2024-04-01 09:57:49'),
(916, 214, 3, '2024-04-01 16:00:05', '2024-04-01 16:00:05'),
(917, 216, 3, '2024-04-01 16:16:09', '2024-04-01 16:16:09'),
(918, 217, 3, '2024-04-01 16:19:04', '2024-04-01 16:19:04'),
(919, 218, 3, '2024-04-01 16:22:53', '2024-04-01 16:22:53'),
(920, 219, 3, '2024-04-01 16:30:25', '2024-04-01 16:30:25'),
(921, 220, 3, '2024-04-01 16:34:30', '2024-04-01 16:34:30'),
(922, 221, 3, '2024-04-01 17:07:14', '2024-04-01 17:07:14'),
(923, 222, 3, '2024-04-01 17:25:13', '2024-04-01 17:25:13'),
(924, 225, 3, '2024-04-04 17:07:59', '2024-04-04 17:07:59'),
(925, 227, 3, '2024-04-04 18:31:11', '2024-04-04 18:31:11'),
(926, 228, 3, '2024-04-04 18:37:27', '2024-04-04 18:37:27'),
(927, 229, 3, '2024-04-04 19:05:42', '2024-04-04 19:05:42'),
(928, 230, 3, '2024-04-04 19:06:45', '2024-04-04 19:06:45'),
(929, 231, 3, '2024-04-04 19:12:29', '2024-04-04 19:12:29'),
(930, 232, 3, '2024-04-12 16:11:58', '2024-04-12 16:11:58'),
(931, 233, 3, '2024-04-13 05:26:17', '2024-04-13 05:26:17'),
(932, 234, 3, '2024-04-15 12:19:49', '2024-04-15 12:19:49'),
(933, 236, 3, '2024-04-18 17:20:21', '2024-04-18 17:20:21'),
(934, 237, 3, '2024-04-18 17:54:21', '2024-04-18 17:54:21'),
(935, 238, 3, '2024-04-18 18:02:57', '2024-04-18 18:02:57'),
(936, 244, 3, '2024-04-20 21:24:43', '2024-04-20 21:24:43'),
(937, 246, 3, '2024-04-20 21:33:36', '2024-04-20 21:33:36'),
(938, 247, 3, '2024-04-20 21:39:06', '2024-04-20 21:39:06');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_almirah`
--

CREATE TABLE `tbl_cl_almirah` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_name` varchar(20) NOT NULL,
  `almirah` varchar(20) NOT NULL,
  `status` int(11) NOT NULL,
  `path` varchar(2000) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_almirah`
--

INSERT INTO `tbl_cl_almirah` (`id`, `college_id`, `college_name`, `room_id`, `room_name`, `almirah`, `status`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sakhi Mahila Milk Producer  Company Limited', 1, 'R1', 'A1', 1, 'media/documents/Balinee Milk Producer Company Limited/R1/A1', '2022-06-07 00:00:00', '2022-06-07 07:44:40'),
(2, 1, 'Sakhi Mahila Milk Producer  Company Limited', 1, 'R1', 'A2', 1, 'media/documents/Balinee Milk Producer Company Limited/R1/A2', '2022-06-28 00:00:00', '2022-06-28 09:47:14'),
(3, 1, 'Sakhi Mahila Milk Producer  Company Limiteds', 1, 'R1', 'a8', 1, 'media/documents/Sakhi Mahila Milk Producer  Company Limiteds/R1/a8', '2023-09-04 00:00:00', '2023-09-04 10:04:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_basic_details`
--

CREATE TABLE `tbl_cl_basic_details` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `blood_group` varchar(50) CHARACTER SET utf8 NOT NULL,
  `dob` date NOT NULL,
  `gender` varchar(25) NOT NULL,
  `caste_category_id` int(11) NOT NULL,
  `caste_category` varchar(50) NOT NULL,
  `privilage_category_id` int(11) DEFAULT NULL,
  `privilage_category` varchar(50) DEFAULT NULL,
  `income_category_id` int(11) DEFAULT NULL,
  `income_category` varchar(50) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_caste_category`
--

CREATE TABLE `tbl_cl_caste_category` (
  `id` int(11) NOT NULL,
  `caste_category` varchar(60) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_college_session`
--

CREATE TABLE `tbl_cl_college_session` (
  `id` int(11) NOT NULL,
  `session` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_college_session`
--

INSERT INTO `tbl_cl_college_session` (`id`, `session`, `created_at`, `updated_at`) VALUES
(1, '2021-2022', '2022-04-22 13:38:42', '2022-04-22 08:08:42'),
(2, '2022-2023', '2022-04-16 09:15:34', '2022-04-16 03:45:34');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_contact_numbers`
--

CREATE TABLE `tbl_cl_contact_numbers` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `country_code` varchar(10) NOT NULL,
  `contact_type` int(11) NOT NULL,
  `contact_type_name` varchar(25) DEFAULT NULL,
  `contact_number` varchar(15) NOT NULL,
  `is_primary` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_contact_types`
--

CREATE TABLE `tbl_cl_contact_types` (
  `id` int(11) NOT NULL,
  `contact_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_documents`
--

CREATE TABLE `tbl_cl_documents` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `document_name` varchar(100) DEFAULT NULL,
  `ducument_number` varchar(50) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `is_uploaded` int(11) NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_document_group`
--

CREATE TABLE `tbl_cl_document_group` (
  `id` int(11) NOT NULL,
  `group_name` varchar(222) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_document_group`
--

INSERT INTO `tbl_cl_document_group` (`id`, `group_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'HR', 1, '2022-06-07 00:00:00', '2022-06-07 07:44:17');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_document_types`
--

CREATE TABLE `tbl_cl_document_types` (
  `id` int(11) NOT NULL,
  `document_name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_employee_attendance`
--

CREATE TABLE `tbl_cl_employee_attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `attendence_type` varchar(50) DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `attendance_img` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_employee_documents`
--

CREATE TABLE `tbl_cl_employee_documents` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `document_name` varchar(100) DEFAULT NULL,
  `ducument_number` varchar(50) DEFAULT NULL,
  `document_path` varchar(255) DEFAULT NULL,
  `is_uploaded` int(11) NOT NULL,
  `description` text,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_employee_documents`
--

INSERT INTO `tbl_cl_employee_documents` (`id`, `employee_id`, `document_name`, `ducument_number`, `document_path`, `is_uploaded`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 65, 'Aadhaar Card', '817421480849', 'media/document_files/apoorva_65/Aadhaar Card_1664869189.pdf', 1, NULL, 1, '2022-09-28 05:27:52', '2022-09-28 05:27:52'),
(2, 65, 'Pan Card', 'OFJPS5419P', NULL, 0, NULL, 1, '2022-09-28 05:28:34', '2022-09-28 05:28:34'),
(3, 65, 'Salary Slips', 'SK123', 'media/document_files/apoorva_65/Salary Slips_1665721471.pdf', 1, NULL, 1, '2022-09-28 05:29:07', '2022-09-28 05:29:07'),
(4, 151, 'Bank Passbook/ Cheque book', '111111111', NULL, 0, NULL, 1, '2022-10-14 04:26:21', '2022-10-14 04:26:21'),
(5, 151, 'Driving License', '34534543', 'media/document_files/kishore_151/Driving License_1665721839.pdf', 1, NULL, 1, '2022-10-14 04:29:57', '2022-10-14 04:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_employee_file_folder`
--

CREATE TABLE `tbl_cl_employee_file_folder` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `almira_id` int(11) NOT NULL,
  `rack_id` int(11) NOT NULL,
  `file_name` varchar(222) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_employee_file_folder`
--

INSERT INTO `tbl_cl_employee_file_folder` (`id`, `employee_id`, `college_id`, `room_id`, `almira_id`, `rack_id`, `file_name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 45, 1, 1, 1, 1, 'arvind _45', 1, '2022-06-28 09:15:05', '2022-06-28 09:15:05'),
(2, 59, 1, 1, 1, 3, '59', 1, '2022-09-23 11:42:54', '2022-09-23 11:42:54'),
(3, 62, 1, 1, 1, 3, '62', 1, '2022-09-24 09:43:25', '2022-09-24 09:43:25'),
(4, 64, 1, 1, 1, 3, 'nitin', 1, '2022-09-24 11:20:30', '2022-09-24 11:20:30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_employee_folder_files`
--

CREATE TABLE `tbl_cl_employee_folder_files` (
  `id` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `almira_id` int(11) NOT NULL,
  `rack_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `file_name` varchar(222) NOT NULL,
  `docket_no` varchar(222) NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_name` varchar(222) NOT NULL,
  `document_no` varchar(100) NOT NULL,
  `document_group` varchar(222) NOT NULL,
  `is_expiry` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `tags` text,
  `document_path` text NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_employee_folder_files`
--

INSERT INTO `tbl_cl_employee_folder_files` (`id`, `employee_id`, `college_id`, `room_id`, `almira_id`, `rack_id`, `file_id`, `file_name`, `docket_no`, `document_id`, `document_name`, `document_no`, `document_group`, `is_expiry`, `expiry_date`, `tags`, `document_path`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 45, 1, 1, 1, 1, 1, 'arvind _45', 'RpsHdP8WnL', 1, 'Aadhaar Card', 'hgddhghdg', '', 1, '2022-06-28', 'Aadhaar Card,hgddhghdg', 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R1/arvind _45/Aadhaar Card_1654865421.pdf', 1, '2022-06-28 09:15:24', '2022-06-28 09:15:24'),
(2, 45, 1, 1, 1, 1, 1, 'arvind _45', 'efhqBMh0g7', 3, 'Driving License', '1222122', '1', 1, '2022-06-30', 'Driving License,1222122', 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R1/arvind _45/Driving License_1656410317.pdf', 1, '2022-06-28 10:00:08', '2022-06-28 10:00:08'),
(3, 59, 1, 1, 1, 3, 2, '59', 'JvDsqZSkUm', 6, 'Aadhaar Card', '1221112121112', '1', 1, '2022-09-23', 'Aadhaar Card,1221112121112', 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R3/59/Aadhaar Card_1663933348.pdf', 1, '2022-09-23 11:43:08', '2022-09-23 11:43:08'),
(4, 62, 1, 1, 1, 3, 3, '62', 'cwc3NuCPNz', 1, 'Aadhaar Card', '213465', '1', 1, '2022-09-25', 'Aadhaar Card,213465', 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R3/62/Aadhaar Card_1664012575.pdf', 1, '2022-09-24 09:43:42', '2022-09-24 09:43:42'),
(5, 64, 1, 1, 1, 3, 4, 'nitin', '4mWuhHMinG', 2, 'Driving License', '32121', '1', 1, '2022-09-24', 'Driving License,32121', 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R3/nitin/Driving License_1664018276.pdf', 1, '2022-09-24 11:22:28', '2022-09-24 11:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_file_folder`
--

CREATE TABLE `tbl_cl_file_folder` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `almira_id` int(11) NOT NULL,
  `rack_id` int(11) NOT NULL,
  `file_name` varchar(222) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_folder_files`
--

CREATE TABLE `tbl_cl_folder_files` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `almira_id` int(11) NOT NULL,
  `rack_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `file_name` varchar(222) NOT NULL,
  `docket_no` varchar(222) NOT NULL,
  `document_id` int(11) NOT NULL,
  `document_name` varchar(222) NOT NULL,
  `document_no` varchar(100) NOT NULL,
  `document_group` varchar(222) NOT NULL,
  `is_expiry` int(11) NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `tags` text,
  `document_path` varchar(222) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_income_category`
--

CREATE TABLE `tbl_cl_income_category` (
  `id` int(11) NOT NULL,
  `income_category` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_leave_types`
--

CREATE TABLE `tbl_cl_leave_types` (
  `id` int(11) NOT NULL,
  `leave_type` varchar(50) NOT NULL,
  `alias` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_prviliage_category`
--

CREATE TABLE `tbl_cl_prviliage_category` (
  `id` int(11) NOT NULL,
  `prviliage_category` varchar(60) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_rack`
--

CREATE TABLE `tbl_cl_rack` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `room_id` int(11) NOT NULL,
  `room_name` varchar(100) NOT NULL,
  `almira_id` int(11) NOT NULL,
  `almira_name` varchar(50) NOT NULL,
  `rack` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `path` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_rack`
--

INSERT INTO `tbl_cl_rack` (`id`, `college_id`, `college_name`, `room_id`, `room_name`, `almira_id`, `almira_name`, `rack`, `status`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sakhi Mahila Milk Producer  Company Limited', 1, 'R1', 1, 'A1', 'R1', 0, 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R1', '2022-06-07 00:00:00', '2022-09-20 07:09:06'),
(2, 1, 'Sakhi Mahila Milk Producer  Company Limited', 1, 'R1', 1, 'A1', 'R2', 0, 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R2', '2022-06-07 00:00:00', '2022-09-20 07:09:11'),
(3, 1, 'Sakhi Mahila Milk Producer  Company Limited', 1, 'R1', 1, 'A1', 'R3', 0, 'media/documents/Balinee Milk Producer Company Limited/R1/A1/R3', '2022-06-10 00:00:00', '2022-09-20 07:09:15'),
(4, 1, 'Sakhi Mahila Milk Producer  Company Limiteds', 1, 'R1', 1, 'A1', 's1', 1, 'media/documents/Sakhi Mahila Milk Producer  Company Limiteds/R1/A1/s1', '2023-09-04 15:34:51', '2023-09-04 10:04:51');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_room`
--

CREATE TABLE `tbl_cl_room` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `college_name` varchar(100) NOT NULL,
  `room` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `path` varchar(2000) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_room`
--

INSERT INTO `tbl_cl_room` (`id`, `college_id`, `college_name`, `room`, `status`, `path`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sakhi Mahila Milk Producer  Company Limited', 'R1', 1, 'media/documents/Balinee Milk Producer Company Limited/R1', '2022-06-07 00:00:00', '2022-09-20 07:08:52'),
(2, 1, 'Sakhi Mahila Milk Producer  Company Limiteds', '9', 1, 'media/documents/Sakhi Mahila Milk Producer  Company Limiteds/9', '2023-09-04 15:33:48', '2023-09-04 10:03:48');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_section`
--

CREATE TABLE `tbl_cl_section` (
  `id` int(11) NOT NULL,
  `section_name` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_user_leaves`
--

CREATE TABLE `tbl_cl_user_leaves` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `leave_type_id` int(11) NOT NULL,
  `leave_status` int(11) NOT NULL DEFAULT '0',
  `leave_type` varchar(50) NOT NULL,
  `leave_from_date` datetime DEFAULT NULL,
  `leave_to_date` datetime DEFAULT NULL,
  `leave_detail` text NOT NULL,
  `remark` text,
  `attachment` varchar(255) DEFAULT NULL,
  `is_first_half_day` int(11) DEFAULT '0',
  `is_last_half_day` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_user_tracking`
--

CREATE TABLE `tbl_cl_user_tracking` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `latitude` varchar(25) DEFAULT NULL,
  `longitude` varchar(25) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cl_working_shifts`
--

CREATE TABLE `tbl_cl_working_shifts` (
  `id` int(11) NOT NULL,
  `working_shift` varchar(255) NOT NULL,
  `start_timing` time DEFAULT NULL,
  `end_timing` time DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cl_working_shifts`
--

INSERT INTO `tbl_cl_working_shifts` (`id`, `working_shift`, `start_timing`, `end_timing`, `status`, `created_at`, `updated_at`) VALUES
(3, 'General Shift', '08:30:00', '22:30:00', 1, '2022-06-08 05:56:08', '2024-04-18 13:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_colleges`
--

CREATE TABLE `tbl_colleges` (
  `id` int(11) NOT NULL,
  `college_name` text NOT NULL,
  `alias` varchar(255) NOT NULL,
  `college_address` text NOT NULL,
  `college_logo` varchar(255) NOT NULL,
  `college_contacts` varchar(255) DEFAULT NULL,
  `whatsapp_link` varchar(255) NOT NULL,
  `college_website` varchar(255) DEFAULT NULL,
  `label_strip` varchar(255) NOT NULL,
  `prospectus` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_country`
--

CREATE TABLE `tbl_country` (
  `id` int(11) NOT NULL,
  `country_name` varchar(15) NOT NULL,
  `country_code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_country`
--

INSERT INTO `tbl_country` (`id`, `country_name`, `country_code`) VALUES
(1, 'India', '91'),
(2, 'USA', '000'),
(3, 'SINGAPORE', '001'),
(4, 'AUSTRALIA', '002'),
(5, 'QATAR', '005');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_course_types`
--

CREATE TABLE `tbl_course_types` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `course_type` varchar(255) NOT NULL,
  `eligibility` varchar(255) DEFAULT NULL,
  `course_persuing_id` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_district`
--

CREATE TABLE `tbl_district` (
  `id` int(11) NOT NULL,
  `district_name` varchar(100) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `latlong` varchar(30) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_education_details`
--

CREATE TABLE `tbl_education_details` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `course_name` varchar(111) NOT NULL,
  `institute` varchar(255) NOT NULL,
  `university` varchar(111) NOT NULL,
  `other_board` varchar(255) DEFAULT NULL,
  `stream` varchar(111) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `percent` varchar(255) DEFAULT NULL,
  `address` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entrance_otp`
--

CREATE TABLE `tbl_entrance_otp` (
  `id` int(11) NOT NULL,
  `student_contact` varchar(15) NOT NULL,
  `otp` varchar(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entrance_quiz`
--

CREATE TABLE `tbl_entrance_quiz` (
  `id` int(11) NOT NULL,
  `candidate_id` int(11) NOT NULL,
  `quiz_start_datetime` datetime DEFAULT NULL,
  `quiz_end_datetime` datetime DEFAULT NULL,
  `question_answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `result` float(4,2) DEFAULT NULL,
  `time_left` time DEFAULT NULL,
  `last_position` int(11) NOT NULL DEFAULT '1',
  `is_notified` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_entrance_registration`
--

CREATE TABLE `tbl_entrance_registration` (
  `id` int(11) NOT NULL,
  `registration_id` varchar(255) DEFAULT NULL,
  `student_name` varchar(255) NOT NULL,
  `contact` varchar(15) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `class_passed` int(11) DEFAULT NULL,
  `photo` varchar(500) DEFAULT NULL,
  `address_hno` varchar(255) DEFAULT NULL,
  `address_locality` varchar(255) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `address_village` varchar(255) DEFAULT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `address_tehsil` varchar(255) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `address_district` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `address_state` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `entrance_status` int(11) NOT NULL DEFAULT '0',
  `is_student` int(11) DEFAULT '0',
  `referenced_by_name` varchar(255) DEFAULT NULL,
  `referenced_by_branch_id` int(11) DEFAULT NULL,
  `referenced_by_branch_name` varchar(255) DEFAULT NULL,
  `referenced_by_year` varchar(255) DEFAULT NULL,
  `registered_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_failed_payments`
--

CREATE TABLE `tbl_failed_payments` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) DEFAULT NULL,
  `bank_ref_number` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `amount` float(10,2) DEFAULT NULL,
  `payment_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_visit`
--

CREATE TABLE `tbl_home_visit` (
  `id` int(11) NOT NULL,
  `faculty_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `registration_no` varchar(112) NOT NULL,
  `college_id` int(11) NOT NULL,
  `guardian_relation` varchar(255) NOT NULL,
  `mob_no` varchar(15) DEFAULT NULL,
  `address_hno` varchar(255) NOT NULL,
  `address_locality` varchar(255) NOT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(200) NOT NULL,
  `district_id` varchar(255) NOT NULL,
  `district_name` varchar(200) NOT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `tehsil_name` varchar(200) NOT NULL,
  `village_id` int(11) DEFAULT NULL,
  `village_name` varchar(200) DEFAULT NULL,
  `pincode` varchar(8) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL,
  `opinion` varchar(500) DEFAULT NULL,
  `rating` decimal(4,2) NOT NULL,
  `field_report` varchar(200) DEFAULT NULL,
  `selfie_with_parents` varchar(200) DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `support_staff` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `visit_audio` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_idcard_otp`
--

CREATE TABLE `tbl_idcard_otp` (
  `id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_individual_visit`
--

CREATE TABLE `tbl_individual_visit` (
  `id` int(11) NOT NULL,
  `student_name` varchar(200) NOT NULL,
  `student_image` varchar(200) NOT NULL,
  `guardian_name` varchar(200) NOT NULL,
  `student_contact` varchar(15) NOT NULL,
  `referred_by_teacher` varchar(200) NOT NULL,
  `referred_by_student` varchar(200) NOT NULL,
  `branch_id` int(11) NOT NULL,
  `branch_name` varchar(200) NOT NULL,
  `year` varchar(100) NOT NULL,
  `highschool_in_year` int(11) NOT NULL,
  `address_hno` varchar(200) NOT NULL,
  `address_locality` varchar(200) DEFAULT NULL,
  `village_id` int(11) NOT NULL,
  `address_village` varchar(200) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `address_tehsil` varchar(200) NOT NULL,
  `district_id` int(11) NOT NULL,
  `address_district` varchar(200) NOT NULL,
  `state_id` int(11) NOT NULL,
  `address_state` varchar(200) NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `school_name` varchar(200) NOT NULL,
  `school_address` varchar(200) NOT NULL,
  `coaching_name` varchar(200) DEFAULT NULL,
  `coaching_teacher` varchar(200) DEFAULT NULL,
  `coaching_address` varchar(200) DEFAULT NULL,
  `selfie` varchar(500) DEFAULT NULL,
  `latitude` float(12,10) NOT NULL,
  `longitude` float(12,10) NOT NULL,
  `visited_by` int(11) NOT NULL,
  `visited_datetime` datetime NOT NULL,
  `remark` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_individual_visit_history`
--

CREATE TABLE `tbl_individual_visit_history` (
  `id` int(11) NOT NULL,
  `individual_student_id` int(11) NOT NULL,
  `student_name` varchar(200) DEFAULT NULL,
  `student_contact` varchar(200) DEFAULT NULL,
  `student_image` varchar(200) DEFAULT NULL,
  `guardian_name` varchar(200) DEFAULT NULL,
  `referred_by_teacher` varchar(200) DEFAULT NULL,
  `referred_by_student` varchar(200) DEFAULT NULL,
  `branch_id` int(11) DEFAULT NULL,
  `branch_name` varchar(200) DEFAULT NULL,
  `year` varchar(100) DEFAULT NULL,
  `highschool_in_year` int(11) DEFAULT NULL,
  `address_hno` varchar(200) DEFAULT NULL,
  `address_locality` varchar(200) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `address_village` varchar(200) DEFAULT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `address_tehsil` varchar(200) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `address_district` varchar(200) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `address_state` varchar(200) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `school_address` varchar(200) DEFAULT NULL,
  `coaching_name` varchar(200) DEFAULT NULL,
  `coaching_teacher` varchar(200) DEFAULT NULL,
  `coaching_address` varchar(200) DEFAULT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `visited_by` int(11) NOT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_datetime` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_new_district`
--

CREATE TABLE `tbl_new_district` (
  `id` int(11) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_new_district`
--

INSERT INTO `tbl_new_district` (`id`, `state_id`, `district_name`) VALUES
(5, 2, 'Al Tarfa'),
(26, 2, 'Jelaiah'),
(29, 2, 'Al Rufaa'),
(35, 2, 'Lejbailat'),
(36, 2, 'Dibiyapur'),
(42, 2, 'Onaiza'),
(46, 2, 'Al Dafna'),
(54, 2, 'Mushayrib'),
(55, 2, 'Rumeilah'),
(63, 2, 'Wadi Al Sail'),
(66, 2, 'Mushayrib'),
(67, 2, 'Al Jasrah'),
(68, 2, 'Al Bidda');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_new_tehsil`
--

CREATE TABLE `tbl_new_tehsil` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `tehsil_name` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_new_villages`
--

CREATE TABLE `tbl_new_villages` (
  `id` int(11) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `village_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_payments`
--

CREATE TABLE `tbl_payments` (
  `id` int(11) NOT NULL,
  `registration_id` int(11) NOT NULL,
  `bank_ref_number` varchar(255) NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `payment_mode` varchar(255) DEFAULT NULL,
  `amount` float(10,2) NOT NULL,
  `status` int(11) NOT NULL,
  `payment_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_questionnaire`
--

CREATE TABLE `tbl_questionnaire` (
  `id` int(11) NOT NULL,
  `semester` int(11) DEFAULT NULL,
  `academic_year` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `input_flag` tinyint(1) NOT NULL,
  `input_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-> None\r\n1-> Integer\r\n2-> Text',
  `max_value` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_quiz_questionnaire`
--

CREATE TABLE `tbl_quiz_questionnaire` (
  `id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL COMMENT '1->Physics, 2->Chemistry, 3->Maths',
  `question` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `option_1` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `option_2` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `option_3` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `option_4` text NOT NULL,
  `answer_key` enum('1','2','3','4') NOT NULL,
  `language` int(11) NOT NULL COMMENT '0-> Hindi, 1-> English',
  `for_class` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_registration`
--

CREATE TABLE `tbl_registration` (
  `id` int(11) NOT NULL,
  `college_id` int(11) NOT NULL,
  `first_name` varchar(111) CHARACTER SET utf8 NOT NULL,
  `middle_name` varchar(111) NOT NULL,
  `last_name` varchar(111) NOT NULL,
  `father_name` varchar(111) NOT NULL,
  `dob` date NOT NULL,
  `primary_contact_no` varchar(55) NOT NULL,
  `secondary_contact_no` varchar(55) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `aadhaar_no` varchar(55) NOT NULL,
  `aadhaar_front_image` varchar(255) NOT NULL,
  `aadhaar_back_image` varchar(255) NOT NULL,
  `state_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `tehsil_id` int(11) NOT NULL,
  `block` varchar(255) NOT NULL,
  `village` varchar(255) NOT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `course_persuing_id` int(11) NOT NULL COMMENT '1=10th\r\n2=10+1\r\n3=12th\r\n4=graduation\r\n',
  `branch_1` varchar(55) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `otp` int(11) DEFAULT NULL,
  `is_otp_expired` int(11) NOT NULL DEFAULT '0',
  `is_paid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_contact`
--

CREATE TABLE `tbl_school_contact` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `contact_type` varchar(100) DEFAULT NULL,
  `is_referred` int(11) NOT NULL DEFAULT '0',
  `referred_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_contact_history`
--

CREATE TABLE `tbl_school_contact_history` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `school_contact_id` int(11) NOT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `contact_type` varchar(100) DEFAULT NULL,
  `is_referred` int(11) NOT NULL DEFAULT '0',
  `referred_by` varchar(255) DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_visit`
--

CREATE TABLE `tbl_school_visit` (
  `id` int(11) NOT NULL,
  `school_name` varchar(255) NOT NULL,
  `school_image` varchar(255) DEFAULT NULL,
  `school_contact` varchar(15) NOT NULL,
  `address_hno` varchar(200) NOT NULL,
  `address_locality` varchar(200) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `state_name` varchar(200) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district_name` varchar(200) NOT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `tehsil_name` varchar(200) NOT NULL,
  `village_id` int(11) DEFAULT NULL,
  `village_name` varchar(200) NOT NULL,
  `pincode` int(11) DEFAULT NULL,
  `high_school_students` int(11) DEFAULT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `selfie` varchar(200) DEFAULT NULL,
  `support_staff` longtext,
  `visited_datetime` datetime NOT NULL,
  `remark` text,
  `visited_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_school_visit_history`
--

CREATE TABLE `tbl_school_visit_history` (
  `id` int(11) NOT NULL,
  `school_id` int(11) NOT NULL,
  `school_name` varchar(255) DEFAULT NULL,
  `school_contact` varchar(15) DEFAULT NULL,
  `school_image` varchar(255) DEFAULT NULL,
  `address_hno` varchar(200) DEFAULT NULL,
  `address_locality` varchar(200) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `village_name` varchar(200) DEFAULT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `tehsil_name` varchar(200) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `district_name` varchar(200) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `state_name` varchar(200) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `high_school_students` int(11) DEFAULT NULL,
  `remark` text,
  `visited_by` int(11) DEFAULT NULL,
  `edited_by` int(11) NOT NULL,
  `edited_datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_semester`
--

CREATE TABLE `tbl_semester` (
  `id` int(11) NOT NULL,
  `semester_id` varchar(11) NOT NULL,
  `sem_name` varchar(222) NOT NULL,
  `type` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_semester`
--

INSERT INTO `tbl_semester` (`id`, `semester_id`, `sem_name`, `type`) VALUES
(1, 'sem_1', '1st Semester', 'semester'),
(2, 'sem_2', '2nd Semester', 'semester'),
(3, 'sem_3', '3rd Semester', 'semester'),
(4, 'sem_4', '4th Semester', 'semester'),
(5, 'sem_5', '5th Semester', 'semester'),
(6, 'sem_6', '6th Semester', 'semester'),
(7, 'year_1', '1st Year', 'yearly'),
(8, 'year_2', '2nd Year', 'yearly'),
(9, 'year_3', '3rd Year', 'yearly');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ss_candidates`
--

CREATE TABLE `tbl_ss_candidates` (
  `id` int(11) NOT NULL,
  `candidate_name` varchar(100) NOT NULL,
  `contact_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `candidate_image` varchar(500) DEFAULT NULL,
  `current_designation` varchar(70) NOT NULL,
  `current_organization` varchar(150) NOT NULL,
  `total_experience` float NOT NULL DEFAULT '0',
  `current_ctc` float NOT NULL DEFAULT '0',
  `current_location` text NOT NULL,
  `education_qualification` varchar(255) NOT NULL,
  `education_year` year(4) DEFAULT NULL,
  `education_college` varchar(255) DEFAULT NULL,
  `key_skills` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '0->Pending,1->Shortlisted,2->Rejected',
  `resume` varchar(255) DEFAULT NULL,
  `applied_on` date NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_ss_candidates`
--

INSERT INTO `tbl_ss_candidates` (`id`, `candidate_name`, `contact_number`, `email`, `candidate_image`, `current_designation`, `current_organization`, `total_experience`, `current_ctc`, `current_location`, `education_qualification`, `education_year`, `education_college`, `key_skills`, `last_activity`, `status`, `resume`, `applied_on`, `created_at`, `updated_at`) VALUES
(1, 'Jalaj Tripathi', '9876987621', 'jjalaj@gmail.com', NULL, 'Tester', 'SSS', 3, 2000000, 'Lucknow', 'B.E. (CSE)', '2020', 'SJEC', 'Python,mysql,JS', '2022-06-03 13:18:19', 2, NULL, '2022-06-01', '2022-06-03 13:19:49', '2022-06-03 13:19:49');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_states`
--

CREATE TABLE `tbl_states` (
  `id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `inter_state` int(11) DEFAULT NULL,
  `state_code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_states`
--

INSERT INTO `tbl_states` (`id`, `country_id`, `country_name`, `state`, `inter_state`, `state_code`, `created_at`, `updated_at`) VALUES
(2, 5, 'QATAR', 'Ad-Dawhah', 1, '	09', '2021-04-06 02:08:07', '2024-03-31 12:40:44'),
(3, 5, 'QATAR', 'Mushayrib', 0, '07', '2021-04-06 02:08:07', '2024-03-31 12:45:33'),
(5, 5, 'QATAR', 'Al Jasrah', 1, '03', '2021-04-06 02:08:07', '2024-03-31 12:45:45'),
(13, 1, 'India', 'F&B', NULL, NULL, '2024-04-06 11:53:53', '2024-04-06 11:53:53');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `id` int(11) NOT NULL,
  `admission_session` int(11) NOT NULL,
  `form_no` varchar(50) NOT NULL,
  `reg_no` varchar(222) DEFAULT NULL,
  `salutation` varchar(10) NOT NULL,
  `first_name` varchar(111) CHARACTER SET utf8 NOT NULL,
  `middle_name` varchar(111) DEFAULT NULL,
  `last_name` varchar(111) DEFAULT NULL,
  `college_id` int(11) DEFAULT NULL,
  `college_name` varchar(222) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `father_name` varchar(111) NOT NULL,
  `mother_name` varchar(255) DEFAULT NULL,
  `teacher_gaurdian_name` varchar(255) DEFAULT NULL,
  `primary_contact_no` varchar(55) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `aadhaar_no` varchar(55) DEFAULT NULL,
  `aadhaar_front_image` varchar(255) DEFAULT NULL,
  `secondary_phone_no` varchar(15) DEFAULT NULL,
  `secondary_phone_relative` varchar(200) DEFAULT NULL,
  `SBAT_id` varchar(50) DEFAULT NULL,
  `SBAT_percentage` varchar(50) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `district_id` int(11) DEFAULT NULL,
  `tehsil_id` int(11) DEFAULT NULL,
  `village_id` int(11) DEFAULT NULL,
  `address_hno` varchar(255) DEFAULT NULL,
  `address_locality` varchar(255) DEFAULT NULL,
  `per_country_id` int(11) DEFAULT NULL,
  `per_state_id` int(11) DEFAULT NULL,
  `per_district_id` int(11) DEFAULT NULL,
  `per_tehsil_id` int(11) DEFAULT NULL,
  `per_village_id` int(11) DEFAULT NULL,
  `per_address_hno` varchar(255) DEFAULT NULL,
  `per_address_locality` varchar(255) DEFAULT NULL,
  `course_type_id` int(11) DEFAULT NULL,
  `cros_pincode` int(11) NOT NULL,
  `per_pincode` int(11) NOT NULL,
  `course_type_name` varchar(100) DEFAULT NULL,
  `branch_id` varchar(55) NOT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `year_id` int(11) DEFAULT NULL,
  `semester_id` varchar(22) NOT NULL,
  `section_id` int(11) DEFAULT NULL,
  `finger_iso_1` longtext,
  `finger_iso_2` longtext,
  `profile_image` text,
  `student_image` varchar(255) DEFAULT NULL,
  `blood_group` varchar(10) DEFAULT NULL,
  `is_registered` int(11) NOT NULL DEFAULT '0',
  `registered_date` datetime DEFAULT NULL,
  `is_mobile_verified` int(11) NOT NULL DEFAULT '0',
  `otp` int(11) DEFAULT NULL,
  `is_otp_expired` int(11) NOT NULL DEFAULT '0',
  `id_card_pin` int(11) DEFAULT NULL,
  `is_id_card_pin_verified` int(11) NOT NULL DEFAULT '0',
  `is_id_card_generated` tinyint(1) NOT NULL DEFAULT '0',
  `id_card_link` varchar(255) DEFAULT NULL,
  `id_card_created_at` datetime DEFAULT NULL,
  `id_card_attempts_left` int(11) NOT NULL DEFAULT '3',
  `is_paid` int(11) NOT NULL DEFAULT '0',
  `visit_status` tinyint(1) NOT NULL DEFAULT '0',
  `last_visit_datetime` datetime DEFAULT NULL,
  `latitude` varchar(100) DEFAULT NULL,
  `longitude` varchar(100) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_subjects`
--

CREATE TABLE `tbl_subjects` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_subjects`
--

INSERT INTO `tbl_subjects` (`id`, `name`, `description`) VALUES
(1, 'Physics', 'Test'),
(2, 'Chemistry', 'Test'),
(3, 'Mathematics', 'Test');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tehsil`
--

CREATE TABLE `tbl_tehsil` (
  `id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `tehsil_name` varchar(100) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `latlong` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_web_tokens`
--

CREATE TABLE `tbl_user_web_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_verified_mobile`
--

CREATE TABLE `tbl_verified_mobile` (
  `id` int(11) NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `otp` varchar(22) DEFAULT NULL,
  `isVerified` int(11) NOT NULL DEFAULT '0' COMMENT '0=Not Verrified\r\n1=Verrfied',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_village`
--

CREATE TABLE `tbl_village` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  `village_name` varchar(100) NOT NULL,
  `village_code` int(11) DEFAULT NULL,
  `latlong` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visits`
--

CREATE TABLE `tbl_visits` (
  `id` int(11) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `page` varchar(255) DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_visit_otp`
--

CREATE TABLE `tbl_visit_otp` (
  `id` int(11) NOT NULL,
  `mobile_no` varchar(55) NOT NULL,
  `otp` varchar(50) NOT NULL,
  `student_id` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `tb_cl_contact_types`
--

CREATE TABLE `tb_cl_contact_types` (
  `id` int(11) NOT NULL,
  `contact_type` varchar(100) NOT NULL,
  `status` int(11) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `t_track_services`
--

CREATE TABLE `t_track_services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `t_track_services`
--

INSERT INTO `t_track_services` (`id`, `service_name`) VALUES
(1, 'Energy Storage System'),
(2, 'IT- App and Web'),
(3, 'SEO & SMO'),
(4, 'IT Service'),
(5, 'Energy Audit & Carbon Trading');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_notifications`
--
ALTER TABLE `activity_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_app_tokens`
--
ALTER TABLE `admin_app_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contract_type`
--
ALTER TABLE `contract_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `financial_monthly`
--
ALTER TABLE `financial_monthly`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fy_id` (`fy_id`,`month`);

--
-- Indexes for table `financial_year_data`
--
ALTER TABLE `financial_year_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `FY_id` (`FY_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spemployeesalarydata`
--
ALTER TABLE `spemployeesalarydata`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_activity_logs`
--
ALTER TABLE `sp_activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_additional_responsibilities`
--
ALTER TABLE `sp_additional_responsibilities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_addresses`
--
ALTER TABLE `sp_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `sp_admission_procedures`
--
ALTER TABLE `sp_admission_procedures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_admission_procedure_branches`
--
ALTER TABLE `sp_admission_procedure_branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_approval_status`
--
ALTER TABLE `sp_approval_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_attendance_groups`
--
ALTER TABLE `sp_attendance_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_attributes`
--
ALTER TABLE `sp_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_banks`
--
ALTER TABLE `sp_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_bank_details`
--
ALTER TABLE `sp_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_basic_details`
--
ALTER TABLE `sp_basic_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `working_shift_id` (`working_shift_id`);

--
-- Indexes for table `sp_business_types`
--
ALTER TABLE `sp_business_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_cities`
--
ALTER TABLE `sp_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_id` (`state_id`);

--
-- Indexes for table `sp_color_codes`
--
ALTER TABLE `sp_color_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_company_detail`
--
ALTER TABLE `sp_company_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_contacts`
--
ALTER TABLE `sp_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_contact_numbers`
--
ALTER TABLE `sp_contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_contact_tags`
--
ALTER TABLE `sp_contact_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_contact_types`
--
ALTER TABLE `sp_contact_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_core_business_area`
--
ALTER TABLE `sp_core_business_area`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_countries`
--
ALTER TABLE `sp_countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_country_codes`
--
ALTER TABLE `sp_country_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_currency_code`
--
ALTER TABLE `sp_currency_code`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_departments`
--
ALTER TABLE `sp_departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organization_id` (`organization_id`) USING BTREE;

--
-- Indexes for table `sp_drivers`
--
ALTER TABLE `sp_drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_driver_addresses`
--
ALTER TABLE `sp_driver_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `state_id` (`state_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `sp_driver_basic_details`
--
ALTER TABLE `sp_driver_basic_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_driver_contact_numbers`
--
ALTER TABLE `sp_driver_contact_numbers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_employee_payroll_master`
--
ALTER TABLE `sp_employee_payroll_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_favorites`
--
ALTER TABLE `sp_favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_financial_years`
--
ALTER TABLE `sp_financial_years`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_foc_requests`
--
ALTER TABLE `sp_foc_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_follow_up`
--
ALTER TABLE `sp_follow_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_fuel_type`
--
ALTER TABLE `sp_fuel_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_holidays`
--
ALTER TABLE `sp_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_holiday_types`
--
ALTER TABLE `sp_holiday_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_income_categories`
--
ALTER TABLE `sp_income_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_insurance_coverage`
--
ALTER TABLE `sp_insurance_coverage`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_iso_master`
--
ALTER TABLE `sp_iso_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_lead_basic`
--
ALTER TABLE `sp_lead_basic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_lead_iso`
--
ALTER TABLE `sp_lead_iso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_lead_iso_save`
--
ALTER TABLE `sp_lead_iso_save`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_lead_ledger`
--
ALTER TABLE `sp_lead_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_lead_other`
--
ALTER TABLE `sp_lead_other`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_leave_policies`
--
ALTER TABLE `sp_leave_policies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_leave_policy_details`
--
ALTER TABLE `sp_leave_policy_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_leave_types`
--
ALTER TABLE `sp_leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_leave_type_documents`
--
ALTER TABLE `sp_leave_type_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_license_category`
--
ALTER TABLE `sp_license_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_mode_of_payments`
--
ALTER TABLE `sp_mode_of_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_modules`
--
ALTER TABLE `sp_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_module_permissions`
--
ALTER TABLE `sp_module_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `sub_module_id` (`sub_module_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `sp_notifications`
--
ALTER TABLE `sp_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_odo_meter`
--
ALTER TABLE `sp_odo_meter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_organizations`
--
ALTER TABLE `sp_organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_password_resets`
--
ALTER TABLE `sp_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_payroll_master`
--
ALTER TABLE `sp_payroll_master`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_pay_bands`
--
ALTER TABLE `sp_pay_bands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_pay_grades`
--
ALTER TABLE `sp_pay_grades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_permissions`
--
ALTER TABLE `sp_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_permission_workflows`
--
ALTER TABLE `sp_permission_workflows`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_permission_workflow_roles`
--
ALTER TABLE `sp_permission_workflow_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_petro_card`
--
ALTER TABLE `sp_petro_card`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_previlege_categories`
--
ALTER TABLE `sp_previlege_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_procure_collection`
--
ALTER TABLE `sp_procure_collection`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_reasons`
--
ALTER TABLE `sp_reasons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_regularization`
--
ALTER TABLE `sp_regularization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_required_documents`
--
ALTER TABLE `sp_required_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_roles`
--
ALTER TABLE `sp_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `organization_id` (`organization_id`);

--
-- Indexes for table `sp_role_activities`
--
ALTER TABLE `sp_role_activities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_role_attributes`
--
ALTER TABLE `sp_role_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_role_attr_hidden_fields`
--
ALTER TABLE `sp_role_attr_hidden_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_role_attr_optional_fields`
--
ALTER TABLE `sp_role_attr_optional_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_role_entity_mapping`
--
ALTER TABLE `sp_role_entity_mapping`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_role_permissions`
--
ALTER TABLE `sp_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `sub_module_id` (`sub_module_id`),
  ADD KEY `permission_id` (`permission_id`);

--
-- Indexes for table `sp_role_workflow_permissions`
--
ALTER TABLE `sp_role_workflow_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_routes`
--
ALTER TABLE `sp_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_salary_addition_types`
--
ALTER TABLE `sp_salary_addition_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_salary_deduction_types`
--
ALTER TABLE `sp_salary_deduction_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_salary_head`
--
ALTER TABLE `sp_salary_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_salary_head_type`
--
ALTER TABLE `sp_salary_head_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_salary_slip_pdf`
--
ALTER TABLE `sp_salary_slip_pdf`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `sp_sessions`
--
ALTER TABLE `sp_sessions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_states`
--
ALTER TABLE `sp_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `sp_sub_modules`
--
ALTER TABLE `sp_sub_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `sp_tags`
--
ALTER TABLE `sp_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_ta_request`
--
ALTER TABLE `sp_ta_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_ta_request_details`
--
ALTER TABLE `sp_ta_request_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_towns`
--
ALTER TABLE `sp_towns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_users`
--
ALTER TABLE `sp_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `official_email` (`official_email`);

--
-- Indexes for table `sp_user_academic_details`
--
ALTER TABLE `sp_user_academic_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_attendance`
--
ALTER TABLE `sp_user_attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_user_bank_details`
--
ALTER TABLE `sp_user_bank_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_biometric_details`
--
ALTER TABLE `sp_user_biometric_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_business_details`
--
ALTER TABLE `sp_user_business_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_contacts`
--
ALTER TABLE `sp_user_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_documents`
--
ALTER TABLE `sp_user_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_financial_details`
--
ALTER TABLE `sp_user_financial_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_leaves`
--
ALTER TABLE `sp_user_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_leave_document`
--
ALTER TABLE `sp_user_leave_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_leave_policy_ledger`
--
ALTER TABLE `sp_user_leave_policy_ledger`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_location_logs`
--
ALTER TABLE `sp_user_location_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_notifications`
--
ALTER TABLE `sp_user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_official_details`
--
ALTER TABLE `sp_user_official_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_otp`
--
ALTER TABLE `sp_user_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_personal_details`
--
ALTER TABLE `sp_user_personal_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_regularization`
--
ALTER TABLE `sp_user_regularization`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_role_permissions`
--
ALTER TABLE `sp_user_role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `sub_module_id` (`sub_module_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_user_role_workflow_permissions`
--
ALTER TABLE `sp_user_role_workflow_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `sp_user_salary_slip`
--
ALTER TABLE `sp_user_salary_slip`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indexes for table `sp_user_tags`
--
ALTER TABLE `sp_user_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_tracking`
--
ALTER TABLE `sp_user_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_user_travel_history`
--
ALTER TABLE `sp_user_travel_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicles`
--
ALTER TABLE `sp_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_class`
--
ALTER TABLE `sp_vehicle_class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_financer`
--
ALTER TABLE `sp_vehicle_financer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_fitness_details`
--
ALTER TABLE `sp_vehicle_fitness_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_insurance_details`
--
ALTER TABLE `sp_vehicle_insurance_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_insurer`
--
ALTER TABLE `sp_vehicle_insurer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_maker`
--
ALTER TABLE `sp_vehicle_maker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_maker_classification`
--
ALTER TABLE `sp_vehicle_maker_classification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_pollution_details`
--
ALTER TABLE `sp_vehicle_pollution_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_registration_details`
--
ALTER TABLE `sp_vehicle_registration_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_roadpermit_details`
--
ALTER TABLE `sp_vehicle_roadpermit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_tracking`
--
ALTER TABLE `sp_vehicle_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_types`
--
ALTER TABLE `sp_vehicle_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_vehicle_warranty_details`
--
ALTER TABLE `sp_vehicle_warranty_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_workflow_levels`
--
ALTER TABLE `sp_workflow_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_working_hours`
--
ALTER TABLE `sp_working_hours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sp_working_shifts`
--
ALTER TABLE `sp_working_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `working_shift` (`working_shift`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_block`
--
ALTER TABLE `tbl_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_allocated_shifts`
--
ALTER TABLE `tbl_cl_allocated_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_almirah`
--
ALTER TABLE `tbl_cl_almirah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_basic_details`
--
ALTER TABLE `tbl_cl_basic_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Student_unique_id` (`student_id`);

--
-- Indexes for table `tbl_cl_caste_category`
--
ALTER TABLE `tbl_cl_caste_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_college_session`
--
ALTER TABLE `tbl_cl_college_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_contact_numbers`
--
ALTER TABLE `tbl_cl_contact_numbers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_contact_types`
--
ALTER TABLE `tbl_cl_contact_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_documents`
--
ALTER TABLE `tbl_cl_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_document_group`
--
ALTER TABLE `tbl_cl_document_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_document_types`
--
ALTER TABLE `tbl_cl_document_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_employee_attendance`
--
ALTER TABLE `tbl_cl_employee_attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_employee_documents`
--
ALTER TABLE `tbl_cl_employee_documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_employee_file_folder`
--
ALTER TABLE `tbl_cl_employee_file_folder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_employee_folder_files`
--
ALTER TABLE `tbl_cl_employee_folder_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_file_folder`
--
ALTER TABLE `tbl_cl_file_folder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_folder_files`
--
ALTER TABLE `tbl_cl_folder_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_income_category`
--
ALTER TABLE `tbl_cl_income_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_leave_types`
--
ALTER TABLE `tbl_cl_leave_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_prviliage_category`
--
ALTER TABLE `tbl_cl_prviliage_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_rack`
--
ALTER TABLE `tbl_cl_rack`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_room`
--
ALTER TABLE `tbl_cl_room`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_section`
--
ALTER TABLE `tbl_cl_section`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_user_leaves`
--
ALTER TABLE `tbl_cl_user_leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_user_tracking`
--
ALTER TABLE `tbl_cl_user_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_cl_working_shifts`
--
ALTER TABLE `tbl_cl_working_shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `working_shift` (`working_shift`);

--
-- Indexes for table `tbl_colleges`
--
ALTER TABLE `tbl_colleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_country`
--
ALTER TABLE `tbl_country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_course_types`
--
ALTER TABLE `tbl_course_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_district`
--
ALTER TABLE `tbl_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_education_details`
--
ALTER TABLE `tbl_education_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_entrance_otp`
--
ALTER TABLE `tbl_entrance_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_entrance_quiz`
--
ALTER TABLE `tbl_entrance_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_entrance_registration`
--
ALTER TABLE `tbl_entrance_registration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `contact` (`contact`);

--
-- Indexes for table `tbl_failed_payments`
--
ALTER TABLE `tbl_failed_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_home_visit`
--
ALTER TABLE `tbl_home_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_idcard_otp`
--
ALTER TABLE `tbl_idcard_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_individual_visit`
--
ALTER TABLE `tbl_individual_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_individual_visit_history`
--
ALTER TABLE `tbl_individual_visit_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_new_district`
--
ALTER TABLE `tbl_new_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_new_tehsil`
--
ALTER TABLE `tbl_new_tehsil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_new_villages`
--
ALTER TABLE `tbl_new_villages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_questionnaire`
--
ALTER TABLE `tbl_questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_quiz_questionnaire`
--
ALTER TABLE `tbl_quiz_questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_contact`
--
ALTER TABLE `tbl_school_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_contact_history`
--
ALTER TABLE `tbl_school_contact_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_visit`
--
ALTER TABLE `tbl_school_visit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_school_visit_history`
--
ALTER TABLE `tbl_school_visit_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_ss_candidates`
--
ALTER TABLE `tbl_ss_candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_states`
--
ALTER TABLE `tbl_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_tehsil`
--
ALTER TABLE `tbl_tehsil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_user_web_tokens`
--
ALTER TABLE `tbl_user_web_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_verified_mobile`
--
ALTER TABLE `tbl_verified_mobile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_village`
--
ALTER TABLE `tbl_village`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_visits`
--
ALTER TABLE `tbl_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_visit_otp`
--
ALTER TABLE `tbl_visit_otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `t_track_services`
--
ALTER TABLE `t_track_services`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_notifications`
--
ALTER TABLE `activity_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_app_tokens`
--
ALTER TABLE `admin_app_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contract_type`
--
ALTER TABLE `contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `financial_monthly`
--
ALTER TABLE `financial_monthly`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `financial_year_data`
--
ALTER TABLE `financial_year_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `spemployeesalarydata`
--
ALTER TABLE `spemployeesalarydata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=573;

--
-- AUTO_INCREMENT for table `sp_activity_logs`
--
ALTER TABLE `sp_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=403;

--
-- AUTO_INCREMENT for table `sp_additional_responsibilities`
--
ALTER TABLE `sp_additional_responsibilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_addresses`
--
ALTER TABLE `sp_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `sp_admission_procedures`
--
ALTER TABLE `sp_admission_procedures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_admission_procedure_branches`
--
ALTER TABLE `sp_admission_procedure_branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_approval_status`
--
ALTER TABLE `sp_approval_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_attendance_groups`
--
ALTER TABLE `sp_attendance_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_attributes`
--
ALTER TABLE `sp_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sp_banks`
--
ALTER TABLE `sp_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sp_bank_details`
--
ALTER TABLE `sp_bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=179;

--
-- AUTO_INCREMENT for table `sp_basic_details`
--
ALTER TABLE `sp_basic_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

--
-- AUTO_INCREMENT for table `sp_business_types`
--
ALTER TABLE `sp_business_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sp_cities`
--
ALTER TABLE `sp_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_color_codes`
--
ALTER TABLE `sp_color_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sp_company_detail`
--
ALTER TABLE `sp_company_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_contacts`
--
ALTER TABLE `sp_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_contact_numbers`
--
ALTER TABLE `sp_contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1138;

--
-- AUTO_INCREMENT for table `sp_contact_tags`
--
ALTER TABLE `sp_contact_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_contact_types`
--
ALTER TABLE `sp_contact_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_core_business_area`
--
ALTER TABLE `sp_core_business_area`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sp_countries`
--
ALTER TABLE `sp_countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_country_codes`
--
ALTER TABLE `sp_country_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_currency_code`
--
ALTER TABLE `sp_currency_code`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `sp_departments`
--
ALTER TABLE `sp_departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sp_drivers`
--
ALTER TABLE `sp_drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_driver_addresses`
--
ALTER TABLE `sp_driver_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_driver_basic_details`
--
ALTER TABLE `sp_driver_basic_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_driver_contact_numbers`
--
ALTER TABLE `sp_driver_contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_employee_payroll_master`
--
ALTER TABLE `sp_employee_payroll_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_favorites`
--
ALTER TABLE `sp_favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_financial_years`
--
ALTER TABLE `sp_financial_years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_foc_requests`
--
ALTER TABLE `sp_foc_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_follow_up`
--
ALTER TABLE `sp_follow_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `sp_fuel_type`
--
ALTER TABLE `sp_fuel_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_holidays`
--
ALTER TABLE `sp_holidays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_holiday_types`
--
ALTER TABLE `sp_holiday_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_income_categories`
--
ALTER TABLE `sp_income_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_insurance_coverage`
--
ALTER TABLE `sp_insurance_coverage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_iso_master`
--
ALTER TABLE `sp_iso_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sp_lead_basic`
--
ALTER TABLE `sp_lead_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sp_lead_iso`
--
ALTER TABLE `sp_lead_iso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `sp_lead_iso_save`
--
ALTER TABLE `sp_lead_iso_save`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `sp_lead_ledger`
--
ALTER TABLE `sp_lead_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_lead_other`
--
ALTER TABLE `sp_lead_other`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sp_leave_policies`
--
ALTER TABLE `sp_leave_policies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_leave_policy_details`
--
ALTER TABLE `sp_leave_policy_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `sp_leave_types`
--
ALTER TABLE `sp_leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_leave_type_documents`
--
ALTER TABLE `sp_leave_type_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_license_category`
--
ALTER TABLE `sp_license_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_mode_of_payments`
--
ALTER TABLE `sp_mode_of_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_modules`
--
ALTER TABLE `sp_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sp_module_permissions`
--
ALTER TABLE `sp_module_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `sp_notifications`
--
ALTER TABLE `sp_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=502;

--
-- AUTO_INCREMENT for table `sp_odo_meter`
--
ALTER TABLE `sp_odo_meter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_organizations`
--
ALTER TABLE `sp_organizations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_password_resets`
--
ALTER TABLE `sp_password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sp_payroll_master`
--
ALTER TABLE `sp_payroll_master`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `sp_pay_bands`
--
ALTER TABLE `sp_pay_bands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_pay_grades`
--
ALTER TABLE `sp_pay_grades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_permissions`
--
ALTER TABLE `sp_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sp_permission_workflows`
--
ALTER TABLE `sp_permission_workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=150;

--
-- AUTO_INCREMENT for table `sp_permission_workflow_roles`
--
ALTER TABLE `sp_permission_workflow_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=303;

--
-- AUTO_INCREMENT for table `sp_petro_card`
--
ALTER TABLE `sp_petro_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_previlege_categories`
--
ALTER TABLE `sp_previlege_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_procure_collection`
--
ALTER TABLE `sp_procure_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_reasons`
--
ALTER TABLE `sp_reasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_regularization`
--
ALTER TABLE `sp_regularization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_required_documents`
--
ALTER TABLE `sp_required_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `sp_roles`
--
ALTER TABLE `sp_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `sp_role_activities`
--
ALTER TABLE `sp_role_activities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_role_attributes`
--
ALTER TABLE `sp_role_attributes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_role_attr_hidden_fields`
--
ALTER TABLE `sp_role_attr_hidden_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_role_attr_optional_fields`
--
ALTER TABLE `sp_role_attr_optional_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_role_entity_mapping`
--
ALTER TABLE `sp_role_entity_mapping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `sp_role_permissions`
--
ALTER TABLE `sp_role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_role_workflow_permissions`
--
ALTER TABLE `sp_role_workflow_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_routes`
--
ALTER TABLE `sp_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_salary_addition_types`
--
ALTER TABLE `sp_salary_addition_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_salary_deduction_types`
--
ALTER TABLE `sp_salary_deduction_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_salary_head`
--
ALTER TABLE `sp_salary_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sp_salary_head_type`
--
ALTER TABLE `sp_salary_head_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_salary_slip_pdf`
--
ALTER TABLE `sp_salary_slip_pdf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `sp_sessions`
--
ALTER TABLE `sp_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_states`
--
ALTER TABLE `sp_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_sub_modules`
--
ALTER TABLE `sp_sub_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `sp_tags`
--
ALTER TABLE `sp_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `sp_ta_request`
--
ALTER TABLE `sp_ta_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_ta_request_details`
--
ALTER TABLE `sp_ta_request_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sp_towns`
--
ALTER TABLE `sp_towns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_users`
--
ALTER TABLE `sp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=248;

--
-- AUTO_INCREMENT for table `sp_user_academic_details`
--
ALTER TABLE `sp_user_academic_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_attendance`
--
ALTER TABLE `sp_user_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `sp_user_bank_details`
--
ALTER TABLE `sp_user_bank_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_biometric_details`
--
ALTER TABLE `sp_user_biometric_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_business_details`
--
ALTER TABLE `sp_user_business_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_contacts`
--
ALTER TABLE `sp_user_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_documents`
--
ALTER TABLE `sp_user_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `sp_user_financial_details`
--
ALTER TABLE `sp_user_financial_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_leaves`
--
ALTER TABLE `sp_user_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sp_user_leave_document`
--
ALTER TABLE `sp_user_leave_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_leave_policy_ledger`
--
ALTER TABLE `sp_user_leave_policy_ledger`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `sp_user_location_logs`
--
ALTER TABLE `sp_user_location_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_notifications`
--
ALTER TABLE `sp_user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_official_details`
--
ALTER TABLE `sp_user_official_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_otp`
--
ALTER TABLE `sp_user_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `sp_user_personal_details`
--
ALTER TABLE `sp_user_personal_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_regularization`
--
ALTER TABLE `sp_user_regularization`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sp_user_role_permissions`
--
ALTER TABLE `sp_user_role_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `sp_user_role_workflow_permissions`
--
ALTER TABLE `sp_user_role_workflow_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=697;

--
-- AUTO_INCREMENT for table `sp_user_salary_slip`
--
ALTER TABLE `sp_user_salary_slip`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sp_user_tags`
--
ALTER TABLE `sp_user_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_user_tracking`
--
ALTER TABLE `sp_user_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5176452;

--
-- AUTO_INCREMENT for table `sp_user_travel_history`
--
ALTER TABLE `sp_user_travel_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicles`
--
ALTER TABLE `sp_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_class`
--
ALTER TABLE `sp_vehicle_class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_vehicle_financer`
--
ALTER TABLE `sp_vehicle_financer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_fitness_details`
--
ALTER TABLE `sp_vehicle_fitness_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_insurance_details`
--
ALTER TABLE `sp_vehicle_insurance_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_insurer`
--
ALTER TABLE `sp_vehicle_insurer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_maker`
--
ALTER TABLE `sp_vehicle_maker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_maker_classification`
--
ALTER TABLE `sp_vehicle_maker_classification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_pollution_details`
--
ALTER TABLE `sp_vehicle_pollution_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_registration_details`
--
ALTER TABLE `sp_vehicle_registration_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_roadpermit_details`
--
ALTER TABLE `sp_vehicle_roadpermit_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_tracking`
--
ALTER TABLE `sp_vehicle_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_vehicle_types`
--
ALTER TABLE `sp_vehicle_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_vehicle_warranty_details`
--
ALTER TABLE `sp_vehicle_warranty_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sp_workflow_levels`
--
ALTER TABLE `sp_workflow_levels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sp_working_hours`
--
ALTER TABLE `sp_working_hours`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sp_working_shifts`
--
ALTER TABLE `sp_working_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_attendance`
--
ALTER TABLE `tbl_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_block`
--
ALTER TABLE `tbl_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `tbl_branch`
--
ALTER TABLE `tbl_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_allocated_shifts`
--
ALTER TABLE `tbl_cl_allocated_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=939;

--
-- AUTO_INCREMENT for table `tbl_cl_almirah`
--
ALTER TABLE `tbl_cl_almirah`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_cl_basic_details`
--
ALTER TABLE `tbl_cl_basic_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_caste_category`
--
ALTER TABLE `tbl_cl_caste_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_college_session`
--
ALTER TABLE `tbl_cl_college_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cl_contact_numbers`
--
ALTER TABLE `tbl_cl_contact_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_contact_types`
--
ALTER TABLE `tbl_cl_contact_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_documents`
--
ALTER TABLE `tbl_cl_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_document_group`
--
ALTER TABLE `tbl_cl_document_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_cl_document_types`
--
ALTER TABLE `tbl_cl_document_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_employee_attendance`
--
ALTER TABLE `tbl_cl_employee_attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_employee_documents`
--
ALTER TABLE `tbl_cl_employee_documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cl_employee_file_folder`
--
ALTER TABLE `tbl_cl_employee_file_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_cl_employee_folder_files`
--
ALTER TABLE `tbl_cl_employee_folder_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_cl_file_folder`
--
ALTER TABLE `tbl_cl_file_folder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_folder_files`
--
ALTER TABLE `tbl_cl_folder_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_income_category`
--
ALTER TABLE `tbl_cl_income_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_leave_types`
--
ALTER TABLE `tbl_cl_leave_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_prviliage_category`
--
ALTER TABLE `tbl_cl_prviliage_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_rack`
--
ALTER TABLE `tbl_cl_rack`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_cl_room`
--
ALTER TABLE `tbl_cl_room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cl_section`
--
ALTER TABLE `tbl_cl_section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_user_leaves`
--
ALTER TABLE `tbl_cl_user_leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_user_tracking`
--
ALTER TABLE `tbl_cl_user_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_cl_working_shifts`
--
ALTER TABLE `tbl_cl_working_shifts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_colleges`
--
ALTER TABLE `tbl_colleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_country`
--
ALTER TABLE `tbl_country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_course_types`
--
ALTER TABLE `tbl_course_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_district`
--
ALTER TABLE `tbl_district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_education_details`
--
ALTER TABLE `tbl_education_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_entrance_otp`
--
ALTER TABLE `tbl_entrance_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_entrance_quiz`
--
ALTER TABLE `tbl_entrance_quiz`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_entrance_registration`
--
ALTER TABLE `tbl_entrance_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_failed_payments`
--
ALTER TABLE `tbl_failed_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_home_visit`
--
ALTER TABLE `tbl_home_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_idcard_otp`
--
ALTER TABLE `tbl_idcard_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_individual_visit`
--
ALTER TABLE `tbl_individual_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_individual_visit_history`
--
ALTER TABLE `tbl_individual_visit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_new_district`
--
ALTER TABLE `tbl_new_district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `tbl_new_tehsil`
--
ALTER TABLE `tbl_new_tehsil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_new_villages`
--
ALTER TABLE `tbl_new_villages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_payments`
--
ALTER TABLE `tbl_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_questionnaire`
--
ALTER TABLE `tbl_questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_quiz_questionnaire`
--
ALTER TABLE `tbl_quiz_questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_registration`
--
ALTER TABLE `tbl_registration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_contact`
--
ALTER TABLE `tbl_school_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_contact_history`
--
ALTER TABLE `tbl_school_contact_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_visit`
--
ALTER TABLE `tbl_school_visit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_school_visit_history`
--
ALTER TABLE `tbl_school_visit_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_semester`
--
ALTER TABLE `tbl_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_ss_candidates`
--
ALTER TABLE `tbl_ss_candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_states`
--
ALTER TABLE `tbl_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_subjects`
--
ALTER TABLE `tbl_subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_tehsil`
--
ALTER TABLE `tbl_tehsil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_user_web_tokens`
--
ALTER TABLE `tbl_user_web_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_verified_mobile`
--
ALTER TABLE `tbl_verified_mobile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_village`
--
ALTER TABLE `tbl_village`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_visits`
--
ALTER TABLE `tbl_visits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_visit_otp`
--
ALTER TABLE `tbl_visit_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_track_services`
--
ALTER TABLE `t_track_services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `financial_monthly`
--
ALTER TABLE `financial_monthly`
  ADD CONSTRAINT `financial_monthly_ibfk_1` FOREIGN KEY (`fy_id`) REFERENCES `financial_year_data` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `financial_year_data`
--
ALTER TABLE `financial_year_data`
  ADD CONSTRAINT `financial_year_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `sp_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `financial_year_data_ibfk_2` FOREIGN KEY (`FY_id`) REFERENCES `sp_financial_years` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
