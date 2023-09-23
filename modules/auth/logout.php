<?php
if(!defined('_INCODE')) die('Access denied...');
/**
 * Chứa chức năng đăng xuất
 */

 if(isLogin()) {
   $token = getSession('login_token');
   delete('loginToken', "token = '$token'");
   removeSession('login_token');
   redirect('?module=auth&action=login');   
 }