-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-07-2025 a las 17:05:20
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mantenimiento`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`, `list_filter_sticky`, `form_pagination_sticky`, `form_submit_sticky`, `css_module_background_selected_color`, `css_module_link_selected_color`, `logo_max_height`, `logo_max_width`, `foldable_apps`, `language_chooser_control`, `list_filter_highlight`, `list_filter_removal_links`, `show_fieldsets_as_tabs`, `show_inlines_as_tabs`, `css_generic_link_active_color`, `collapsible_stacked_inlines`, `collapsible_stacked_inlines_collapsed`, `collapsible_tabular_inlines`, `collapsible_tabular_inlines_collapsed`) VALUES
(1, 'Tema1', 1, 'Django administration', 1, '', 1, '#0C4B33', '#d90f0f', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', 1, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', 'Tema', 1, '#719485', 1, 1, 1, 'code', 1, 0, 0, '#FFFFCC', '#FFFFFF', 100, 400, 1, 'default-select', 1, 0, 0, 0, '#29B864', 0, 1, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(3, 'Tecnicos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(22, 2, 16),
(24, 2, 28),
(25, 2, 29),
(14, 2, 32),
(15, 2, 36),
(16, 2, 40),
(17, 2, 41),
(18, 2, 42),
(19, 2, 44),
(20, 2, 45),
(21, 2, 46),
(23, 2, 48),
(35, 3, 28),
(36, 3, 29),
(37, 3, 30),
(26, 3, 32),
(27, 3, 33),
(28, 3, 36),
(29, 3, 41),
(30, 3, 42),
(31, 3, 44),
(32, 3, 45),
(33, 3, 46),
(34, 3, 48);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add area servicio', 7, 'add_areaservicio'),
(26, 'Can change area servicio', 7, 'change_areaservicio'),
(27, 'Can delete area servicio', 7, 'delete_areaservicio'),
(28, 'Can view area servicio', 7, 'view_areaservicio'),
(29, 'Can add equipo', 8, 'add_equipo'),
(30, 'Can change equipo', 8, 'change_equipo'),
(31, 'Can delete equipo', 8, 'delete_equipo'),
(32, 'Can view equipo', 8, 'view_equipo'),
(33, 'Can add software', 9, 'add_software'),
(34, 'Can change software', 9, 'change_software'),
(35, 'Can delete software', 9, 'delete_software'),
(36, 'Can view software', 9, 'view_software'),
(37, 'Can add usuario', 10, 'add_usuario'),
(38, 'Can change usuario', 10, 'change_usuario'),
(39, 'Can delete usuario', 10, 'delete_usuario'),
(40, 'Can view usuario', 10, 'view_usuario'),
(41, 'Can add especificaciones equipo', 11, 'add_especificacionesequipo'),
(42, 'Can change especificaciones equipo', 11, 'change_especificacionesequipo'),
(43, 'Can delete especificaciones equipo', 11, 'delete_especificacionesequipo'),
(44, 'Can view especificaciones equipo', 11, 'view_especificacionesequipo'),
(45, 'Can add chequeo', 12, 'add_chequeo'),
(46, 'Can change chequeo', 12, 'change_chequeo'),
(47, 'Can delete chequeo', 12, 'delete_chequeo'),
(48, 'Can view chequeo', 12, 'view_chequeo'),
(49, 'Can add Theme', 13, 'add_theme'),
(50, 'Can change Theme', 13, 'change_theme'),
(51, 'Can delete Theme', 13, 'delete_theme'),
(52, 'Can view Theme', 13, 'view_theme');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(3, 'pbkdf2_sha256$600000$cpFRx9HRdOKqPwW4s44hrN$KzWzS27XF2fb3Er8xxymFJMNlRw2BgTy++1e6tRbEKY=', '2025-07-15 14:27:18.256019', 0, 'Sistemas', '', '', 'yuranir850@gmail.com', 1, 1, '2025-07-09 13:35:25.000000'),
(4, 'pbkdf2_sha256$600000$2pIcMnlSHTinskrydsu5DK$O5MU0xZCKM/7VEJPMZCLpaeQyj+aJl3YiQBsEWKuKCQ=', '2025-07-15 14:24:55.933931', 1, 'Administradores', '', '', 'yuranir850@gmail.com', 1, 1, '2025-07-09 16:59:46.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_areaservicio`
--

CREATE TABLE `chequeos_areaservicio` (
  `Id_Area` int(11) NOT NULL,
  `Nombre_Area` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_areaservicio`
--

INSERT INTO `chequeos_areaservicio` (`Id_Area`, `Nombre_Area`) VALUES
(1, 'A.B.C'),
(2, 'Punto de Pago(Antiguo Museo)'),
(3, 'Centro Catequistico'),
(4, 'Colegio Salesiano Juan del Rizzo'),
(5, 'Proyectos'),
(6, 'Césfal'),
(7, 'Punto de Pago(Baños Públicos)'),
(8, 'Pastoral Salud'),
(9, 'Pastoral Social'),
(10, 'Pastoral General'),
(11, 'Restaurante Mama Margarita'),
(13, 'Oratorio Casa Juvenil'),
(14, 'Imprenta Salesiana'),
(15, 'Administración Financiera y Contable'),
(16, 'Salesianos-Comunidades Religiosas'),
(17, 'Seguridad y Recepción/Parqueaderos'),
(18, 'Servicios Inspectoriales'),
(19, 'SGA'),
(20, 'SGCS'),
(21, 'SGSST'),
(22, 'Dirección'),
(23, 'Despacho Parroquial'),
(24, 'Donaciones'),
(25, 'Gestión de la Comunicación y Tecnología'),
(26, 'Gestión Humana'),
(27, 'Habitaciones Salesianas'),
(28, 'Libreria Salesiana'),
(29, 'Zasca'),
(30, 'Mantenimiento'),
(31, 'Memoria Historica'),
(32, 'Escala'),
(33, 'Imprenta Salesiana'),
(34, 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_chequeo`
--

CREATE TABLE `chequeos_chequeo` (
  `Id_Chequeo` int(11) NOT NULL,
  `Che_Fecha_Chequeo` date NOT NULL,
  `Che_Observaciones` longtext DEFAULT NULL,
  `Id_Equipo` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `creado_por_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_chequeo`
--

INSERT INTO `chequeos_chequeo` (`Id_Chequeo`, `Che_Fecha_Chequeo`, `Che_Observaciones`, `Id_Equipo`, `Id_Usuario`, `creado_por_id`) VALUES
(3, '2025-07-09', 'jashsjshs', 3, 1, NULL),
(4, '2025-07-09', 'hagsshs', 4, 1, NULL),
(5, '2025-07-09', 'GTGT', 6, 2, NULL),
(8, '2025-07-01', 'hgvg', 9, 2, NULL),
(9, '2025-07-03', 'SSSSS', 10, 2, NULL),
(10, '2025-07-04', 'XSXXSSSDSD', 11, 1, NULL),
(11, '2025-07-11', 'Equipo bajo rendimiento al momento de guardar documentos en PDF.', 12, 1, NULL),
(12, '2025-07-11', 'gvfgrgref', 13, 2, NULL),
(13, '2025-07-11', 'cdcdcsd', 14, 2, NULL),
(14, '2025-07-11', 'cccdc', 4, 2, NULL),
(15, '2025-07-11', 'cdcdcc', 10, 2, NULL),
(20, '2025-07-14', 'DSVVFVF', 20, 1, 3),
(21, '2025-07-02', 'gagsvsgv', 21, 2, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_chequeo_software_instalado`
--

CREATE TABLE `chequeos_chequeo_software_instalado` (
  `id` bigint(20) NOT NULL,
  `chequeo_id` int(11) NOT NULL,
  `software_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_chequeo_software_instalado`
--

INSERT INTO `chequeos_chequeo_software_instalado` (`id`, `chequeo_id`, `software_id`) VALUES
(10, 3, 2),
(11, 4, 1),
(12, 4, 3),
(13, 4, 4),
(14, 4, 5),
(15, 4, 6),
(16, 5, 2),
(17, 5, 3),
(18, 5, 4),
(23, 8, 4),
(24, 8, 5),
(25, 9, 2),
(26, 9, 3),
(28, 10, 7),
(27, 10, 8),
(29, 11, 4),
(30, 11, 5),
(31, 12, 4),
(32, 12, 5),
(33, 12, 7),
(34, 13, 5),
(35, 13, 6),
(36, 14, 2),
(37, 14, 3),
(38, 15, 3),
(54, 20, 5),
(55, 20, 6),
(56, 21, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_equipo`
--

CREATE TABLE `chequeos_equipo` (
  `Id_Equipo` int(11) NOT NULL,
  `Equ_Placa_Serie` varchar(15) NOT NULL,
  `Area_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_equipo`
--

INSERT INTO `chequeos_equipo` (`Id_Equipo`, `Equ_Placa_Serie`, `Area_id`) VALUES
(3, 'PCNJ-ENFER03321', 4),
(4, 'PCNJ-OFIMAT0241', 32),
(5, 'PCNJ-ORATO03356', 13),
(6, 'PCNJ-CESFA02365', 6),
(7, 'PCNJ-ORATO00000', 13),
(8, 'PCNJ-OFIMAT002', 32),
(9, 'PCNJ-ORATO02360', 13),
(10, 'PCNJ-ESCAL1234', 32),
(11, 'PCNJ-GHUMA01234', 26),
(12, 'PCNJ-DISEÑ00001', 32),
(13, 'PCNJ-OFIMAT0000', 32),
(14, 'PCNJ-ENFER00001', 4),
(15, 'mio', 5),
(20, 'PCNJ-EJEMP00001', 5),
(21, 'PCNJ-EJEMP00002', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_especificacionesequipo`
--

CREATE TABLE `chequeos_especificacionesequipo` (
  `id` bigint(20) NOT NULL,
  `Esp_Procesador` varchar(100) NOT NULL,
  `Esp_Disco_Duro` varchar(100) NOT NULL,
  `Esp_Tipo_Disco` varchar(50) NOT NULL,
  `Esp_Sistema_Operativo` varchar(100) NOT NULL,
  `Esp_Version_SO` varchar(50) NOT NULL,
  `Esp_Licencia_SO` varchar(100) NOT NULL,
  `Esp_Memoria_RAM` varchar(50) NOT NULL,
  `Esp_Tarjeta_Video` varchar(100) NOT NULL,
  `Esp_Conectividad_Red` varchar(100) NOT NULL,
  `Esp_Estado_Bateria` varchar(50) NOT NULL,
  `Esp_SO_Actualizado` varchar(20) NOT NULL,
  `Esp_Antivirus` varchar(20) NOT NULL,
  `Esp_Antivirus_Actualizado` varchar(20) NOT NULL,
  `Esp_Estado_Equipo` varchar(100) NOT NULL,
  `Esp_Observaciones` longtext NOT NULL,
  `Esp_Software_Instalado` longtext NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `Id_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_especificacionesequipo`
--

INSERT INTO `chequeos_especificacionesequipo` (`id`, `Esp_Procesador`, `Esp_Disco_Duro`, `Esp_Tipo_Disco`, `Esp_Sistema_Operativo`, `Esp_Version_SO`, `Esp_Licencia_SO`, `Esp_Memoria_RAM`, `Esp_Tarjeta_Video`, `Esp_Conectividad_Red`, `Esp_Estado_Bateria`, `Esp_SO_Actualizado`, `Esp_Antivirus`, `Esp_Antivirus_Actualizado`, `Esp_Estado_Equipo`, `Esp_Observaciones`, `Esp_Software_Instalado`, `equipo_id`, `Id_Usuario`) VALUES
(1, '', '', '', '', '', '', '', '', 'Ninguna', '', '0', '', '0', '', '', 'Antivirus', 3, NULL),
(2, '', '', '', '', '', '', '', '', 'Ninguna', '', '0', '', '0', '', '', 'Antivirus, Google Chrome', 4, NULL),
(3, 'intel core i7', '500', 'mecanico', 'Windows 10pro', '22H2', 'SI', '8 GB', 'NO', 'Ninguna', '60%', '1', 'vipre', '1', 'Bueno', 'aa', '7 Zip, WinRAR', 9, NULL),
(4, '', '', '', '', '', '', '', '', 'Ninguna', '', '0', '', '0', '', '', 'Google Chrome', 10, NULL),
(5, 'si', 'si', 'HDD', 'Windows 10pro', '22H2', 'SI', '16 GB', 'NO', 'Ninguna', 'si', 'Sí', 'Sí', 'Sí', 'Bueno', 'Equipo de buena calidad.', 'Adobe Acrobat, Yahoo', 11, 3),
(6, 'si', 'si', 'HDD', 'Windows 10pro', '22H2', 'SI', '16 GB', 'NO', 'Buena calidad', 'NO APLICA', '1', 'si', '1', 'Bueno', 'Se realiza revisión del equipo que tenia bajo rendimiento al momento de descargar documentos en PDF, se le hace instalación del programa Adobe Acrobat, ya que el equipo no lo tenia y por eso era el bajo rendimiento.', '7 Zip, WinRAR, Adobe Acrobat', 12, NULL),
(7, '', '', '', '', '', '', '', '', 'Ninguna', '', '0', '', '0', '', '', '7 Zip, WinRAR, Adobe Acrobat', 13, NULL),
(8, '', '', '', '', '', '', '', '', 'Ninguna', '', '0', '', '0', '', '', 'WinRAR, Skype', 14, NULL),
(9, 'intel core i7', '500', 'mecanico', 'luinux', 'ubuntu 22', 'SI', '16 GB', 'NO', 'Ninguna', '60%', '1', 'vipre', '1', 'Bueno', 'ninguna', 'Mozilla Firefox, Antivirus, Google Chrome, 7 Zip, WinRAR, Skype, Adobe Acrobat', 15, NULL),
(14, 'si', 'si', 'HDD', 'Windows 10pro', '22H2', 'SI', '8 GB', 'NO', 'Ninguna', 'NO APLICA', 'No', 'Sí', 'No aplica', 'Bueno', 'vfbfg', 'WinRAR, Skype', 20, 4),
(15, 'si', '500', 'mecanico', 'Windows 10pro', '22H2', 'SI', '8 GB', 'NO', 'Ninguna', 'NO APLICA', 'Sí', 'No', 'No aplica', 'Bueno', 'scdcdacd', 'Skype', 21, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_software`
--

CREATE TABLE `chequeos_software` (
  `id` bigint(20) NOT NULL,
  `Sof_Nombre` varchar(100) NOT NULL,
  `Sof_Tipo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_software`
--

INSERT INTO `chequeos_software` (`id`, `Sof_Nombre`, `Sof_Tipo`) VALUES
(1, 'Mozilla Firefox', 'General'),
(2, 'Antivirus', 'General'),
(3, 'Google Chrome', 'General'),
(4, '7 Zip', 'General'),
(5, 'WinRAR', 'General'),
(6, 'Skype', 'General'),
(7, 'Adobe Acrobat', 'General'),
(8, 'Yahoo', 'General'),
(9, 'FileZilla', 'General'),
(10, 'illustrator', 'diseño'),
(11, 'Veyon', 'General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `chequeos_usuario`
--

CREATE TABLE `chequeos_usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Usu_Nombre` varchar(100) NOT NULL,
  `Usu_Cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `chequeos_usuario`
--

INSERT INTO `chequeos_usuario` (`Id_Usuario`, `Usu_Nombre`, `Usu_Cargo`) VALUES
(1, 'Leonardo Giraldo', 'Sistemas'),
(2, 'Jeik', 'Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(43, '2025-07-09 13:36:40.917716', '2', 'yuranir', 3, '', 4, 3),
(44, '2025-07-09 13:37:04.891048', '3', 'Sistemas', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 4, 3),
(61, '2025-07-09 17:04:58.879624', '4', 'Administradores', 2, '[]', 4, 4),
(62, '2025-07-09 17:09:41.024890', '3', 'Sistemas', 2, '[]', 4, 4),
(63, '2025-07-09 17:31:51.510414', '3', 'Sistemas', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 4),
(64, '2025-07-09 18:28:44.672369', '3', 'PCNJ-ENFER03321', 1, '[{\"added\": {}}]', 8, 3),
(65, '2025-07-09 18:29:16.129063', '3', 'PCNJ-ENFER03321 - 09/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(66, '2025-07-09 18:30:11.943031', '2', 'PCNJ-OFIMAT0241', 3, '', 8, 4),
(67, '2025-07-09 18:30:11.947851', '1', 'PCNJ-ORATO03314', 3, '', 8, 4),
(68, '2025-07-09 20:12:06.461596', '4', 'PCNJ-OFIMAT0241', 1, '[{\"added\": {}}]', 8, 3),
(69, '2025-07-09 20:12:30.429839', '4', 'PCNJ-OFIMAT0241 - 09/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(70, '2025-07-09 20:41:29.199884', '5', 'PCNJ-ORATO03356', 1, '[{\"added\": {}}]', 8, 3),
(71, '2025-07-09 21:24:09.431459', '6', 'PCNJ-CESFA02365', 1, '[{\"added\": {}}]', 8, 3),
(72, '2025-07-09 21:24:31.514606', '5', 'PCNJ-CESFA02365 - 09/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(73, '2025-07-09 21:26:20.929593', '7', 'PCNJ-ORATO00000', 1, '[{\"added\": {}}]', 8, 3),
(74, '2025-07-09 21:26:40.308684', '6', 'PCNJ-ORATO00000 - 01/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(75, '2025-07-09 21:29:04.621771', '8', 'PCNJ-OFIMAT002', 1, '[{\"added\": {}}]', 8, 3),
(76, '2025-07-09 21:29:28.632708', '7', 'PCNJ-OFIMAT002 - 02/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(77, '2025-07-11 18:11:13.080659', '7', 'PCNJ-OFIMAT002 - 02/07/2025', 3, '', 12, 4),
(78, '2025-07-11 18:16:25.763410', '9', 'PCNJ-ORATO02360', 1, '[{\"added\": {}}]', 8, 4),
(79, '2025-07-11 18:32:12.297906', '8', 'PCNJ-ORATO02360 - 01/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(80, '2025-07-11 18:39:24.960526', '6', 'PCNJ-ORATO00000 - 01/07/2025', 3, '', 12, 4),
(81, '2025-07-11 18:40:30.398593', '10', 'PCNJ-ESCAL1234', 1, '[{\"added\": {}}]', 8, 4),
(82, '2025-07-11 18:40:54.943653', '9', 'PCNJ-ESCAL1234 - 03/07/2025', 1, '[{\"added\": {}}]', 12, 4),
(83, '2025-07-11 18:43:43.570199', '11', 'PCNJ-GHUMA01234', 1, '[{\"added\": {}}]', 8, 3),
(84, '2025-07-11 18:44:17.224442', '10', 'PCNJ-GHUMA01234 - 04/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(85, '2025-07-11 20:42:39.983886', '5', 'Especificaciones - PCNJ-GHUMA01234', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 3),
(86, '2025-07-11 20:46:51.720925', '12', 'PCNJ-DISEÑ00001', 1, '[{\"added\": {}}]', 8, 3),
(87, '2025-07-11 20:48:51.060009', '11', 'PCNJ-DISEÑ00001 - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(88, '2025-07-11 20:51:30.126013', '6', 'Especificaciones - PCNJ-DISEÑ00001', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\", \"Software Instalado\"]}}]', 11, 3),
(89, '2025-07-11 20:58:46.484894', '6', 'Especificaciones - PCNJ-DISEÑ00001', 2, '[{\"changed\": {\"fields\": [\"Esp Memoria RAM\", \"Esp Conectividad Red\"]}}]', 11, 3),
(90, '2025-07-11 21:03:36.345061', '13', 'PCNJ-OFIMAT00002', 1, '[{\"added\": {}}]', 8, 3),
(91, '2025-07-11 21:03:53.112597', '14', 'PCNJ-ENFER00001', 1, '[{\"added\": {}}]', 8, 3),
(92, '2025-07-11 21:04:58.832890', '12', 'PCNJ-OFIMAT00002 - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(93, '2025-07-11 21:05:25.455695', '13', 'PCNJ-ENFER00001 - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(94, '2025-07-11 21:05:52.888085', '14', 'PCNJ-OFIMAT0241 - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(95, '2025-07-11 21:06:10.219757', '15', 'PCNJ-ESCAL1234 - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(96, '2025-07-11 21:21:08.482507', '15', 'mio', 1, '[{\"added\": {}}]', 8, 3),
(97, '2025-07-11 21:25:03.378482', '16', 'mio - 11/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(98, '2025-07-11 21:26:13.484152', '9', 'Especificaciones - mio', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 3),
(99, '2025-07-11 21:27:33.481647', '16', 'mio - 11/07/2025', 2, '[{\"changed\": {\"fields\": [\"Id Usuario\", \"Che Observaciones\"]}}]', 12, 3),
(100, '2025-07-11 21:31:19.878521', '5', 'user', 1, '[{\"added\": {}}]', 4, 4),
(101, '2025-07-11 21:32:13.260228', '5', 'user', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Groups\"]}}]', 4, 4),
(102, '2025-07-11 21:34:23.108199', '34', 'Sistemas', 1, '[{\"added\": {}}]', 7, 4),
(103, '2025-07-11 21:35:31.726599', '10', 'illustrator', 1, '[{\"added\": {}}]', 9, 4),
(104, '2025-07-11 21:37:16.673876', '1', 'Tema1', 1, '[{\"added\": {}}]', 13, 4),
(105, '2025-07-14 12:38:02.629686', '16', 'PCNJ-OFIMA04938', 1, '[{\"added\": {}}]', 8, 3),
(106, '2025-07-14 12:39:42.977399', '11', 'Veyon', 1, '[{\"added\": {}}]', 9, 3),
(107, '2025-07-14 12:40:00.243254', '17', 'PCNJ-OFIMA04938 - 14/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(108, '2025-07-14 12:41:33.740845', '10', 'Especificaciones - PCNJ-OFIMA04938', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 3),
(109, '2025-07-14 12:43:53.516224', '3', 'Especificaciones - PCNJ-ORATO02360', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 3),
(110, '2025-07-14 12:46:14.643031', '16', 'mio - 11/07/2025', 3, '', 12, 4),
(111, '2025-07-14 13:01:31.980995', '17', 'PCNJ-OFIMA04938', 1, '[{\"added\": {}}]', 8, 3),
(112, '2025-07-14 14:16:31.692721', '17', 'PCNJ-OFIMA04938', 3, '', 8, 4),
(113, '2025-07-14 14:17:17.548957', '18', 'PCNJ-OFIMA04938', 1, '[{\"added\": {}}]', 8, 3),
(114, '2025-07-14 14:17:58.343163', '18', 'PCNJ-OFIMA04938 - 14/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(115, '2025-07-14 14:19:55.702714', '18', 'PCNJ-OFIMA04938 - 14/07/2025', 2, '[{\"changed\": {\"fields\": [\"Id Usuario\", \"Software instalado\"]}}]', 12, 3),
(116, '2025-07-14 14:21:13.253501', '18', 'PCNJ-OFIMA04938', 3, '', 8, 4),
(117, '2025-07-14 14:22:21.548519', '18', 'PCNJ-OFIMA04938 - 14/07/2025', 3, '', 12, 4),
(118, '2025-07-14 14:23:01.533067', '19', 'PCNJ-OFIMA04938', 1, '[{\"added\": {}}]', 8, 3),
(119, '2025-07-14 14:23:30.301768', '19', 'PCNJ-OFIMA04938 - 01/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(120, '2025-07-14 14:25:20.399093', '19', 'PCNJ-OFIMA04938 - 01/07/2025', 3, '', 12, 4),
(121, '2025-07-14 14:25:20.408861', '17', 'PCNJ-OFIMA04938 - 14/07/2025', 3, '', 12, 4),
(122, '2025-07-14 14:25:30.031654', '19', 'PCNJ-OFIMA04938', 3, '', 8, 4),
(123, '2025-07-14 14:25:30.040601', '16', 'PCNJ-OFIMA04938', 3, '', 8, 4),
(124, '2025-07-14 14:27:00.025991', '20', 'PCNJ-EJEMP00001', 1, '[{\"added\": {}}]', 8, 3),
(125, '2025-07-14 14:27:52.760096', '20', 'PCNJ-EJEMP00001 - 14/07/2025', 1, '[{\"added\": {}}]', 12, 3),
(126, '2025-07-14 14:28:20.022637', '14', 'Especificaciones - PCNJ-EJEMP00001', 2, '[{\"changed\": {\"fields\": [\"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp Antivirus\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 3),
(127, '2025-07-14 14:56:47.461648', '14', 'Especificaciones - PCNJ-EJEMP00001', 2, '[{\"changed\": {\"fields\": [\"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\"]}}]', 11, 3),
(128, '2025-07-14 17:07:35.191063', '14', 'Especificaciones - PCNJ-EJEMP00001', 2, '[{\"changed\": {\"fields\": [\"Usuario\"]}}]', 11, 3),
(129, '2025-07-14 20:06:41.321144', '5', 'user', 3, '', 4, 4),
(130, '2025-07-14 20:06:50.914595', '1', 'administrador', 3, '', 4, 4),
(131, '2025-07-15 12:26:36.286653', '14', 'Especificaciones - PCNJ-EJEMP00001', 2, '[{\"changed\": {\"fields\": [\"Usuario\"]}}]', 11, 4),
(132, '2025-07-15 12:32:44.076560', '21', 'PCNJ-EJEMP00002', 1, '[{\"added\": {}}]', 8, 4),
(133, '2025-07-15 12:33:14.080877', '21', 'PCNJ-EJEMP00002 - 02/07/2025', 1, '[{\"added\": {}}]', 12, 4),
(134, '2025-07-15 12:33:51.413396', '15', 'Especificaciones - PCNJ-EJEMP00002', 2, '[{\"changed\": {\"fields\": [\"Usuario\", \"Esp Procesador\", \"Esp Disco Duro\", \"Esp Tipo Disco\", \"Esp Sistema Operativo\", \"Esp Version SO\", \"Esp Licencia SO\", \"Esp Memoria RAM\", \"Esp Tarjeta Video\", \"Esp Estado Bateria\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\", \"Esp Estado Equipo\", \"Esp Observaciones\"]}}]', 11, 4),
(135, '2025-07-15 13:46:03.834454', '5', 'Especificaciones - PCNJ-GHUMA01234', 2, '[{\"changed\": {\"fields\": [\"Usuario\", \"Esp SO Actualizado\", \"Esp Antivirus\", \"Esp Antivirus Actualizado\"]}}]', 11, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(13, 'admin_interface', 'theme'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'chequeos', 'areaservicio'),
(12, 'chequeos', 'chequeo'),
(8, 'chequeos', 'equipo'),
(11, 'chequeos', 'especificacionesequipo'),
(9, 'chequeos', 'software'),
(10, 'chequeos', 'usuario'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-07-08 20:55:04.813845'),
(2, 'auth', '0001_initial', '2025-07-08 20:55:05.570373'),
(3, 'admin', '0001_initial', '2025-07-08 20:55:05.770750'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-07-08 20:55:05.786775'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-07-08 20:55:05.801680'),
(6, 'admin_interface', '0001_initial', '2025-07-08 20:55:05.824099'),
(7, 'admin_interface', '0002_add_related_modal', '2025-07-08 20:55:05.928578'),
(8, 'admin_interface', '0003_add_logo_color', '2025-07-08 20:55:05.955096'),
(9, 'admin_interface', '0004_rename_title_color', '2025-07-08 20:55:05.971796'),
(10, 'admin_interface', '0005_add_recent_actions_visible', '2025-07-08 20:55:05.999174'),
(11, 'admin_interface', '0006_bytes_to_str', '2025-07-08 20:55:06.170513'),
(12, 'admin_interface', '0007_add_favicon', '2025-07-08 20:55:06.203154'),
(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2025-07-08 20:55:06.249162'),
(14, 'admin_interface', '0009_add_enviroment', '2025-07-08 20:55:06.303651'),
(15, 'admin_interface', '0010_add_localization', '2025-07-08 20:55:06.355213'),
(16, 'admin_interface', '0011_add_environment_options', '2025-07-08 20:55:06.450699'),
(17, 'admin_interface', '0012_update_verbose_names', '2025-07-08 20:55:06.465958'),
(18, 'admin_interface', '0013_add_related_modal_close_button', '2025-07-08 20:55:06.493089'),
(19, 'admin_interface', '0014_name_unique', '2025-07-08 20:55:06.518170'),
(20, 'admin_interface', '0015_add_language_chooser_active', '2025-07-08 20:55:06.548449'),
(21, 'admin_interface', '0016_add_language_chooser_display', '2025-07-08 20:55:06.575763'),
(22, 'admin_interface', '0017_change_list_filter_dropdown', '2025-07-08 20:55:06.587168'),
(23, 'admin_interface', '0018_theme_list_filter_sticky', '2025-07-08 20:55:06.618536'),
(24, 'admin_interface', '0019_add_form_sticky', '2025-07-08 20:55:06.671475'),
(25, 'admin_interface', '0020_module_selected_colors', '2025-07-08 20:55:06.768523'),
(26, 'admin_interface', '0021_file_extension_validator', '2025-07-08 20:55:06.789980'),
(27, 'admin_interface', '0022_add_logo_max_width_and_height', '2025-07-08 20:55:06.837847'),
(28, 'admin_interface', '0023_theme_foldable_apps', '2025-07-08 20:55:06.864932'),
(29, 'admin_interface', '0024_remove_theme_css', '2025-07-08 20:55:06.886167'),
(30, 'admin_interface', '0025_theme_language_chooser_control', '2025-07-08 20:55:06.915172'),
(31, 'admin_interface', '0026_theme_list_filter_highlight', '2025-07-08 20:55:06.943625'),
(32, 'admin_interface', '0027_theme_list_filter_removal_links', '2025-07-08 20:55:06.970918'),
(33, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2025-07-08 20:55:07.020373'),
(34, 'admin_interface', '0029_theme_css_generic_link_active_color', '2025-07-08 20:55:07.055007'),
(35, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2025-07-08 20:55:07.182656'),
(36, 'contenttypes', '0002_remove_content_type_name', '2025-07-08 20:55:07.313202'),
(37, 'auth', '0002_alter_permission_name_max_length', '2025-07-08 20:55:07.418455'),
(38, 'auth', '0003_alter_user_email_max_length', '2025-07-08 20:55:07.443768'),
(39, 'auth', '0004_alter_user_username_opts', '2025-07-08 20:55:07.465706'),
(40, 'auth', '0005_alter_user_last_login_null', '2025-07-08 20:55:07.660694'),
(41, 'auth', '0006_require_contenttypes_0002', '2025-07-08 20:55:07.682648'),
(42, 'auth', '0007_alter_validators_add_error_messages', '2025-07-08 20:55:07.699282'),
(43, 'auth', '0008_alter_user_username_max_length', '2025-07-08 20:55:07.727497'),
(44, 'auth', '0009_alter_user_last_name_max_length', '2025-07-08 20:55:07.754620'),
(45, 'auth', '0010_alter_group_name_max_length', '2025-07-08 20:55:07.786541'),
(46, 'auth', '0011_update_proxy_permissions', '2025-07-08 20:55:07.831547'),
(47, 'auth', '0012_alter_user_first_name_max_length', '2025-07-08 20:55:07.857143'),
(48, 'chequeos', '0001_initial', '2025-07-08 20:55:08.521549'),
(49, 'sessions', '0001_initial', '2025-07-08 20:55:08.579271'),
(50, 'chequeos', '0002_especificacionesequipo_creado_por', '2025-07-11 21:13:20.990416'),
(51, 'chequeos', '0003_remove_especificacionesequipo_creado_por_and_more', '2025-07-11 21:46:18.324325'),
(52, 'chequeos', '0004_alter_especificacionesequipo_esp_antivirus_and_more', '2025-07-14 14:38:03.588705'),
(53, 'chequeos', '0005_especificacionesequipo_usuario', '2025-07-14 15:14:31.811529'),
(54, 'chequeos', '0006_alter_especificacionesequipo_usuario', '2025-07-14 15:26:19.989759'),
(55, 'chequeos', '0007_equipo_id_usuario', '2025-07-14 17:28:32.154547'),
(56, 'chequeos', '0008_remove_equipo_id_usuario_and_more', '2025-07-14 20:29:14.679729'),
(57, 'chequeos', '0009_alter_especificacionesequipo_equipo_and_more', '2025-07-14 21:16:39.374270'),
(58, 'chequeos', '0010_alter_especificacionesequipo_usuario', '2025-07-14 21:28:17.592322'),
(59, 'chequeos', '0011_alter_equipo_equ_placa_serie', '2025-07-15 14:15:05.958837'),
(60, 'chequeos', '0012_alter_equipo_equ_placa_serie', '2025-07-15 14:16:51.717199');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0cqdcy43no3wrw0b8sut8xc7h5t2cxyb', '.eJxVjMsOwiAURP-FtSG8Hy7d9xvI5QJSNZCUdmX8d9ukC91N5pyZNwmwrTVsIy9hTuRKFLn8dhHwmdsB0gPavVPsbV3mSA-FnnTQqaf8up3u30GFUfe1A20Vs8V5k7TJtkjPchHW86iL5sIVnqJnPqNPiADWgi5Smj0rKSSSzxfc7jgd:1ubK4D:M4mXCxFGX7-SL3S7kQdgKfmV6jqtAvtNHkQomqGLAlg', '2025-07-28 14:22:05.424556'),
('w3rlno697n0fxm09r3nq10vd889rlf96', '.eJxVjDsOwjAQBe_iGlnxP6akzxmstXeNA8iW4qRC3J1ESgHtm5n3ZgG2tYSt0xJmZFcm2OV3i5CeVA-AD6j3xlOr6zJHfij8pJ1PDel1O92_gwK97LV0ymQdDUpNiVweSDlvUIvRkAaXR5DeEnohMzinbFKDJ4q7i9obbdnnC-U2OCI:1uZG36:ucw1Q2NM6Rkf5qyCtvmzua9Pu1RF6K9pN6ABm4XjajM', '2025-07-22 21:40:24.719896'),
('xybfvngib08sb051qn6lrribgu8elokf', '.eJxVjMEOwiAQRP-FsyEiLIsevfsNzbIsUjWQlPZk_HfbpAe9Tea9mbcaaJnLsHSZhjGpi7Lq8NtF4qfUDaQH1XvT3Oo8jVFvit5p17eW5HXd3b-DQr2sa58InUuQxRsGCQas85RttJmDUPA2O0DPZ-CEIMSIaE4GEI-yRlGfL-1MN8c:1ubgco:4EvXQANAICzdwMrvNGsiP4SGOC0x2LEvzX7nKzBF4z0', '2025-07-29 14:27:18.259645');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

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
-- Indices de la tabla `chequeos_areaservicio`
--
ALTER TABLE `chequeos_areaservicio`
  ADD PRIMARY KEY (`Id_Area`);

--
-- Indices de la tabla `chequeos_chequeo`
--
ALTER TABLE `chequeos_chequeo`
  ADD PRIMARY KEY (`Id_Chequeo`),
  ADD KEY `chequeos_chequeo_Id_Equipo_454b83af_fk_chequeos_equipo_Id_Equipo` (`Id_Equipo`),
  ADD KEY `chequeos_chequeo_Id_Usuario_cf57ac86_fk_chequeos_` (`Id_Usuario`),
  ADD KEY `chequeos_chequeo_creado_por_id_8742c9ca_fk_auth_user_id` (`creado_por_id`);

--
-- Indices de la tabla `chequeos_chequeo_software_instalado`
--
ALTER TABLE `chequeos_chequeo_software_instalado`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chequeos_chequeo_softwar_chequeo_id_software_id_2ea000e9_uniq` (`chequeo_id`,`software_id`),
  ADD KEY `chequeos_chequeo_sof_software_id_3fc633ff_fk_chequeos_` (`software_id`);

--
-- Indices de la tabla `chequeos_equipo`
--
ALTER TABLE `chequeos_equipo`
  ADD PRIMARY KEY (`Id_Equipo`),
  ADD KEY `chequeos_equipo_Area_id_8335e231_fk_chequeos_` (`Area_id`);

--
-- Indices de la tabla `chequeos_especificacionesequipo`
--
ALTER TABLE `chequeos_especificacionesequipo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipo_id` (`equipo_id`),
  ADD KEY `chequeos_especificac_Id_Usuario_5207f98f_fk_auth_user` (`Id_Usuario`);

--
-- Indices de la tabla `chequeos_software`
--
ALTER TABLE `chequeos_software`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `chequeos_usuario`
--
ALTER TABLE `chequeos_usuario`
  ADD PRIMARY KEY (`Id_Usuario`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `chequeos_areaservicio`
--
ALTER TABLE `chequeos_areaservicio`
  MODIFY `Id_Area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `chequeos_chequeo`
--
ALTER TABLE `chequeos_chequeo`
  MODIFY `Id_Chequeo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `chequeos_chequeo_software_instalado`
--
ALTER TABLE `chequeos_chequeo_software_instalado`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `chequeos_equipo`
--
ALTER TABLE `chequeos_equipo`
  MODIFY `Id_Equipo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `chequeos_especificacionesequipo`
--
ALTER TABLE `chequeos_especificacionesequipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `chequeos_software`
--
ALTER TABLE `chequeos_software`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `chequeos_usuario`
--
ALTER TABLE `chequeos_usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `chequeos_chequeo`
--
ALTER TABLE `chequeos_chequeo`
  ADD CONSTRAINT `chequeos_chequeo_Id_Equipo_454b83af_fk_chequeos_equipo_Id_Equipo` FOREIGN KEY (`Id_Equipo`) REFERENCES `chequeos_equipo` (`Id_Equipo`),
  ADD CONSTRAINT `chequeos_chequeo_Id_Usuario_cf57ac86_fk_chequeos_` FOREIGN KEY (`Id_Usuario`) REFERENCES `chequeos_usuario` (`Id_Usuario`),
  ADD CONSTRAINT `chequeos_chequeo_creado_por_id_8742c9ca_fk_auth_user_id` FOREIGN KEY (`creado_por_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `chequeos_chequeo_software_instalado`
--
ALTER TABLE `chequeos_chequeo_software_instalado`
  ADD CONSTRAINT `chequeos_chequeo_sof_chequeo_id_5a9dbc91_fk_chequeos_` FOREIGN KEY (`chequeo_id`) REFERENCES `chequeos_chequeo` (`Id_Chequeo`),
  ADD CONSTRAINT `chequeos_chequeo_sof_software_id_3fc633ff_fk_chequeos_` FOREIGN KEY (`software_id`) REFERENCES `chequeos_software` (`id`);

--
-- Filtros para la tabla `chequeos_equipo`
--
ALTER TABLE `chequeos_equipo`
  ADD CONSTRAINT `chequeos_equipo_Area_id_8335e231_fk_chequeos_` FOREIGN KEY (`Area_id`) REFERENCES `chequeos_areaservicio` (`Id_Area`);

--
-- Filtros para la tabla `chequeos_especificacionesequipo`
--
ALTER TABLE `chequeos_especificacionesequipo`
  ADD CONSTRAINT `chequeos_especificac_Id_Usuario_5207f98f_fk_auth_user` FOREIGN KEY (`Id_Usuario`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `chequeos_especificac_equipo_id_daca4b2f_fk_chequeos_` FOREIGN KEY (`equipo_id`) REFERENCES `chequeos_equipo` (`Id_Equipo`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
