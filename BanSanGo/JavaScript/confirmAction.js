function confirmAction(actionUrl, message) {
    // Nếu không truyền message, sử dụng thông báo mặc định
    message = message || 'Bạn có chắc chắn muốn thực hiện hành động này?';

    // Hiển thị hộp thoại xác nhận
    var result = confirm(message);

    if (result) {
        // Nếu người dùng chọn "Yes", chuyển hướng tới URL thực thi hành động
        window.location.href = actionUrl;
    }

    return false; // Ngừng hành động mặc định của link
}
