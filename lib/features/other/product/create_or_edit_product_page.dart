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
import 'package:telsa_mobile/features/other/cubit/product_cubit/product_cubit.dart';
import 'package:telsa_mobile/features/other/models/employee/employee.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';

class CreateOrEditProductPage extends StatefulWidget {
  const CreateOrEditProductPage({super.key, this.product});
  final Product? product;

  @override
  State<CreateOrEditProductPage> createState() =>
      _CreateOrEditProductPageState();
}

class _CreateOrEditProductPageState extends State<CreateOrEditProductPage> {
  final TextEditingController deviceNameController = TextEditingController();
  final TextEditingController deviceCodeController = TextEditingController();
  final TextEditingController deviceUnitController = TextEditingController();
  final TextEditingController devicePriceController = TextEditingController();
  final TextEditingController deviceBrandController = TextEditingController();
  final TextEditingController deviceSpecificationController =
      TextEditingController();
  final TextEditingController deviceDescriptionController =
      TextEditingController();

  XFile? _image;

  Future<void> _pickImage() async {
    XFile? image =
        await ImagePickerCustom.uploadOnePhoto(); // Gọi phương thức static
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    if (widget.product != null) {
      setState(() {
        deviceNameController.text = widget.product?.name ?? '';
        deviceCodeController.text = widget.product?.code ?? '';
        deviceUnitController.text = widget.product?.unit ?? '';
        devicePriceController.text = widget.product?.price.toString() ?? '';
        deviceBrandController.text = widget.product?.branch ?? '';
        deviceSpecificationController.text =
            widget.product?.specification ?? '';
        deviceDescriptionController.text = widget.product?.description ?? '';
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    deviceNameController.clear();
    deviceCodeController.clear();
    deviceUnitController.clear();
    devicePriceController.clear();
    deviceBrandController.clear();
    deviceSpecificationController.clear();
    deviceDescriptionController.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ProductCubit productCubit = di.get();
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
          title: 'Thêm nhân sự',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildImage(),
                _buildTitleAndTextField(
                    controller: deviceNameController,
                    tiele: 'Tên thiết bị',
                    hintText: 'Nhập tên thiết bị'),
                _buildTitleAndTextField(
                    controller: deviceCodeController,
                    tiele: 'Mã thiết bị',
                    hintText: 'Nhập mã thiết bị'),
                Row(
                  children: [
                    Expanded(
                      child: _buildTitleAndTextField(
                          controller: deviceUnitController,
                          tiele: 'Đơn vị tính',
                          hintText: 'Nhập đơn vị'),
                    ),
                    const Gap(16),
                    Expanded(
                      child: _buildTitleAndTextField(
                          controller: devicePriceController,
                          textInputType: TextInputType.number,
                          tiele: 'Đơn giá',
                          hintText: 'Nhập đơn giá'),
                    ),
                  ],
                ),
                const Gap(8),
                _buildTitleAndTextField(
                    controller: deviceBrandController,
                    tiele: 'Nhãn hiệu',
                    hintText: 'Nhập nhãn hiệu'),
                _buildTitleAndTextField(
                    controller: deviceSpecificationController,
                    tiele: 'Quy cách',
                    hintText: 'Nhập quy cách'),
                _buildTitleAndTextField(
                    controller: deviceDescriptionController,
                    textInputAction: TextInputAction.done,
                    tiele: 'Ghi chú',
                    hintText: 'Nhập ghi chú'),
                const Gap(20),
                SolidButton(
                    onTap: () {
                      if (widget.product != null) {
                        productCubit.updateProduct(
                          widget.product?.id ?? -1,
                          deviceNameController.text.trim(),
                          deviceCodeController.text.trim(),
                          1,
                          devicePriceController.text.trim(),
                          deviceUnitController.text.trim(),
                          deviceSpecificationController.text.trim(),
                          deviceDescriptionController.text.trim(),
                          _image?.path,
                        );
                      } else {
                        productCubit.createProduct(
                          deviceNameController.text.trim(),
                          deviceCodeController.text.trim(),
                          1,
                          devicePriceController.text.trim(),
                          deviceUnitController.text.trim(),
                          deviceSpecificationController.text.trim(),
                          deviceDescriptionController.text.trim(),
                          _image?.path,
                        );
                      }
                    },
                    title: widget.product != null ? 'Lưu' : 'Tạo'),
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
      String? suffixText,
      String hintText = '',
      TextInputAction? textInputAction = TextInputAction.next,
      TextInputType? textInputType,
      required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(tiele),
        const Gap(4),
        SizedBox(
            height: 45,
            child: OutlineTextFormField(
              controller: controller,
              suffixText: suffixText,
              onChanged: (p0) {},
              textInputAction: textInputAction,
              keyboardType: textInputType,
              maxLines: 1,
              hintText: hintText,
              hintStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              borderRadius: BorderRadius.circular(10),
              borderRadiusFocused: BorderRadius.circular(10),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            )),
        const Gap(16),
      ],
    );
  }

  Widget _buildImage() {
    if (widget.product?.picture == '' || widget.product?.picture == null) {
      return Center(
          child: Column(
        children: [
          _image == null
              ? const Icon(
                  Icons.image_outlined,
                  size: 100,
                  color: AppColors.primary,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
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
          '${UrlConstants.host}/${widget.product?.picture ?? ''}';
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
}
