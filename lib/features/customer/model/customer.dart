import 'package:json_annotation/json_annotation.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer {
  final int id;
  final String name;
  final String code;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String? address;
  final String? dob;
  final String? email;
  final String? avatar;

  Customer({
    required this.id,
    required this.name,
    required this.code,
    required this.phoneNumber,
    this.address,
    this.dob,
    this.email,
    this.avatar,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

var fakeList = [
  Customer(
    id: 1,
    name: 'Nguyễn Văn A',
    code: 'KH001',
    phoneNumber: '0123456789',
    address: 'Hà Nội',
    dob: '01/01/1990',
    email: 'A@gmail.com',
  ),
  Customer(
    id: 2,
    name: 'Nguyễn Văn B',
    code: 'KH002',
    phoneNumber: '0123456789',
    address: 'Hà Nội',
    dob: '01/01/1990',
    email: 'B@gmail.com',
  ),
  Customer(
    id: 3,
    name: 'Nguyễn Văn C',
    code: 'KH003',
    phoneNumber: '0123456789',
    address: 'Hà Nội',
    dob: '01/01/1990',
    email: 'C@gmail.com',
  ),
];
