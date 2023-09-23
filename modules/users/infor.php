<?php
if(!defined('_INCODE')) die('Access denied...');
/**
 * Chứa chức năng hiển thị thông tin người dùng
 */
$data = [
   'title' => 'Thông tin người dùng'
];

 layout('header', $data);

 // Xử lý lấy ra thông tin người dùng
 if(isGet()) {
   $userId = trim(getBody()['id']);
   
   if(!empty($userId)) {
      $userDefault = firstRaw("SELECT * FROM users WHERE id = '$userId'");
      setFlashData('userDefault', $userDefault);
   } else {
      redirect("?module=users");
   }
}

$infor = getFlashData('userDefault');
?>
<hr>
<div class="container mt-5">
   <div class="card">
      <div class="card-header">
         <h3>Thông tin người dùng</h3>
      </div>
      <div class="card-body">
         <div class="form-group">
            <label>Email:</label>
            <input type="text" class="form-control" value="<?php echo form_infor('email', $infor) ?>" readonly>
         </div>
         <div class="form-group">
            <label>Số điện thoại:</label>
            <input type="text" class="form-control" value="<?php echo form_infor('phone', $infor) ?>" readonly>
         </div>
         <div class="form-group">
            <label>Họ tên đầy đủ:</label>
            <input type="text" class="form-control" value="<?php echo form_infor('fullname', $infor) ?>" readonly>
         </div>
         <div class="form-group">
            <label>Trạng thái tài khoản:</label>
            <input type="text" class="form-control"
               value="<?php echo form_infor('status', $infor) == 0 ? 'Chưa kích hoạt' : 'Kích hoạt' ?>" readonly>
         </div>
         <div class="form-group">
            <label>Ngày tạo:</label>
            <input type="text" class="form-control"
               value="<?php echo date('d-m-Y', strtotime(form_infor('createAt', $infor))) ?>" readonly>
         </div>
         <div class="form-group">
            <label>Ngày cập nhật gần nhất:</label>
            <input type="text" class="form-control"
               value="<?php echo form_infor('updateAt', $infor) ? date('d-m-Y', strtotime(form_infor('createAt', $infor))) :'Chưa sử dụng chức năng cập nhật' ?>"
               readonly>
         </div>
      </div>
      <div class="card-footer">
         <a href="?module=users" class="btn btn-success btn-sm">Quay lại</a>
         <a href="?module=users&action=edit&id=<?php setFlashData('infor', 'quay lại trang infor'); echo $userId; ?>"
            class="btn btn-primary btn-sm">Chỉnh sửa</a>
      </div>
   </div>
</div>
<hr>
<?php
  layout('footer');
 ?>