<?php
/**
 * Chứa các tham số cấu hình
 */
date_default_timezone_set('Asia/Ho_Chi_Minh');

const _MODULE_DEFAULT = 'home';
const _ACTION_DEFAULT = 'lists';

const _INCODE = true; // ngăn chặn hành vi truy cập trực tiếp vào file

// Thiết lập host
define('_WEB_HOST_ROOT', 'http://'.$_SERVER['HTTP_HOST'].'/PHP/PHP_co_ban/Module04/users_manager'); //địa chỉ trang chủ

define('_WEB_HOST_TEMPLATE', _WEB_HOST_ROOT.'/templates');


// Thiết lập path
define('_WEB_PATH_ROOT', __DIR__);
define('_WEB_PATH_TEMPLATE', _WEB_PATH_ROOT.'\templates');

// thiết lập kết nối csdl
const _HOST = 'localhost';
const _USER = 'root';
const _PASS = ''; //Ampp _PASS = 'mysql';
const _DB = 'qlbanhang';
const _DRIVER = 'mysql';

//Phân trang
const _USER_ON_PAGE = 2;
const _LIMIT_PAGINATION = 10;

//Thời gian hủy phiên đăng nhập
const _TIME_OUT_LOGIN = 15;