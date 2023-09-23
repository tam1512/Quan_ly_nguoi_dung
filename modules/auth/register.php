<?php
if(!defined('_INCODE')) die('Access denied...');
/**
 * Chứa chức năng đăng ký
 */
$data = [
   'title' => 'Đăng ký tài khoản'
];

 layout('header-login', $data);

 // Xử lý đăng ký

 if(isPost()) {

   //Validate form
   $body = getBody(); //lấy tất cả dữ liệu trong form

   $errors = []; // mãng lưu trữ các lỗi

   // Lọc giá trị ban đầu
   $fullname = trim($body['fullname']);
   $phone = trim($body['phone']);
   $email = trim($body['email']);
   $password = trim($body['password']);
   $confirm_password = trim($body['confirm_password']);

   // Validate họ tên: bắt buộc nhập, >= 5 ký tự
   if(empty($fullname)) {
      $errors['fullname']['required'] = 'Họ và tên không được để trống';
   } else if (strlen($fullname) < 5) {
      $errors['fullname']['min'] = 'Họ và tên tối thiểu phải có 5 ký tự';
   }

   //Validate phone: không được bỏ trống, là số điện thoại
   if(empty($phone)) {
      $errors['phone']['required'] = 'Số điện thoại không được để trống';
   } else if(!isPhone($phone)) {
      $errors['phone']['invalid'] = 'Số điện thoại không hợp lệ';
   }

   //Validate email: không được bỏ trống, là email, email phải là duy nhất
   if(empty($email)) {
      $errors['email']['required'] = 'Email không được để trống';
   } else {
      if(!isEmail($email)) {
         $errors['email']['invalid'] = 'Địa chỉ email không hợp lệ';
      } else {
         $sql = "SELECT id FROM users WHERE email = '$email'";
         if(getRows($sql) > 0) {
            $errors['email']['unique'] = 'Địa chỉ email đã tồn tại';
         }
      }
   }

   // Validate mật khẩu: bắt buộc nhập, >= 8 ký tự
   if(empty($password)) {
      $errors['password']['required'] = 'Mật khẩu không được để trống';
   } else if (strlen($password) < 8) {
      $errors['password']['min'] = 'Mật khẩu tối thiểu phải có 8 ký tự';
   }

   // Validate nhập lại mật khẩu: bắt buộc nhập, trùng với mật khẩu
   if(empty($confirm_password)) {
      $errors['confirm_password']['required'] = 'Nhập lại mật khẩu không được để trống';
   } else if ($password !== $confirm_password)  {
      $errors['confirm_password']['match'] = 'Mật khẩu không trùng khớp';
   }

   if(empty($errors)) {
      // Không có lỗi xảy ra
      $activeToken = sha1(uniqid().time());
      $dataInsert = [
         'email' => $email,
         'fullname' => $fullname,
         'phone' => $phone,
         'password' => password_hash($password, PASSWORD_DEFAULT),
         'activeToken' => $activeToken,
         'createAt' => date('Y-m-d H:i:s')
      ];

      $insertStatus = insert('users', $dataInsert);
      if($insertStatus) {
         //Tạo link active 
         $linkActive = _WEB_HOST_ROOT.'?module=auth&action=active&token='.$activeToken;

         // Thiết lập gửi mail
         $subject = $fullname.' vui lòng kích hoạt tài khoản';
         $content = "Xin chào $fullname <br><br>";
         $content.= "Vui lòng click vào link bên dưới để kích hoạt tài khoản của bạn: <br><br>";
         $content.= "$linkActive <br><br>";
         $content.= "Trân trọng!";

         //Tiến hành gửi mail
         $senStatus = sendMail($email, $subject, $content);
         if($senStatus) {
            setFlashData('message', 'Đăng ký thành công. Vui lòng kiểm tra email để kích hoạt tài khoản.');
            setFlashData('msg_type', 'success');
         } else {
            setFlashData('message', 'Lỗi hệ thống. Vui lòng thử lại sau. 1');
            setFlashData('msg_type', 'danger');
         }
      } else {
         setFlashData('message', 'Lỗi hệ thống. Vui lòng thử lại sau.');
         setFlashData('msg_type', 'danger');
      }
      redirect('?module=auth&action=register');
   } else {
      setFlashData('message', 'Vui lòng kiểm tra dữ liệu nhập vào!');
      setFlashData('msg_type', 'danger');
      setFlashData('errors', $errors);
      setFlashData('old', $body);
      redirect('?module=auth&action=register');
   }
}

$message = getFlashData('message');
$msgType = getFlashData('msg_type');
$errors = getFlashData('errors');
$old = getFlashData('old');

 ?>

<div class="row">
   <div class="col-6" style="margin: 20px auto;">
      <h3 class="text-center text-uppercase">Đăng ký tài khoản</h3>

      <?php 
         getMsg($message, $msgType);
      ?>

      <form action="" method="post">
         <div class="form-group">
            <label for="fullname">Họ tên</label>
            <input type="text" id="fullname" name="fullname" class="form-control" placeholder="Họ tên..."
               value="<?php echo old('fullname', $old) ?>">
            <?php echo form_error('fullname', $errors, '<span class="error">', '</span>') ?>
         </div>
         <div class="form-group">
            <label for="phone">Số điện thoại</label>
            <input type="text" id="phone" name="phone" class="form-control" placeholder="Số điện thoại..."
               value="<?php echo old('phone', $old) ?>">
            <?php echo form_error('phone', $errors, '<span class="error">', '</span>') ?>
         </div>
         <div class="form-group">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" class="form-control" placeholder="Địa chỉ email..."
               value="<?php echo old('email', $old) ?>">
            <?php echo form_error('email', $errors, '<span class="error">', '</span>') ?>
         </div>
         <div class="form-group">
            <label for="password">Mật khẩu</label>
            <input type="password" id="password" name="password" class="form-control" placeholder="Mật khẩu"
               value="<?php echo old('password', $old) ?>">
            <?php echo form_error('password', $errors, '<span class="error">', '</span>') ?>
         </div>
         <div class="form-group">
            <label for="confirm_password">Nhập lại mật khẩu</label>
            <input type="password" id="confirm_password" name="confirm_password" class="form-control"
               placeholder="Nhập lại mật khẩu" value="<?php echo old('confirm_password', $old) ?>">
            <?php echo form_error('confirm_password', $errors, '<span class="error">', '</span>') ?>
         </div>
         <button class="btn btn-primary btn-block" type="submit">Đăng ký</button>
         <hr>
         <p class="text-center"><a href="?module=auth&action=login">Đăng nhập hệ thống</a></p>
      </form>
   </div>
</div>

<?php
  layout('footer-login', $data);
 ?>