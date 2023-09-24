<?php
if(!defined('_INCODE')) die('Access denied...');
removeSession();
autoLogin();
?>
<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Trang chủ</title>
   <link rel="stylesheet" href="<?php echo _WEB_HOST_TEMPLATE; ?>/css/bootstrap.min.css">
   <link rel="stylesheet" href="<?php echo _WEB_HOST_TEMPLATE; ?>/css/font-awesome.min.css">
   <link rel="stylesheet" href="<?php echo _WEB_HOST_TEMPLATE; ?>/css/style.css?ver=<?php echo rand(); ?>">
</head>

<body>
   <div class="container">
      <div class="row" style="height:100vh">
         <div class="col-12 d-flex flex-column align-items-center justify-content-center">
            <h1 class="text-uppercase">Hệ thống quản lý người dùng</h1>
            <a href="?module=users" class="btn btn-success btn-lg text-center">Quản lý</a>
         </div>
      </div>
   </div>
</body>
<script type="text/javascript" src="<?php echo _WEB_HOST_TEMPLATE; ?>/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<?php echo _WEB_HOST_TEMPLATE; ?>/js/custom.js"></script>
</body>

</html>