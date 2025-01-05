import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:telsa_mobile/features/other/models/product/product.dart';
part 'product_state.g.dart';

enum ProductStatus { init, start, loading, success, error }

@CopyWith()
class ProductState extends Equatable {
  const ProductState(
      {this.products = const [], this.status = ProductStatus.init});
  final List<Product> products;
  final ProductStatus status;
  @override
  List<Object> get props => [products, status];
}
