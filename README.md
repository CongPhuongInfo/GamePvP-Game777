# Game777

Trò chơi máy xóc đĩa 777 (kiểu slot cổ điển) trên mạng LAN hoặc Online.
Chuyển thể từ GamePvP-VongQuayRong, giữ nguyên kiến trúc mạng star-topology
(NetworkHub.vb/NetworkPeer.vb) và luật "đặt cược chung 1 vòng quay", chỉ đổi
12 con vật thành 12 biểu tượng máy đánh bạc cổ điển.

# Các tính năng chính
- Đặt điểm chọn biểu tượng để cược (7 Đỏ, 7 Vàng, Kim cương, BAR, Chuông,
  Dưa hấu, Móng ngựa, và các loại trái cây: Anh đào, Chanh, Cam, Nho, Táo)
- Có nổ hũ (No Hu)

# Biểu tượng & hệ số thưởng
| Biểu tượng   | Hệ số | Độ hiếm |
|--------------|-------|---------|
| Anh đào, Chanh, Cam, Nho, Táo | x5 | Thường |
| Chuông, BAR, Dưa hấu, Móng ngựa | x6 | Khá |
| Số 7 Đỏ, Số 7 Vàng, Kim cương | x9 | Hiếm |

Trọng số quay giữ nguyên logic gốc (BASE_WEIGHT / HeSo) để RTP giữa các
biểu tượng tương đương nhau, có thể chỉnh ở `BuildSymbols()` trong
`Game777Game.vb`.

# Assets
Thư mục `Assets/` hiện chỉ còn `nohu.png` / `nohu_hieuung.png` (sprite ô
Nổ Hũ). Game vẫn chạy bình thường và tự vẽ hình tròn màu + tên biểu tượng
khi chưa có sprite. Muốn có hình đẹp, bỏ thêm các file ảnh cùng tên đã khai
báo trong `BuildSymbols()` (chuong.png, cherry.png, chanh.png, so7do.png,
kimcuong.png, bar.png, cam.png, duahau.png, so7vang.png, nho.png,
mongngua.png, tao.png) và `Logo777.png` (logo giữa vòng quay) vào thư mục
Assets cạnh file .exe.
