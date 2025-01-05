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
import 'package:telsa_mobile/features/customer/cubit/customer_cubit.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';
import 'package:telsa_mobile/features/other/employee/create_or_edit_employee_page.dart';

class CreateOrEditCustomerPage extends StatefulWidget {
  const CreateOrEditCustomerPage({super.key, this.customer});

  final Customer? customer;

  @override
  State<CreateOrEditCustomerPage> createState() =>
      _CreateOrEditCustomerPageState();
}

class _CreateOrEditCustomerPageState extends State<CreateOrEditCustomerPage> {
  final CustomerCubit customerCubit = di.get();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  XFile? _image;
  String? selectedDate;
  Gender? selectedGender = Gender.male;

  Future<void> _pickImage() async {
    XFile? image =
        await ImagePickerCustom.uploadOnePhoto(); // Gọi phương thức static
    setState(() {
      _image = image;
    });
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

  @override
  void initState() {
    if (widget.customer != null) {
      print('có data');
      nameController.text = widget.customer?.name ?? '';
      codeController.text = widget.customer?.code ?? '';
      phoneController.text = widget.customer?.phoneNumber ?? '';
      emailController.text = widget.customer?.email ?? '';
      addressController.text = widget.customer?.address ?? "";
// descriptionController.text= widget.customer?.
      selectedDate = widget.customer?.dob;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.customer == null ? 'Thêm khách hàng' : 'Sửa khách hàng',
        enableBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: SizedBox(
            // height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                _buildAvatar(),
                const Gap(16),
                _buildForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    if (widget.customer?.avatar == '' || widget.customer?.avatar == null) {
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
          '${UrlConstants.host}/${widget.customer?.avatar ?? ''}';
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
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
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
        ),
      );
    }
  }

  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _buildTitle('Họ và tên'),
        OutlineTextFormField(
          controller: nameController,
          fillColor: AppColors.white,
          hintText: 'Nhập họ và tên',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
        _buildTitle('Mã khách hàng'),
        OutlineTextFormField(
          controller: codeController,
          fillColor: AppColors.white,
          hintText: 'Nhập mã khách hàng',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
        _buildTitle('Số điện thoại'),
        OutlineTextFormField(
          controller: phoneController,
          fillColor: AppColors.white,
          hintText: 'Nhập số điện thoại',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
        _buildTitle('Email'),
        OutlineTextFormField(
          controller: emailController,
          fillColor: AppColors.white,
          hintText: 'Nhập email',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
        _buildTitle('Địa chỉ'),
        OutlineTextFormField(
          controller: addressController,
          fillColor: AppColors.white,
          hintText: 'Nhập địa chỉ',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
        _buildTitle('Ghi chú'),
        OutlineTextFormField(
          controller: descriptionController,
          fillColor: AppColors.white,
          hintText: 'Nhập ghi chú',
          hintStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.grey,
          ),
        ),
        const Gap(16),
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
        const Gap(16),
        SolidButton(
          onTap: () {
            if (widget.customer != null) {
              customerCubit.updateCustomer(
                  widget.customer?.id ?? -1,
                  nameController.text.trim(),
                  codeController.text.trim(),
                  phoneController.text.trim(),
                  emailController.text.trim(),
                  addressController.text.trim(),
                  selectedDate ?? '',
                  descriptionController.text.trim(),
                  _image?.path);
            } else {
              customerCubit.createCustomer(
                  nameController.text.trim(),
                  codeController.text.trim(),
                  phoneController.text.trim(),
                  emailController.text.trim(),
                  addressController.text.trim(),
                  selectedDate ?? '',
                  descriptionController.text.trim(),
                  _image?.path);
            }
          },
          title: 'Lưu',
        ),
        const Gap(80),
      ],
    );
  }
}
