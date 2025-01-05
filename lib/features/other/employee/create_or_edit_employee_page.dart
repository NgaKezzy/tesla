import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/core/constants/url_constants.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/image_picker/image_picker_custom.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/employee_cubit/employee_cubit.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';

enum Gender { male, female }

class CreateOrEditEmployeePage extends StatefulWidget {
  const CreateOrEditEmployeePage({super.key, this.employee});

  final Employee? employee;

  @override
  State<CreateOrEditEmployeePage> createState() =>
      _CreateOrEditEmployeePageState();
}

class _CreateOrEditEmployeePageState extends State<CreateOrEditEmployeePage> {
  final EmployeeCubit employeeCubit = di.get();
  final DepartmentCubit departmentCubit = di.get();
  List<Department> departments = [];
  XFile? _image;
  Gender? selectedGender = Gender.male;
  String? selectedDate;
  Department? dropdownValue;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    initialData();
    super.initState();
  }

  Future<void> initialData() async {
    await departmentCubit.getAllDepartment();
    setState(
      () {
        departments = departmentCubit.state.departments;

        if (widget.employee != null) {
          for (var element in departments) {
            if (element.id == widget.employee?.departmentData.id) {
              dropdownValue = element;
            }
          }
        } else {
          dropdownValue = departments.first;
        }
      },
    );
    if (widget.employee != null) {
      fullNameController.text = widget.employee?.fullName ?? '';
      codeController.text = widget.employee?.code ?? '';
      positionController.text = widget.employee?.position ?? '';
      phoneController.text = widget.employee?.phoneNumber ?? '';
      emailController.text = widget.employee?.email ?? '';
      addressController.text = widget.employee?.address ?? '';
      descriptionController.text = widget.employee?.description ?? '';
      usernameController.text = widget.employee?.username ?? '';
      selectedDate = widget.employee?.dob;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      locale: const Locale('vi', "VN"),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      helpText: 'Chọn ngày sinh',
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  Future<void> _pickImage() async {
    XFile? image =
        await ImagePickerCustom.uploadOnePhoto(); // Gọi phương thức static
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          enableBackButton: true,
          onBackPressed: () {
            context.pop();
          },
          title: widget.employee != null
              ? 'Sửa thông tin nhân sự'
              : 'Thêm nhân sự',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAvatar(),
                _buildInfo(),
                const Gap(30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle('Cho phép truy cập'),
                    Transform.scale(
                      scale: 0.9,
                      child: Switch(
                        onChanged: (value) {},
                        value: true,
                        activeColor: AppColors.white,
                        activeTrackColor: AppColors.primary,
                        inactiveThumbColor: Colors.redAccent,
                        inactiveTrackColor: Colors.orange,
                      ),
                    )
                  ],
                ),
                const Gap(8),
                _buildTitleAndTextField(
                    controller: usernameController,
                    tiele: 'Tên đăng nhập',
                    hintText: 'Nhập tên đăng nhập'),
                widget.employee == null
                    ? _buildTitleAndTextField(
                        controller: passwordController,
                        tiele: 'Mật khẩu',
                        hintText: 'Nhập mật khẩu')
                    : const SizedBox(),
                const Gap(30),
                SolidButton(
                    onTap: () {
                      if (widget.employee != null) {
                        // sửa tài nhân sự
                        employeeCubit.updateEmployee(
                            id: widget.employee?.id ?? -1,
                            fullName: fullNameController.text.trim(),
                            isCreateAccount: true,
                            username: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                            code: codeController.text.trim(),
                            departmentId: dropdownValue?.id ?? 1,
                            position: positionController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            email: emailController.text.trim(),
                            gender: selectedGender == Gender.male
                                ? 'MALE'
                                : 'FEMALE',
                            address: addressController.text.trim(),
                            description: descriptionController.text.trim(),
                            dob: selectedDate.toString(),
                            avatar: _image?.path);
                      } else {
                        // tạo nhân sự
                        employeeCubit.createEmployee(
                            fullName: fullNameController.text.trim(),
                            isCreateAccount: true,
                            username: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                            code: codeController.text.trim(),
                            departmentId: dropdownValue?.id ?? 1,
                            position: positionController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            email: emailController.text.trim(),
                            gender: selectedGender == Gender.male
                                ? 'MALE'
                                : 'FEMALE',
                            address: addressController.text.trim(),
                            description: descriptionController.text.trim(),
                            dob: selectedDate.toString(),
                            avatar: _image?.path);
                      }
                    },
                    title: widget.employee != null ? 'Lưu' : 'Tạo'),
                const Gap(50)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(String tiele) {
    return Text(
      tiele,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildTitleAndTextField(
      {required String tiele,
      required String hintText,
      required TextEditingController controller,
      TextInputType? textInputType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(tiele),
        const Gap(4),
        SizedBox(
          height: 45,
          child: OutlineTextFormField(
            controller: controller,
            textInputAction: TextInputAction.next,
            keyboardType: textInputType,
            maxLines: 1,
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            borderRadius: BorderRadius.circular(10),
            borderRadiusFocused: BorderRadius.circular(10),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          ),
        ),
        const Gap(16),
      ],
    );
  }

  Widget _buildAvatar() {
    if (widget.employee?.avatar == '' || widget.employee?.avatar == null) {
      return Center(
          child: Column(
        children: [
          _image == null
              ? const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: AppColors.primary,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          const Gap(12),
          GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              child: const Text(
                'Chọn ảnh',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          )
        ],
      ));
    } else {
      String linkImage =
          '${UrlConstants.host}/${widget.employee?.avatar ?? ''}';
      print(linkImage);
      print('-----------------------------');
      return Center(
          child: Column(
        children: [
          _image != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(
                      File(_image!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(
                      linkImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
          const Gap(12),
          GestureDetector(
            onTap: () {
              _pickImage();
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary,
              ),
              child: const Text(
                'Chọn ảnh',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          )
        ],
      ));
    }
  }

  Widget _buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle('Phòng ban'),
        const Gap(4),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.lightGrey,
          ),
          child: departments.isEmpty || dropdownValue == null
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Phòng ban trống')),
                )
              : DropdownButton<Department>(
                  value: dropdownValue,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10),
                  dropdownColor: AppColors.lightGrey,
                  onChanged: (Department? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: departments
                      .map<DropdownMenuItem<Department>>((Department value) {
                    return DropdownMenuItem<Department>(
                      value: value,
                      child: Text(value.name),
                    );
                  }).toList(),
                  underline: Container(),
                  style: const TextStyle(color: Colors.black),
                ),
        ),
        const Gap(16),
        _buildTitleAndTextField(
            controller: fullNameController,
            tiele: 'Tên nhân sự',
            hintText: 'Nhập tên nhân sự'),
        _buildTitleAndTextField(
            controller: codeController,
            tiele: 'Mã nhân sự',
            hintText: 'Nhập mã nhân sự'),
        _buildTitleAndTextField(
            controller: positionController,
            tiele: 'Chức vụ',
            hintText: 'Nhập chúc vụ'),
        _buildTitleAndTextField(
            controller: phoneController,
            textInputType: const TextInputType.numberWithOptions(),
            tiele: 'Số điện thoại',
            hintText: 'Nhập số điện thoại'),
        _buildTitleAndTextField(
            controller: emailController,
            tiele: 'Email',
            hintText: 'Nhập Email'),
        _buildTitleAndTextField(
            controller: addressController,
            tiele: 'Địa chỉ',
            hintText: 'Nhập Địa chỉ'),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle('Ngày sinh'),
                  const Gap(4),
                  GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.lightGrey),
                      child: Text(selectedDate == null
                          ? 'Chọn ngày sinh'
                          : selectedDate.toString().split('T')[0]),
                    ),
                  ),
                  const Gap(16),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitle('Giới tính'),
                  const Gap(4),
                  Row(
                    children: [
                      Radio<Gender>(
                        value: Gender.male,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      const Text("Nam"),
                      Radio<Gender>(
                        value: Gender.female,
                        groupValue: selectedGender,
                        onChanged: (Gender? value) {
                          setState(() {
                            selectedGender = value;
                          });
                        },
                      ),
                      const Text("Nữ"),
                    ],
                  ),
                  const Gap(16),
                ],
              ),
            )
          ],
        ),
        _buildTitleAndTextField(
            controller: descriptionController,
            tiele: 'Ghi chú',
            hintText: 'Nhập ghi chú'),
      ],
    );
  }
}
