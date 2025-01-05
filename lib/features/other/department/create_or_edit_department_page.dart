import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_cubit.dart';
import 'package:telsa_mobile/features/other/cubit/department_cubit/department_state.dart';
import 'package:telsa_mobile/features/other/models/department/department.dart';

class CreateOrEditDepartmentPage extends StatefulWidget {
  const CreateOrEditDepartmentPage({super.key, this.department});
  final Department? department;
  @override
  State<CreateOrEditDepartmentPage> createState() =>
      _CreateOrEditDepartmentPageState();
}

class _CreateOrEditDepartmentPageState
    extends State<CreateOrEditDepartmentPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  @override
  void initState() {
    if (widget.department != null) {
      _nameController.text = widget.department?.name ?? '';
      _noteController.text = widget.department?.description ?? '';
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
    _noteController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final DepartmentCubit departmentCubit = context.read<DepartmentCubit>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: widget.department != null ? 'Sửa phòng ban' : 'Thêm phòng ban',
          enableBackButton: true,
          onBackPressed: () {
            context.pop();
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tên phòng ban',
                  style: TextStyle(fontSize: 15),
                ),
                const Gap(8),
                SizedBox(
                    height: 45,
                    child: OutlineTextFormField(
                      controller: _nameController,
                      maxLines: 1,
                      hintText: 'Nhập tên phòng ban',
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      borderRadius: BorderRadius.circular(10),
                      borderRadiusFocused: BorderRadius.circular(10),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                    )),
                const Gap(16),
                const Text(
                  'Ghi chú',
                  style: TextStyle(fontSize: 15),
                ),
                const Gap(8),
                SizedBox(
                    height: 45,
                    child: OutlineTextFormField(
                      controller: _noteController,
                      maxLines: 1,
                      hintText: 'Nhập ghi chú',
                      hintStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w400),
                      borderRadius: BorderRadius.circular(10),
                      borderRadiusFocused: BorderRadius.circular(10),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 10),
                    )),
                const Spacer(),
                SolidButton(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      if (widget.department != null) {
                        departmentCubit.updateDepartment(
                            widget.department?.id ?? 0,
                            _nameController.text.trim(),
                            _nameController.text.trim());
                      } else {
                        departmentCubit.createDepartment(
                            name: _nameController.text.trim(),
                            description: _noteController.text.trim());
                      }
                    },
                    title: widget.department != null ? 'Lưu' : 'Tạo'),
                const Gap(50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
