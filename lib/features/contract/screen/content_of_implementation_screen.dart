import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:telsa_mobile/common/widgets/app_bar/custom_app_bar.dart';
import 'package:telsa_mobile/common/widgets/button/solid_button.dart';
import 'package:telsa_mobile/common/widgets/text_field/out_line_text_field.dart';
import 'package:telsa_mobile/core/color/app_color.dart';
import 'package:telsa_mobile/features/contract/cubit/contract_cubit.dart';
import 'package:telsa_mobile/features/contract/cubit/contract_state.dart';
import 'package:telsa_mobile/main.dart';

class ContentOfImplementationScreen extends StatelessWidget {
  const ContentOfImplementationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        enableBackButton: true,
        onBackPressed: () {
          context.pop();
        },
        title: 'Nội dung thực hiện',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nội dung thực hiện',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const Gap(10),
              const OutlineTextFormField(
                maxLines: 3,
                fillColor: AppColors.white,
                hintText: 'Nhập nội dung thực hiện',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey,
                ),
              ),
              const Gap(20),
              _buildImage(context),
              const Gap(10),
              _buildFile(context),
              const Gap(10),
              _buildComment(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final ContractCubit contractCubit = context.read<ContractCubit>();
    return BlocBuilder<ContractCubit, ContractState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Hình ảnh',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () async {
                    contractCubit.pickMultiImage();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            state.images.isEmpty
                ? const SizedBox()
                : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisExtent: 70,
                            crossAxisCount: 4,
                            mainAxisSpacing: 10),
                    itemCount: state.images.length,
                    itemBuilder: (context, index) => ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 50,
                        child: Image.file(
                          File(state.images[index].path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
          ],
        );
      },
    );
  }

  Widget _buildFile(BuildContext context) {
    final ContractCubit contractCubit = context.read<ContractCubit>();

    return BlocBuilder<ContractCubit, ContractState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'File đính kèm',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () async {
                    contractCubit.pickMultiFiles();
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.primary),
                    child: const Icon(
                      Icons.add,
                      color: AppColors.white,
                    ),
                  ),
                )
              ],
            ),
            const Gap(10),
            state.images.isEmpty
                ? const SizedBox()
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.files.length,
                    separatorBuilder: (context, index) => const Gap(10),
                    itemBuilder: (context, index) => Row(
                      children: [
                        Container(
                          height: 50,
                          color: Colors.red,
                          width: 50,
                        ),
                        const Gap(10),
                        Expanded(
                          child: Text(
                            state.files[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  )
          ],
        );
      },
    );
  }

  Widget _buildComment(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Bình luận',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      const Row(
        children: [CircleAvatar(), Gap(10), Text('Hoàng Soen')],
      ),
      const Gap(10),
      const Text('Đã xác nhận, không có vấn đề phát sinh'),
      const Gap(5),
      const Text('04/07/2024 15:30'),
      const Gap(10),
      Row(
        children: [
          const Flexible(
            child: OutlineTextFormField(
              hintText: 'Viết comment',
            ),
          ),
          const Gap(10),
          SizedBox(
            width: 80,
            child: SolidButton(
              title: 'Gửi',
              onTap: () {},
            ),
          )
        ],
      )
    ]);
  }
}
