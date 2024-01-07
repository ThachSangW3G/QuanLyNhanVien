import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';

class AddStaffTab extends StatefulWidget {
  const AddStaffTab({super.key});

  @override
  State<AddStaffTab> createState() => _AddStaffTabState();
}

const List<String> listGender = <String>['Nam', 'Nữ'];

class _AddStaffTabState extends State<AddStaffTab> {
  String? tennv;
  String? maNV;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTextStyle(
      style: const TextStyle(),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width / 30),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  'Nhân viên',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CeraPro'),
                ),
                Icon(Icons.keyboard_arrow_right),
                Text(
                  'Thêm mới nhân viên',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'CeraPro'),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 30,
            ),
            const Row(
              children: [
                Text(
                  'Những ô có đánh dấu',
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  ' * ',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  'là bắt buộc',
                  style: TextStyle(fontSize: 10),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 30,
            ),
            Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(fontSize: 16, fontFamily: 'CeraPro'),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: AppColors.greyShuttle),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InputTextField(
                                  label: 'Mã Nhân Viên',
                                  name: '',
                                  isRequired: true,
                                  hinttext: 'NV001',
                                  onChanged: (value) {
                                    maNV = value;
                                    print(maNV);
                                  }),
                              const SizedBox(
                                width: 45,
                              ),
                              InputTextField(
                                  label: 'Họ và Tên',
                                  name: '',
                                  isRequired: true,
                                  hinttext: 'Nguyễn Văn A',
                                  onChanged: (value) {
                                    tennv = value;
                                  }),
                              const SizedBox(
                                width: 45,
                              ),
                              // InputTextField(
                              //     label: 'Biệt Danh',
                              //     name: '',
                              //     isRequired: false,
                              //     hinttext: 'Tính Đẹp Trai',
                              //     onChanged: (value) {}),
                              Expanded(child: Container())
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              InputTextField(
                                  label: 'Email',
                                  name: '',
                                  isRequired: true,
                                  hinttext: 'nguyenvana@gmail.com',
                                  onChanged: (valua) {}),
                              const SizedBox(
                                width: 45,
                              ),
                              InputNumberField(
                                  label: 'Số Điện Thoại',
                                  name: '',
                                  hinttext: '0123456789',
                                  onChanged: (valua) {}),
                              const SizedBox(
                                width: 45,
                              ),
                              InputTimePicker(
                                  label: 'Ngày sinh',
                                  name: '',
                                  hinttext: 'DD/MM/YYYY',
                                  onChanged: (value) {}),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputSelect(
                                  list: listGender,
                                  label: 'Giới tính',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn giới tính--'),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: listGender,
                                  label: 'Tình trạng hôn nhân',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn tình trạng hôn nhân--'),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: provinces,
                                  label: 'Nơi sinh',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn nơi sinh--'),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputTextMultiline(
                                  label: 'Địa chỉ tạm trú',
                                  name: '',
                                  hinttext: '',
                                  onChanged: (value) {}),
                              const SizedBox(
                                width: 45,
                              ),
                              InputTextMultiline(
                                  label: 'Địa chỉ thường trú',
                                  name: '',
                                  hinttext: '',
                                  onChanged: (value) {}),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputSelect(
                                  list: listGender,
                                  label: 'Quốc tịch',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn quốc tịch--'),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: listGender,
                                  label: 'Dân tộc',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn dân tộc--'),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: provinces,
                                  label: 'Tôn giáo',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn tôn giáo--'),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputNumberField(
                                  label: 'Số CMND/CCCD',
                                  name: '',
                                  hinttext: '--Nhập số CMND/CCCD--',
                                  onChanged: (valua) {}),
                              const SizedBox(
                                width: 45,
                              ),
                              InputTimePicker(
                                  label: 'Ngày cấp CMND/CCCD',
                                  name: '',
                                  hinttext: 'DD/MM/YYYY',
                                  onChanged: (value) {}),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: provinces,
                                  label: 'Nơi cấp CMND/CCCD',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn nơi cấp CCCD/CMND--'),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputSelect(
                                  list: provinces,
                                  label: 'Phòng ban',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn phòng ban--'),
                              const SizedBox(
                                width: 45,
                              ),
                              InputSelect(
                                  list: provinces,
                                  label: 'Chức vụ',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn chức vụ--'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

List<String> marrys = ['Độc thân', 'Đã kết hôn'];

List<String> provinces = [
  'An Giang',
  'Bà Rịa - Vũng Tàu',
  'Bắc Giang',
  'Bắc Kạn',
  'Bạc Liêu',
  'Bắc Ninh',
  'Bến Tre',
  'Bình Định',
  'Bình Dương',
  'Bình Phước',
  'Bình Thuận',
  'Cà Mau',
  'Cần Thơ',
  'Cao Bằng',
  'Đà Nẵng',
  'Đắk Lắk',
  'Đắk Nông',
  'Điện Biên',
  'Đồng Nai',
  'Đồng Tháp',
  'Gia Lai',
  'Hà Giang',
  'Hà Nam',
  'Hà Nội',
  'Hà Tĩnh',
  'Hải Dương',
  'Hải Phòng',
  'Hậu Giang',
  'Hòa Bình',
  'Hưng Yên',
  'Khánh Hòa',
  'Kiên Giang',
  'Kon Tum',
  'Lai Châu',
  'Lâm Đồng',
  'Lạng Sơn',
  'Lào Cai',
  'Long An',
  'Nam Định',
  'Nghệ An',
  'Ninh Bình',
  'Ninh Thuận',
  'Phú Thọ',
  'Phú Yên',
  'Quảng Bình',
  'Quảng Nam',
  'Quảng Ngãi',
  'Quảng Ninh',
  'Quảng Trị',
  'Sóc Trăng',
  'Sơn La',
  'Tây Ninh',
  'Thái Bình',
  'Thái Nguyên',
  'Thanh Hóa',
  'Thừa Thiên Huế',
  'Tiền Giang',
  'Trà Vinh',
  'Tuyên Quang',
  'Vĩnh Long',
  'Vĩnh Phúc',
  'Yên Bái',
];
