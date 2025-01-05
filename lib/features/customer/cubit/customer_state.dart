import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';
part 'customer_state.g.dart';

enum CustomerStatus { init, start, loading, success, error }

@CopyWith()
class CustomerState extends Equatable {
  const CustomerState(
      {this.status = CustomerStatus.init, this.customers = const []});
  final CustomerStatus status;
  final List<Customer> customers;

  @override
  List<Object> get props => [status, customers];
}
