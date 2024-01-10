import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quanlynhanvien/components/input.number.component.dart';
import 'package:quanlynhanvien/components/input.select.component.dart';
import 'package:quanlynhanvien/components/input.text.component.dart';
import 'package:quanlynhanvien/components/input.text.multiline.component.dart';
import 'package:quanlynhanvien/components/input.time.component.dart';
import 'package:quanlynhanvien/constants/app_colors.dart';
import 'package:quanlynhanvien/models/chucvu.model.dart';
import 'package:quanlynhanvien/models/nhanvien.model.dart';
import 'package:quanlynhanvien/models/phongban.model.dart';
import 'package:quanlynhanvien/providers/chucvu.provider.dart';
import 'package:quanlynhanvien/providers/nhanvien.provider.dart';
import 'package:quanlynhanvien/providers/phongban.provider.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:quanlynhanvien/services/getlastthreechar.dart';

class AddStaffTab extends StatefulWidget {
  const AddStaffTab({super.key});

  @override
  State<AddStaffTab> createState() => _AddStaffTabState();
}

const List<String> listGender = <String>['Nam', 'Nữ'];
const List<String> listMarriage = <String>['Đã kết hôn', 'Chưa kết hôn'];
const List<String> listNational = <String>['Việt Nam', 'Nước ngoài'];

const List<String> listTonGiao = <String>[
  'Không',
  'Phật giáo',
  'Công giáo',
  'Tin lành',
  'Hồi giáo',
  'Cao Đài',
  'Khác'
];

const List<String> listDanToc = <String>[
  'Kinh',
  'Tày',
  'Thái',
  'Mường',
  "H'Mông",
  'Dao',
  'Nùng',
  'Hrê',
  'Gia Rai',
  'Ê Đê',
  'Ba Na',
  'Xơ Đăng',
  "M'Nông",
  'Xtiêng',
  'Raglai',
  'Chăm',
  'Chu Ru',
  'Cơ Ho',
  'Bana',
  'Bru-Vân Kiều',
  'Khmer',
  'Cống',
  'Sán Chay',
  'Co Lao',
  'La Chi',
  'La Ha',
  'Pu Péo',
  'Lự',
  'Lô Lô',
  'Chơ Ro',
  'Mảng',
  'Bố Y',
  'Si La',
  'Puồng',
  'Rơ Măm',
  'Lự',
  'Hà Nhì',
  'La Hủ',
  'Pa Then',
  'Mạ',
  'Ơ Đu',
  'Kháng',
  'Co Tu',
  'Giáy',
  'Nùng An',
  'Hà Nhì',
  'Xinh Mun',
  'Kon Tum',
  'Lào',
  'Pà Thẻn',
];

class _AddStaffTabState extends State<AddStaffTab> {
  String? tenNV;
  String? image;
  String? email;
  String? soDienThoai;
  DateTime? ngaySinh;
  String? gioiTinh;
  String? tinhTrangHonNhan;
  String? noiSinh;
  String? diaChiThuongTru;
  String? diaChiTamTru;
  String? quocTich;
  String? danToc;
  String? tonGiao;
  String? cCCD;
  DateTime? ngayCap;
  String? noiCap;
  String? maPB;
  String? maCV;

  @override
  void initState() {
    //deleteVegetable();
    super.initState();
  }

  String defaultImageUrl =
      'https://inkythuatso.com/uploads/thumbnails/800/2023/03/6-anh-dai-dien-trang-inkythuatso-03-15-26-36.jpg';
  String selectedFile = '';
  //XFile file;
  Uint8List? selectedImageInBytes;

  _selectFile(bool imageFrom) async {
    FilePickerResult? fileResult =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (fileResult != null) {
      selectedFile = fileResult.files.first.name;
      setState(() {
        selectedImageInBytes = fileResult.files.first.bytes;
      });
    }
    print(selectedFile);
  }

  Future<String> _uploadFile() async {
    String imageUrl = '';
    try {
      firabase_storage.UploadTask uploadTask;

      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('images')
          .child('/' + selectedFile);

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      //uploadTask = ref.putFile(File(file.path));
      uploadTask = ref.putData(selectedImageInBytes!, metadata);

      await uploadTask.whenComplete(() => null);
      imageUrl = await ref.getDownloadURL();
    } catch (e) {
      print(e);
    }
    return imageUrl;
  }

  SnackBar successSnackbar = SnackBar(
    backgroundColor: Colors.green,
    content: Container(
      height: 50,
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.check,
          color: Colors.white,
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'Thêm nhân viên thành công!',
        )
      ]),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 280.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );

  SnackBar faledSnackbar = SnackBar(
    backgroundColor: Colors.red,
    content: Container(
      height: 50,
      child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.close_outlined,
          color: Colors.white,
        ),
        SizedBox(
          width: 18,
        ),
        Text(
          'Thêm nhân viên thất bại!',
        )
      ]),
    ),
    duration: const Duration(milliseconds: 1500),
    width: 280.0, // Width of the SnackBar.

    padding: const EdgeInsets.symmetric(
      horizontal: 8.0, // Inner padding for SnackBar content.
    ),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
  );
  @override
  Widget build(BuildContext context) {
    final phongBanProvider = Provider.of<PhongBanProvider>(context);
    final chucVuProvider = Provider.of<ChucVuProvider>(context);
    final nhanVienProvider = Provider.of<NhanVienProvider>(context);
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width / 30),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 30,
          ),
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
            child: DefaultTextStyle(
              style: const TextStyle(fontSize: 16, fontFamily: 'CeraPro'),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.greyShuttle),
                    borderRadius: BorderRadius.circular(15)),
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Ảnh thẻ 3x4'),
                            const SizedBox(
                              height: 16,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                _selectFile(false);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyShuttle,
                              ),
                              child: const Text('Choose File',
                                  style: TextStyle(
                                      fontFamily: 'CeraPro',
                                      color: AppColors.white)),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 45,
                        ),
                        selectedImageInBytes == null
                            ? Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(defaultImageUrl),
                                        fit: BoxFit.cover)),
                              )
                            : Container(
                                height: 200,
                                width: 150,
                                child: Image.memory(
                                  selectedImageInBytes!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        InputTextField(
                            label: 'Họ và Tên',
                            name: '',
                            isRequired: true,
                            hinttext: 'Nguyễn Văn A',
                            onChanged: (value) {
                              tenNV = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
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
                            onChanged: (value) {
                              email = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        InputNumberField(
                            label: 'Số Điện Thoại',
                            name: '',
                            hinttext: '0123456789',
                            onChanged: (value) {
                              soDienThoai = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        InputTimePicker(
                            label: 'Ngày sinh',
                            name: '',
                            hinttext: 'DD/MM/YYYY',
                            onChanged: (value) {
                              ngaySinh = value;
                            }),
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
                            onChanged: (value) {
                              gioiTinh = value;
                            },
                            hinttext: '--Chọn giới tính--'),
                        const SizedBox(
                          width: 45,
                        ),
                        InputSelect(
                            list: listMarriage,
                            label: 'Tình trạng hôn nhân',
                            selectedOption: '',
                            onChanged: (value) {
                              tinhTrangHonNhan = value;
                            },
                            hinttext: '--Chọn tình trạng hôn nhân--'),
                        const SizedBox(
                          width: 45,
                        ),
                        InputSelect(
                            list: provinces,
                            label: 'Nơi sinh',
                            selectedOption: '',
                            onChanged: (value) {
                              noiSinh = value;
                            },
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
                            label: 'Địa chỉ thường trú',
                            name: '',
                            hinttext: '',
                            onChanged: (value) {
                              diaChiThuongTru = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        InputTextMultiline(
                            label: 'Địa chỉ tạm trú',
                            name: '',
                            hinttext: '',
                            onChanged: (value) {
                              diaChiTamTru = value;
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputSelect(
                            list: listNational,
                            label: 'Quốc tịch',
                            selectedOption: '',
                            onChanged: (value) {
                              quocTich = value;
                            },
                            hinttext: '--Chọn quốc tịch--'),
                        const SizedBox(
                          width: 45,
                        ),
                        InputSelect(
                            list: listDanToc,
                            label: 'Dân tộc',
                            selectedOption: '',
                            onChanged: (value) {
                              danToc = value;
                            },
                            hinttext: '--Chọn dân tộc--'),
                        const SizedBox(
                          width: 45,
                        ),
                        InputSelect(
                            list: listTonGiao,
                            label: 'Tôn giáo',
                            selectedOption: '',
                            onChanged: (value) {
                              tonGiao = value;
                            },
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
                            onChanged: (value) {
                              cCCD = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        InputTimePicker(
                            label: 'Ngày cấp CMND/CCCD',
                            name: '',
                            hinttext: 'DD/MM/YYYY',
                            onChanged: (value) {
                              ngayCap = value;
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        InputSelect(
                            list: provinces,
                            label: 'Nơi cấp CMND/CCCD',
                            selectedOption: '',
                            onChanged: (value) {
                              noiCap = value;
                            },
                            hinttext: '--Chọn nơi cấp CCCD/CMND--'),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FutureBuilder<List<PhongBan>>(
                            future: phongBanProvider.getAllPhongBan(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final listPhongBan = snapshot.data;
                                final List<String> listString = [];
                                for (PhongBan phongBan in listPhongBan!) {
                                  listString.add(phongBan.tenPB);
                                }
                                return InputSelect(
                                    list: listString,
                                    label: 'Phòng ban',
                                    selectedOption: '',
                                    onChanged: (value) {
                                      final index = listString.indexOf(value);
                                      maPB = listPhongBan[index].maPB;
                                    },
                                    hinttext: '--Chọn phòng ban--');
                              }
                              return InputSelect(
                                  list: const [],
                                  label: 'Phòng ban',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn phòng ban--');
                            }),
                        const SizedBox(
                          width: 45,
                        ),
                        FutureBuilder<List<ChucVu>>(
                            future: chucVuProvider.getAllChucVu(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final listChucVu = snapshot.data;
                                final List<String> listString = [];
                                for (ChucVu chucVu in listChucVu!) {
                                  listString.add(chucVu.tenCV);
                                }
                                return InputSelect(
                                    list: listString,
                                    label: 'Chức vụ',
                                    selectedOption: '',
                                    onChanged: (value) {
                                      final index = listString.indexOf(value);
                                      maCV = listChucVu[index].maCV;
                                    },
                                    hinttext: '--Chọn chức vụ--');
                              }
                              return InputSelect(
                                  list: const [],
                                  label: 'Chức vụ',
                                  selectedOption: '',
                                  onChanged: (value) {},
                                  hinttext: '--Chọn chức vụ--');
                            }),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final imageUrl = await _uploadFile();

                          NhanVien? lastNhanVien =
                              await nhanVienProvider.getLastNhanVien();

                          int soThuTu = lastNhanVien != null
                              ? getLastThreeCharsAsInteger(lastNhanVien.maNV) +
                                  1
                              : 0;

                          String maNV =
                              'NV' + soThuTu.toString().padLeft(3, '0');

                          final NhanVien nhanVien = NhanVien(
                              maNV: maNV,
                              hoTen: tenNV!,
                              email: email!,
                              image: imageUrl,
                              maPB: maPB!,
                              ngaySinh: Timestamp.fromDate(ngaySinh!),
                              gioiTinh: gioiTinh!,
                              tinhTrangHonNhan: tinhTrangHonNhan!,
                              cCCD: cCCD!,
                              noiCap: noiCap!,
                              ngayCap: Timestamp.fromDate(ngayCap!),
                              maCV: maCV!,
                              noiSinh: noiSinh!,
                              diaChiThuongTru: diaChiThuongTru!,
                              diaChiTamTru: diaChiTamTru!,
                              soDienThoai: soDienThoai!,
                              danToc: danToc!,
                              tonGiao: tonGiao!,
                              quocTich: quocTich!,
                              hocVan: '12/12');

                          print(11);
                          await nhanVienProvider.addNhanVien(nhanVien);

                          print(22);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(successSnackbar);
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(faledSnackbar);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.bluedarkColor,
                      ),
                      child: const Text('Lưu',
                          style: TextStyle(
                              fontFamily: 'CeraPro', color: AppColors.white)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
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
