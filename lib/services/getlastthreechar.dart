int getLastThreeCharsAsInteger(String inputString) {
  // Sử dụng phương thức `substring` để lấy ba ký tự cuối cùng của chuỗi
  String lastThreeChars = inputString.substring(inputString.length - 3);

  // Sử dụng phương thức `trim` để loại bỏ khoảng trắng (nếu có)
  lastThreeChars = lastThreeChars.trim();

  // Sử dụng phương thức `isEmpty` để kiểm tra xem chuỗi có rỗng không
  if (lastThreeChars.isEmpty) {
    print("Chuỗi không đủ ba ký tự");
    return 0; // Giá trị mặc định hoặc xử lý khác theo ý bạn
  }

  // Sử dụng phương thức `parse` để chuyển đổi chuỗi thành số nguyên
  int? result = int.tryParse(lastThreeChars);

  // Sử dụng phương thức `??` để xử lý giá trị mặc định nếu chuyển đổi không thành công
  return result ?? 0;
}
