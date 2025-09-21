-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-09-2025 a las 22:02:23
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agendarcita`
--

CREATE TABLE `agendarcita` (
  `IdAgendarCita` int NOT NULL,
  `Usuarios_IdUsuarios` int UNSIGNED NOT NULL,
  `Horarios_IdHorarios` int NOT NULL,
  `Servicio` varchar(100) NOT NULL,
  `MetodoPago` varchar(50) NOT NULL,
  `Alergias` varchar(255) DEFAULT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `agendarcita`
--

INSERT INTO `agendarcita` (`IdAgendarCita`, `Usuarios_IdUsuarios`, `Horarios_IdHorarios`, `Servicio`, `MetodoPago`, `Alergias`, `estado`) VALUES
(3, 6, 3, 'Masaje', 'Efectivo', 'Ninguna', 'Aceptada'),
(5, 6, 5, 'Facial', 'Efectivo', 'todas', 'Cancelada'),
(8, 6, 8, 'Limpieza facial', 'Efectivo', 'Ninguna', 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `auth_permission`
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
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add agendarcita', 7, 'add_agendarcita'),
(26, 'Can change agendarcita', 7, 'change_agendarcita'),
(27, 'Can delete agendarcita', 7, 'delete_agendarcita'),
(28, 'Can view agendarcita', 7, 'view_agendarcita'),
(29, 'Can add auth group', 8, 'add_authgroup'),
(30, 'Can change auth group', 8, 'change_authgroup'),
(31, 'Can delete auth group', 8, 'delete_authgroup'),
(32, 'Can view auth group', 8, 'view_authgroup'),
(33, 'Can add auth group permissions', 9, 'add_authgrouppermissions'),
(34, 'Can change auth group permissions', 9, 'change_authgrouppermissions'),
(35, 'Can delete auth group permissions', 9, 'delete_authgrouppermissions'),
(36, 'Can view auth group permissions', 9, 'view_authgrouppermissions'),
(37, 'Can add auth permission', 10, 'add_authpermission'),
(38, 'Can change auth permission', 10, 'change_authpermission'),
(39, 'Can delete auth permission', 10, 'delete_authpermission'),
(40, 'Can view auth permission', 10, 'view_authpermission'),
(41, 'Can add auth user', 11, 'add_authuser'),
(42, 'Can change auth user', 11, 'change_authuser'),
(43, 'Can delete auth user', 11, 'delete_authuser'),
(44, 'Can view auth user', 11, 'view_authuser'),
(45, 'Can add auth user groups', 12, 'add_authusergroups'),
(46, 'Can change auth user groups', 12, 'change_authusergroups'),
(47, 'Can delete auth user groups', 12, 'delete_authusergroups'),
(48, 'Can view auth user groups', 12, 'view_authusergroups'),
(49, 'Can add auth user user permissions', 13, 'add_authuseruserpermissions'),
(50, 'Can change auth user user permissions', 13, 'change_authuseruserpermissions'),
(51, 'Can delete auth user user permissions', 13, 'delete_authuseruserpermissions'),
(52, 'Can view auth user user permissions', 13, 'view_authuseruserpermissions'),
(53, 'Can add citaservicios', 14, 'add_citaservicios'),
(54, 'Can change citaservicios', 14, 'change_citaservicios'),
(55, 'Can delete citaservicios', 14, 'delete_citaservicios'),
(56, 'Can view citaservicios', 14, 'view_citaservicios'),
(57, 'Can add contacto', 15, 'add_contacto'),
(58, 'Can change contacto', 15, 'change_contacto'),
(59, 'Can delete contacto', 15, 'delete_contacto'),
(60, 'Can view contacto', 15, 'view_contacto'),
(61, 'Can add django admin log', 16, 'add_djangoadminlog'),
(62, 'Can change django admin log', 16, 'change_djangoadminlog'),
(63, 'Can delete django admin log', 16, 'delete_djangoadminlog'),
(64, 'Can view django admin log', 16, 'view_djangoadminlog'),
(65, 'Can add django content type', 17, 'add_djangocontenttype'),
(66, 'Can change django content type', 17, 'change_djangocontenttype'),
(67, 'Can delete django content type', 17, 'delete_djangocontenttype'),
(68, 'Can view django content type', 17, 'view_djangocontenttype'),
(69, 'Can add django migrations', 18, 'add_djangomigrations'),
(70, 'Can change django migrations', 18, 'change_djangomigrations'),
(71, 'Can delete django migrations', 18, 'delete_djangomigrations'),
(72, 'Can view django migrations', 18, 'view_djangomigrations'),
(73, 'Can add django session', 19, 'add_djangosession'),
(74, 'Can change django session', 19, 'change_djangosession'),
(75, 'Can delete django session', 19, 'delete_djangosession'),
(76, 'Can view django session', 19, 'view_djangosession'),
(77, 'Can add horarios', 20, 'add_horarios'),
(78, 'Can change horarios', 20, 'change_horarios'),
(79, 'Can delete horarios', 20, 'delete_horarios'),
(80, 'Can view horarios', 20, 'view_horarios'),
(81, 'Can add metodopago', 21, 'add_metodopago'),
(82, 'Can change metodopago', 21, 'change_metodopago'),
(83, 'Can delete metodopago', 21, 'delete_metodopago'),
(84, 'Can view metodopago', 21, 'view_metodopago'),
(85, 'Can add perfiles', 22, 'add_perfiles'),
(86, 'Can change perfiles', 22, 'change_perfiles'),
(87, 'Can delete perfiles', 22, 'delete_perfiles'),
(88, 'Can view perfiles', 22, 'view_perfiles'),
(89, 'Can add registroproducto', 23, 'add_registroproducto'),
(90, 'Can change registroproducto', 23, 'change_registroproducto'),
(91, 'Can delete registroproducto', 23, 'delete_registroproducto'),
(92, 'Can view registroproducto', 23, 'view_registroproducto'),
(93, 'Can add servicios', 24, 'add_servicios'),
(94, 'Can change servicios', 24, 'change_servicios'),
(95, 'Can delete servicios', 24, 'delete_servicios'),
(96, 'Can view servicios', 24, 'view_servicios'),
(97, 'Can add usuarios', 25, 'add_usuarios'),
(98, 'Can change usuarios', 25, 'change_usuarios'),
(99, 'Can delete usuarios', 25, 'delete_usuarios'),
(100, 'Can view usuarios', 25, 'view_usuarios'),
(101, 'Can add mensaje contacto', 26, 'add_mensajecontacto'),
(102, 'Can change mensaje contacto', 26, 'change_mensajecontacto'),
(103, 'Can delete mensaje contacto', 26, 'delete_mensajecontacto'),
(104, 'Can view mensaje contacto', 26, 'view_mensajecontacto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `citaservicios`
--

CREATE TABLE `citaservicios` (
  `IdCitaServicios` int NOT NULL,
  `Servicios_IdServicios` int NOT NULL,
  `AgendarCita_idAgendarCita` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contacto`
--

CREATE TABLE `contacto` (
  `IdContacto` int NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Usuarios_IdUsuarios` int DEFAULT NULL,
  `Mensaje` varchar(255) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `contacto`
--

INSERT INTO `contacto` (`IdContacto`, `Nombre`, `Apellido`, `Correo`, `Usuarios_IdUsuarios`, `Mensaje`, `fecha`) VALUES
(1, 'Veronica', 'Hernandez', 'spavh@gmail.com', NULL, 'Todo esta funcionando perfecto', '2025-09-21 11:22:45'),
(2, 'Dear', 'Correa Yepes', 'correaestiven09@gmail.com', 6, 'Prueba 2 de contacto con fecha de envio', '2025-09-21 17:24:33'),
(3, 'Dear', 'Correa Yepes', 'correaestiven09@gmail.com', 6, 'hola hermosa :3', '2025-09-21 19:41:49');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(26, 'home', 'mensajecontacto'),
(6, 'sessions', 'session'),
(7, 'usuarios', 'agendarcita'),
(8, 'usuarios', 'authgroup'),
(9, 'usuarios', 'authgrouppermissions'),
(10, 'usuarios', 'authpermission'),
(11, 'usuarios', 'authuser'),
(12, 'usuarios', 'authusergroups'),
(13, 'usuarios', 'authuseruserpermissions'),
(14, 'usuarios', 'citaservicios'),
(15, 'usuarios', 'contacto'),
(16, 'usuarios', 'djangoadminlog'),
(17, 'usuarios', 'djangocontenttype'),
(18, 'usuarios', 'djangomigrations'),
(19, 'usuarios', 'djangosession'),
(20, 'usuarios', 'horarios'),
(21, 'usuarios', 'metodopago'),
(22, 'usuarios', 'perfiles'),
(23, 'usuarios', 'registroproducto'),
(24, 'usuarios', 'servicios'),
(25, 'usuarios', 'usuarios');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-05-21 15:17:50.527267'),
(2, 'auth', '0001_initial', '2025-05-21 15:17:50.978093'),
(3, 'admin', '0001_initial', '2025-05-21 15:17:51.103361'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-05-21 15:17:51.126469'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-05-21 15:17:51.134772'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-05-21 15:17:51.215262'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-05-21 15:17:51.274224'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-05-21 15:17:51.302352'),
(9, 'auth', '0004_alter_user_username_opts', '2025-05-21 15:17:51.308538'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-05-21 15:17:51.368394'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-05-21 15:17:51.371287'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-05-21 15:17:51.374563'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-05-21 15:17:51.441177'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-05-21 15:17:51.499615'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-05-21 15:17:51.520661'),
(16, 'auth', '0011_update_proxy_permissions', '2025-05-21 15:17:51.529422'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-05-21 15:17:51.590326'),
(18, 'sessions', '0001_initial', '2025-05-21 15:17:51.619599'),
(19, 'home', '0001_initial', '2025-05-27 14:49:38.941559'),
(20, 'usuarios', '0001_initial', '2025-05-27 14:49:38.980799');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0kn6imowjteeagxul3522bbchgqmdl7i', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0Qxo:CSlYriwCBfPfYZ5lp7ywp_ryYLvQgjXf74reTZQqFl8', '2025-09-21 20:52:16.866734'),
('1d6hovtbobhcyv2ov70jojeg0e2wizhp', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiMWhhdXo4dkRmdkVTMkREU3FsV1NXTDg0amFUbUdEV04ifQ:1uZ7Sb:R-f5bwAs9AQkI0SmoqKzDR0gB20-X8d-S5n6ocOF-jU', '2025-07-22 12:30:09.213941'),
('4495a7xsca41koidu1p2w35lb3s4w927', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0Mve:QHrxxH23-eSAjZugVv_ni22ouxOnysWS_ok-3SmG5po', '2025-09-21 16:28:56.422701'),
('4cwis30k5kervex28ar1razizrhyl6df', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0Mv4:QS7nIXCZZxQytUcOLGFdvckSvPezmVz_HReH5t8w4c0', '2025-09-21 16:28:20.942958'),
('59tnonc9v5es97xrv968fityy34zdsg7', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0QpY:QBP7tnzvqiMnDZCkTjFRaN8Ng12wrKl9alCkZdT-qKs', '2025-09-21 20:43:44.813752'),
('698tjrts8ago7ncmmai7vcgmxjuvyhvo', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0P4Q:JysHJJS-_3U_Z1Q6sNPtqSu-6RbsFX4OOeu0IVdI5ME', '2025-09-21 18:50:58.889208'),
('706qn343pucgrim87vtyf8zklkcjuah7', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0Mt6:jizzEUvqhhMzRhE583nq5fmexoaRr7PsaTKQ9pLqnSk', '2025-09-21 16:26:18.194592'),
('8gkqwr7odc8ui06imi96g8u10uexw1cq', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0O2V:5zsp-rcW3KwZM-DxzuF5-NexhJwy4ly6slEFYhRoSyk', '2025-09-21 17:44:55.025380'),
('99ypb5omkykd0frsbirbtrlkdykwhd5b', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0N8U:2wINfEHH5CEUMB2gW-8f6xqYLBu3j2_lW4mRZgjnsjg', '2025-09-21 16:47:02.952986'),
('9sltiho3t2siz5y81u6fbpfvgdkp0lya', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0PE8:p6skeQvcR1OOqpgEvU8xVKo5WhOOS7BLnjD9vAnRClk', '2025-09-21 19:01:00.004778'),
('bdipn08rc537qlx7ubm1n6wg4eja9rpu', 'eyJ1c3VhcmlvX2lkIjo1LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1uRYer:Qx0E121-R6U0rcaoCu6aWdRBfRSUX837KWi6ZcY-hQc', '2025-07-01 15:55:33.189829'),
('buz4lu5xvw4ws0jn5ypzy70ip5kyjbf5', 'eyJ1c3VhcmlvX2lkIjoyNSwicGVyZmlsIjoidXN1YXJpbyJ9:1uZAQE:xGHdr3yKq3dwMocEmHaSyhzTWf-LdJaCIiNO9pMEUSg', '2025-07-22 15:39:54.596820'),
('c9tbzqvychzgrufipxnl2kwjfipae4c0', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0NoA:2HtTYFGLei9vGyKfnrpoX-88-TPNgnj1avBJDuYKrpo', '2025-09-21 17:30:06.839942'),
('ejp7gzi2353nx76gfxiy6y9kjk5itxje', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1ut3vU:j2KBC0zR-JSs4zJqgO5m1D_n-9IUIS5Od4_rjkVYbwg', '2025-09-15 12:46:24.779069'),
('gcetpbjjbjryfqo5i4tjwsoq95ax54m7', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0S82:Q7IVCEINbrBRN1YGYrJnFM5_8MJgWI5Ag2o17tCQZoc', '2025-09-21 22:06:54.651724'),
('id24bz7hbpcy0wlzfwb4cgdsqk5lwruj', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiSEJicHpBdDhWMGExeUNMQng2QWEzT2V5TnZaVDZROFoifQ:1uZ7Jt:rWJmEbIB882te8MXTEqVRU7P13O5C2sIXqELWjUQ20E', '2025-07-22 12:21:09.662483'),
('khamojzb30wcjp24bi0dlgqocnszrxzl', 'eyJ1c3VhcmlvX2lkIjo1LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1uMwvo:6hi2LmVvUMGaiwuEr60tpKSoIWCSd0PlqLl2VIfii3o', '2025-06-18 22:50:00.484600'),
('l1w96i6rcxqkm81nenkg2irousg7c7ln', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0OTJ:dogMM5RkMXZ4vQo2EIHVo-vwR9scwj28HpOTP3JZNV4', '2025-09-21 18:12:37.141254'),
('lmcu1o108obyf76p2sv2mk7cdn2nt2b4', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiMnlqRHJNTUFsUVdTYXBBRzVQdDFYVmIxZmdIRkhSaFUifQ:1uZ7OL:UQZdnBWXMFVkFXHJuhzlqcCzBfKF55zyOMYSeWYpat0', '2025-07-22 12:25:45.935228'),
('lyrnej7lgeksufm28xwaycthyr9nxyxs', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1uivVN:Lz4hESZeIm7Z9GMeg9Z8GroZXW7i6ZLdcUyeInYOrCk', '2025-08-18 13:45:33.179078'),
('mug7mmcqd11itsytkbzyzuhkdlf6utzi', '.eJwtyjEOgCAMBdC7_JnFlYO4NihVm0BrCsTBeHcdnN-7MdpILkaSEaeAk32TgoiUqygC1OriTH_7YGY3lTV91g67qNguSqmwd8Tug58X_9Uefg:1uyGRP:eT6MRen8HCtabuaSwxSC111-SFSy3HbwwueeUSCnO-k', '2025-09-29 21:08:51.736283'),
('ndspkgdtjuuwq6po2juvqcnjwos6009h', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0QA9:gHHANTP9mJ6TJYAl_zCbMZaexTB8jX4Di9KWjLhjurk', '2025-09-21 20:00:57.335558'),
('rxzzsjn56cywwvu4ly0whb9d49mtqkb8', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiUHhwTUpCbVY2RGU4TmJkSE5HWXE0c1RVaXdEZkJiM0IifQ:1uZ7Tg:k-G6sI7INEkxnBQYgRwXeqdt2M08WmK8wyPf1HugEoA', '2025-07-22 12:31:16.548336'),
('v733dsokghgiph7ajvkiuok9vvhaa21b', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0OmY:S5uVqGi9Y2wN2_dl_wUnRyQ9Z6e8v7441SvaLho69Yc', '2025-09-21 18:32:30.499744'),
('vasxvpu6ororm8n8qu1afg27jpzumpfq', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1uWXJ7:CgiL1NLr0R07bDHHIgqWr1ZPhB18dOHh7VfBUWK-oEA', '2025-07-15 09:29:41.726000'),
('vnjq7s5hug47nshp4beaw8c407gxsf6w', 'eyJ1c3VhcmlvX2lkIjoxMCwicGVyZmlsIjoidXN1YXJpbyJ9:1uHmAK:QNVqMOGa7JVgKlW_ry464St13ga3-40KFIFWr-wwV8Y', '2025-06-04 16:19:36.227093'),
('w4442pi7rha2lvebf79bb53vis1i8gxj', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1uWPco:BV8j1vVAGx88WBnX2PF8OCoU3tnQH4_T65DudyHRoO4', '2025-07-15 01:17:30.490867'),
('wg9lxg67h35lxyjzs306imdcqnyu3fv4', 'eyJ1c3VhcmlvX2lkIjo1LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1uRXoz:nGKnZR0fq-6r960_SA552DgXGpimoF_9YdJjDhTLM_4', '2025-07-01 15:01:57.505512'),
('wlear5yy12ax0r5leof4h5g0onba8eig', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0Pa5:yVjprNOwrlRkpYJYnZ8B0NwiqsrEHq1hzYN1nPFDuDA', '2025-09-21 19:23:41.401933'),
('xaquxg6c2b8582ehow6s138012zyauj8', 'eyJnb29nbGUtb2F1dGgyX3N0YXRlIjoiaVZOTXhRaHdZSElhcjBsTVJlcU1jZ3VMN0hsZUl5b0MifQ:1uh8TL:ifQZhMk8r102m_fWPxGiUlnOE7u9fKaftwRBUBpQNNg', '2025-08-13 15:12:03.768254'),
('y9ngre5mvyaffexulwt89n48viy3dwic', 'eyJ1c3VhcmlvX2lkIjo2LCJwZXJmaWwiOiJ1c3VhcmlvIn0:1v0MsR:M_3yO-n2yxZayaCm5pr-YTSlq6MlE29Xnf5f9AGx2dI', '2025-09-21 16:25:37.409594'),
('yq6fvbd1tn56rs46fhv5vh6zkb1n3uhl', 'eyJ1c3VhcmlvX2lkIjoxLCJwZXJmaWwiOiJhZG1pbiJ9:1v0MuH:0d6lZgicUgMnuT5_b_K_yKWDkOQcFsE-p_0PLPl2Uqw', '2025-09-21 16:27:31.896890');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `home_mensajecontacto`
--

CREATE TABLE `home_mensajecontacto` (
  `id` bigint NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `mensaje` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `home_mensajecontacto`
--

INSERT INTO `home_mensajecontacto` (`id`, `nombre`, `apellido`, `correo`, `mensaje`, `fecha`) VALUES
(1, 'lola', 'pajarito', 'lola@gmail.com', 'mejoren más la página, gracias', '2025-05-27 15:00:14.559739'),
(2, 'lola', 'pajarito', 'lola@gmail.com', 'Hola', '2025-05-27 15:06:25.786620'),
(3, 'manguito', 'pajarito', 'manguito@gmail.com', 'hola', '2025-05-27 15:12:06.559674'),
(4, 'luciana', 'Castrillón', 'luciana@gmail.com', 'chaito', '2025-05-27 15:20:57.748572'),
(5, 'luci', 'Castrillón', 'luci@gmail.com', 'buenas', '2025-05-27 15:23:32.486380'),
(6, 'luci', 'Castrillón', 'luci@gmail.com', 'hyhyh', '2025-05-27 15:26:38.853697'),
(7, 'lola', 'pajarito', 'lola@gmail.com', 'rrrr', '2025-05-27 15:28:13.593265');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `IdHorarios` int NOT NULL,
  `Fecha` date NOT NULL,
  `Hora` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`IdHorarios`, `Fecha`, `Hora`) VALUES
(1, '2025-06-04', '10:02'),
(2, '2025-06-01', '10:24'),
(3, '2025-06-05', '17:48'),
(4, '2025-06-18', '10:55'),
(5, '2025-07-16', '09:07'),
(6, '2025-08-11', '12:01'),
(7, '2025-08-12', '08:38'),
(8, '2025-09-22', '21:00'),
(9, '2025-09-22', '20:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `IdMetodoPago` int NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `AgendarCita_idAgendarCita` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `IdPerfiles` int NOT NULL,
  `Descripcion` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`IdPerfiles`, `Descripcion`) VALUES
(1, 'Admin'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroproducto`
--

CREATE TABLE `registroproducto` (
  `idRegistroProducto` int NOT NULL,
  `Imagen` text NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` varchar(50) NOT NULL,
  `Perfiles_IdPerfiles` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `IdServicios` int NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Descripcion` varchar(255) NOT NULL,
  `Precio` int NOT NULL,
  `ImagenProducto` varchar(255) DEFAULT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`IdServicios`, `Titulo`, `Descripcion`, `Precio`, `ImagenProducto`, `habilitado`) VALUES
(7, 'Limpieza facial', 'Purifica tu piel, elimina impurezas y revela un rostro más fresco y radiante.', 100000, 'servicios/limpiezaFacial.jpg', 1),
(8, 'Masaje relajante ', 'Libera tensiones, relaja cuerpo y mente, y recupera tu bienestar.', 60000, 'servicios/masajeRelajante.jpg', 1),
(9, 'Masaje descontracturante', 'Alivia contracturas, relaja músculos tensos y mejora tu movilidad con técnicas terapéuticas.', 60000, 'servicios/MasajeDescontracturante.jpg', 1),
(10, 'Masaje reductor (Paquete 10 sesiones)', 'Reduce medidas, tonifica tu figura y mejora la circulación con nuestro plan de 10 sesiones.', 500000, 'servicios/masajeReductor.jpg', 1),
(11, 'Masaje deportivo', 'Activa músculos, previene lesiones y acelera la recuperación.', 60000, 'servicios/masajeDeportivo.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuarios` int UNSIGNED NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(60) NOT NULL,
  `TipoDocumento` tinyint NOT NULL,
  `NumeroDocumento` bigint NOT NULL,
  `Correo` varchar(100) NOT NULL,
  `Contraseña` varchar(255) DEFAULT NULL,
  `Celular` varchar(15) NOT NULL,
  `FechaNacimiento` date NOT NULL,
  `Perfiles_IdPerfiles` int NOT NULL,
  `token_recuperacion` varchar(100) DEFAULT NULL,
  `token_expira` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuarios`, `Nombre`, `Apellido`, `TipoDocumento`, `NumeroDocumento`, `Correo`, `Contraseña`, `Celular`, `FechaNacimiento`, `Perfiles_IdPerfiles`, `token_recuperacion`, `token_expira`) VALUES
(1, 'Veronica', 'Hernandez', 1, 2132435432, 'Spa.veronicahernandez@gmail.com', 'pbkdf2_sha256$1000000$2h3EA6mZ03EpLcjQHcrCHO$v/7nLDCcmn3t/D1OAFB56xAgm9t8q5h3n4shiJ4Lyx0=', '32332332', '1985-03-20', 1, NULL, NULL),
(6, 'Dear', 'Correa Yepes', 1, 213453234, 'correaestiven09@gmail.com', 'pbkdf2_sha256$1000000$r84Ks48PLvahKPr1Br829U$aj8ZsxNbW4ZblljwOfksQjGLIKYYf7GLoUuixIW45n8=', '3215535954', '2025-04-22', 2, '0e009d0f-456e-41f7-9fd5-11f6cfb6d4de', '2025-07-08 14:03:13'),
(9, 'luciana', 'Castrillón', 1, 1011394248, 'luciana@gmail.com', '12345', '1234567890', '2006-03-06', 2, NULL, NULL),
(10, 'john', 'Salazar', 1, 10101010101, 'john@gmail.com', '54321', '3000000000', '2005-08-22', 2, NULL, NULL),
(13, 'Estiven', 'Zapata Muñoz', 1, 1011396325, 'ejemplo@gmail.com', '123321', '32122312131', '2007-04-29', 2, NULL, NULL),
(20, 'sofia', 'Lopera Giraldo', 1, 1231231231, 'ejemploS@gmail.com', '123321', '32123121232', '2025-06-10', 1, NULL, NULL),
(27, 'Diego ', 'londoño', 1, 1034456765, 'londono09@gmail.com', 'Ln123456.', '3423456543', '2006-01-09', 2, NULL, NULL),
(31, 'Juli', 'Yepes', 1, 1043543343, 'kitty@gmail.com', 'Jy123456/', '3425465434', '2006-07-26', 2, NULL, NULL),
(32, 'alexis', 'Correa', 1, 32445654, 'alexis19@gmail.com', 'pbkdf2_sha256$1000000$DwpPJ2qr6dOkt89UJJr9Lu$kqIi0eBKwqtu9fw0IAea4l1PQZFvutTmGj8iyBjVnFw=', '3423345434', '2002-09-10', 2, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agendarcita`
--
ALTER TABLE `agendarcita`
  ADD PRIMARY KEY (`IdAgendarCita`),
  ADD KEY `Usuarios_IdUsuarios` (`Usuarios_IdUsuarios`),
  ADD KEY `Horarios_IdHorarios` (`Horarios_IdHorarios`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `citaservicios`
--
ALTER TABLE `citaservicios`
  ADD PRIMARY KEY (`IdCitaServicios`),
  ADD KEY `fk_CitaServicios_Servicios1_idx` (`Servicios_IdServicios`),
  ADD KEY `fk_CitaServicios_AgendarCita1_idx` (`AgendarCita_idAgendarCita`);

--
-- Indices de la tabla `contacto`
--
ALTER TABLE `contacto`
  ADD PRIMARY KEY (`IdContacto`),
  ADD KEY `fk_Contacto_Usuarios1_idx` (`Usuarios_IdUsuarios`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `home_mensajecontacto`
--
ALTER TABLE `home_mensajecontacto`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`IdHorarios`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`IdMetodoPago`),
  ADD KEY `fk_MetodoPago_AgendarCita1_idx` (`AgendarCita_idAgendarCita`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`IdPerfiles`),
  ADD UNIQUE KEY `Descripcion_UNIQUE` (`Descripcion`);

--
-- Indices de la tabla `registroproducto`
--
ALTER TABLE `registroproducto`
  ADD PRIMARY KEY (`idRegistroProducto`),
  ADD KEY `fk_RegistroProducto_Perfiles1_idx` (`Perfiles_IdPerfiles`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`IdServicios`),
  ADD UNIQUE KEY `IdAngendar_UNIQUE` (`IdServicios`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuarios`),
  ADD UNIQUE KEY `NumeroDocumento_UNIQUE` (`NumeroDocumento`),
  ADD KEY `fk_Registros_Perfiles1_idx` (`Perfiles_IdPerfiles`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `agendarcita`
--
ALTER TABLE `agendarcita`
  MODIFY `IdAgendarCita` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `citaservicios`
--
ALTER TABLE `citaservicios`
  MODIFY `IdCitaServicios` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contacto`
--
ALTER TABLE `contacto`
  MODIFY `IdContacto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `home_mensajecontacto`
--
ALTER TABLE `home_mensajecontacto`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `IdHorarios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `IdMetodoPago` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `IdPerfiles` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `registroproducto`
--
ALTER TABLE `registroproducto`
  MODIFY `idRegistroProducto` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `IdServicios` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuarios` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `agendarcita`
--
ALTER TABLE `agendarcita`
  ADD CONSTRAINT `agendarcita_ibfk_1` FOREIGN KEY (`Usuarios_IdUsuarios`) REFERENCES `usuarios` (`IdUsuarios`),
  ADD CONSTRAINT `agendarcita_ibfk_2` FOREIGN KEY (`Horarios_IdHorarios`) REFERENCES `horarios` (`IdHorarios`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
