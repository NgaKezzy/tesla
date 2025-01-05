import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:telsa_mobile/core/di/di.dart';
import 'package:telsa_mobile/core/file_picker/file_picker_custom.dart';
import 'package:telsa_mobile/core/image_picker/image_picker_custom.dart';
import 'package:telsa_mobile/features/contract/cubit/contract_state.dart';

class ContractCubit extends Cubit<ContractState> {
  ContractCubit() : super(const ContractState());
  final Logger logger = di.get();

  Future<void> pickMultiImage() async {
    final List<XFile> images = await ImagePickerCustom.uploadMultiPhoto();

    final List<XFile> imagesOld = state.images;

    emit(state.copyWith(images: [...imagesOld, ...images]));
  }

  Future<void> pickMultiFiles() async {
    final List<XFile> files = await FilePickerCustom.pickMultipleFiles();
    final List<XFile> filesOld = state.files;

    emit(state.copyWith(files: [...filesOld, ...files]));

    for (var element in files) {
      logger.i(element.path);
      logger.i(element.name);
      logger.i(element.mimeType);
    }
  }
}
