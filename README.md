# Quan_ly_nguoi_dung
Các chức năng:
- Đăng nhập
- Đăng xuất
- Đăng ký (gửi email để kích hoạt tài khoản) (đã hủy để làm chức năng phân quyền)
- Quên mật khẩu (gửi email để xác nhận)
- Hiển thị danh sách người dùng: sửa và xóa thông tin của người dùng (tương lai sẽ phát triển thêm quyền để chỉ người được phép mới được sử dụng chức năng này)
- Phân trang
- Tìm kiếm theo trạng thái và theo tên
- Thêm người dùng
- Xem thông tin cá nhân (có thể đổi tên và số điện thoại ở đây)
- Đổi mật khẩu
- Phân quyền:
  + Toàn quyền: thêm, sửa, xóa
  + Chỉ đọc: chỉ được đọc
  + Sửa: chỉ dược sửa (chỉ được chọn các quyền bằng hoặc thấp hơn mình)
  + Sửa và xóa: được chỉnh sửa và xóa người dùng
  + Có phân cấp bậc tài khoản theo nguyên tắt: add và delete (1), delete(2), add(3), readonly(4)
  + Tài khoản cao hơn thì được giử lại toàn quyền của mình, cấp bậc bằng hoặc thấp hơn thì không được xóa và chỉnh sửa
