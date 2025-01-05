import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'contract_state.g.dart';

enum ContractStatus { init, start, loading, success, error }

@CopyWith()
class ContractState extends Equatable {
  const ContractState(
      {this.images = const [],
      this.status = ContractStatus.init,
      this.files = const []});
  final List<XFile> images;
  final List<XFile> files;
  final ContractStatus status;
  @override
  List<Object> get props => [images, status, files];
}
