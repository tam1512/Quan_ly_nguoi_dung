<?php
if(!defined('_INCODE')) die('Access denied...');
/**
 * Chứa chức năng kích hoạt tài khoản (đk -> nhận mail -> nhâp link -> xác  thực -> kết quả)
 */

 layout('header-login', 'Trang kích hoạt tài khoản');
 echo '<div class="container text-center"></br>';
 $activeToken = getBody()['token'];
 if(!empty($activeToken)) {
   // truy vấn kiểm tra token với database
   $tokenQuery = firstRaw("SELECT id, fullname, email FROM users WHERE activeToken = '$activeToken'");
   echo '<pre>';
   
   if(!empty($tokenQuery)) {
      $userId = $tokenQuery['id'];
      $userFullname = $tokenQuery['fullname'];
      $userEmail = $tokenQuery['email'];

      $dataUpdate = [
         'status' => 1,
         'activeToken' => null
      ];

      $updateStatus = update('users', $dataUpdate, "id = $userId");
      if($updateStatus) {
         setFlashData('msg', 'Kích hoạt tài khoản thành công! Bạn có thể đăng nhập tài khoản ngay bây giờ.');
         setFlashData('msg_type', 'success');

         //Tạo link login
         $loginLink = _WEB_HOST_ROOT.'?module=auth&action=login';

         //Gửi email khi kích hoạt thành công
         $subject = "Kích hoạt tài khoản thành công!";
         $content = "Chúc mừng $userFullname đã kích hoạt tài khoản thành công <br><br>";
         $content.= "Bạn có thể đăng nhập tài khoản của mình tại link sau: <br><br>";
         $content.= $loginLink . '<br><br>';
         $content.= 'Trân trọng!';

         sendMail($userEmail, $subject, $content);
      } else {
         setFlashData('msg', 'Kích hoạt tài khoản thất bại! Vui lòng liên hệ quả trị viên.');
         setFlashData('msg_type', 'danger');
      }
      redirect('?module=auth&action=login');
   } else {
      getMsg('Liên kết không tồn tại hoặc đã hết hạn', 'danger');
   }
 } else {
   getMsg('Liên kết không tồn tại hoặc đã hết hạn', 'danger');
 }

 echo "</div>";
 layout('footer-login');