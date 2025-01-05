import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:telsa_mobile/common/models/response/base_response.dart';
import 'package:telsa_mobile/core/constants/url_constants.dart';
import 'package:telsa_mobile/features/customer/model/customer.dart';

part 'customer_service.g.dart';

@RestApi(baseUrl: UrlConstants.baseUrl)
abstract class CustomerService {
  factory CustomerService(Dio dio) = _CustomerService;

  @POST(UrlConstants.customer)
  @MultiPart()
  Future<BaseResponse> createCustomer(
    @Part(name: "name") String name,
    @Part(name: "code") String code,
    @Part(name: "phone_number") String phoneNumber,
    @Part(name: "email") String email,
    @Part(name: "address") String address,
    @Part(name: "dob") String dob,
    @Part(name: "description") String description,
    @Part(name: "avatar") File? avatar,
  );

  @GET(UrlConstants.customer)
  Future<BaseResponse<List<Customer>>> getAllCustomer(
    @Query("page") int? page,
    @Query("limit") int? limit,
  );

  @DELETE('${UrlConstants.customer}/{id}')
  Future<BaseResponse> deleteCustomer(@Path() int id);

  @PUT('${UrlConstants.customer}/{id}')
  @MultiPart()
  Future<BaseResponse> updateCustomer(
    @Path() int id,
    @Part(name: "name") String name,
    @Part(name: "code") String code,
    @Part(name: "phone_number") String phoneNumber,
    @Part(name: "email") String email,
    @Part(name: "address") String address,
    @Part(name: "dob") String dob,
    @Part(name: "description") String description,
    @Part(name: "avatar") File? avatar,
  );
}
